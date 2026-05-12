# Kế hoạch hoàn thiện chức năng mục 11–15 để đạt 100% yêu cầu

## 1. Mục tiêu

Hoàn thiện toàn bộ các chức năng còn thiếu hoặc mới đáp ứng một phần trong tài liệu thực hành từ mục 11 đến hết mục 15, đồng thời xử lý lỗi người dùng đã phát hiện: khi chọn phân loại sách trên màn hình chi tiết sản phẩm, phân loại đó chưa được lưu và chưa hiển thị trong giỏ hàng, màn hình đặt hàng, lịch sử đơn hàng và chi tiết đơn hàng.

Phạm vi chính:

- Mục 11: Trang chủ, danh mục, sản phẩm phổ biến, tìm kiếm, chi tiết sản phẩm.
- Mục 12: Giỏ hàng, đặt hàng, mã giảm giá, phí vận chuyển, phương thức thanh toán, đơn hàng của người dùng.
- Mục 13: Danh sách yêu thích.
- Mục 14: Tìm kiếm/xem sản phẩm theo thương hiệu/nhà xuất bản và màn hình cửa hàng.
- Mục 15: Cài đặt ứng dụng: giao diện, ngôn ngữ, cỡ chữ và áp dụng ở cấp toàn app.

## 2. Hiện trạng tổng quan

| Mục | Trạng thái hiện tại | Vấn đề cần hoàn thiện |
| --- | --- | --- |
| 11 | Đáp ứng phần lớn | Chạm vào danh mục ở Home chưa điều hướng/lọc sản phẩm; một số TODO ở luồng category/product image. |
| 12 | Đáp ứng một phần | Chưa lưu phân loại sách vào cart/order; mã giảm giá chưa hoạt động; phí vận chuyển đang cố định; phương thức thanh toán chọn ở UI chưa được truyền/lưu đầy đủ vào order. |
| 13 | Gần như đáp ứng | Cần rà soát regression sau khi thay đổi cart/order/product model, bảo đảm wishlist vẫn điều hướng đúng. |
| 14 | Đáp ứng một phần | Đang có hai nhóm màn hình store và mystore trùng lặp; một số onTap còn TODO; brand/category navigation chưa thống nhất. |
| 15 | Đáp ứng một phần | Settings mới có theme/language ở controller; app root chưa áp dụng đầy đủ themeMode/locale; chưa có font size setting. |

## 3. Nguyên tắc triển khai

1. Ưu tiên sửa dữ liệu lõi trước UI: cart item, order item, coupon, shipping, settings state.
2. Giữ tương thích dữ liệu Firestore cũ để app không lỗi với cart/order đã tồn tại.
3. Không xóa dữ liệu cũ ngay; nếu cần đổi schema, thêm migration/backward-compatible parser.
4. Mỗi giai đoạn phải chạy `flutter analyze` và kiểm thử thủ công các luồng chính.
5. Ưu tiên dùng các model rõ ràng thay vì truyền `Map<String, int>` để tránh mất thông tin như phân loại sách.

## 4. Giai đoạn 1: Sửa lỗi phân loại sách không đi theo giỏ hàng/đơn hàng

Đây là lỗi ưu tiên cao vì ảnh hưởng trực tiếp luồng mua hàng.

### 4.1. Thiết kế dữ liệu CartItem mới

Tạo model mới:

- File đề xuất: `lib/data/models/cart_item_model.dart`
- Class đề xuất: `CartItemModel`
- Trường dữ liệu:
  - `id`: mã dòng giỏ hàng, ví dụ `bookId_formatName`.
  - `bookId`: mã sách.
  - `format`: enum `BookFormat` hoặc string lưu Firestore.
  - `quantity`: số lượng.
  - `createdAt`, `updatedAt`: thời gian tạo/cập nhật.

Lý do cần `id` riêng: cùng một sách có thể được thêm nhiều lần với các phân loại khác nhau, ví dụ:

- Sách A - Bìa mềm - số lượng 1.
- Sách A - Bìa cứng - số lượng 2.

Nếu vẫn dùng `bookId -> quantity`, hai dòng này sẽ bị gộp sai.

### 4.2. Cập nhật Firestore cart schema

Hiện tại cart nằm ở:

```text
users/{uid}/cartItems/{bookId}
```

Schema mới đề xuất:

```text
users/{uid}/cartItems/{lineId}
```

Ví dụ document:

```json
{
  "bookId": "book_001",
  "format": "paperback",
  "quantity": 2,
  "createdAt": "serverTimestamp",
  "updatedAt": "serverTimestamp"
}
```

Backward compatibility:

- Nếu document cũ chỉ có `quantity` và document id là `bookId`, parser phải tự hiểu:
  - `bookId = doc.id`
  - `format = paperback` hoặc format đầu tiên trong `BookModel.availableFormats` nếu truy xuất được.
- Không bắt buộc migration ngay lần đầu; chỉ cần app đọc không lỗi.

Files cần sửa:

- `lib/data/services/cart_firestore_service.dart`
- `lib/data/repositories/cart_repository.dart`
- `lib/controller/cart_controller.dart`
- `lib/screens/cart/cart_overview_screen.dart`
- `lib/screens/cart/cart_screen.dart` nếu vẫn còn được dùng hoặc còn route.

### 4.3. Cập nhật CartController

Hiện tại:

```dart
RxMap<String, int> items // bookId -> quantity
```

Cần đổi sang một trong hai hướng:

#### Hướng khuyến nghị

```dart
RxList<CartItemModel> items
```

Thêm các hàm:

- `String buildLineId(String bookId, BookFormat format)`
- `int quantityFor(String bookId, BookFormat format)`
- `Future<void> addBook(BookModel book, {required BookFormat format, int quantity = 1})`
- `Future<void> increase(CartItemModel item)`
- `Future<void> decrease(CartItemModel item)`
- `Future<void> remove(CartItemModel item)`
- `double totalPrice(BookCatalogController catalog)`
- `int get totalItems`

### 4.4. Cập nhật ProductDetailController

Hiện trạng đã có:

- `selectedFormat`
- `selectFormat(format)`

Cần sửa `addToCart(book)` để truyền format:

```dart
cartController.addBook(
  book,
  format: selectedFormat.value,
  quantity: quantity.value,
);
```

Files cần sửa:

- `lib/controller/product_detail_controller.dart`
- `lib/screens/product/product_detail_screen.dart` nếu nút Add to Cart đang gọi hàm cũ.

Acceptance criteria:

- Chọn Bìa mềm rồi thêm vào giỏ: giỏ hàng hiển thị "Phân loại: Bìa mềm".
- Chọn Bìa cứng của cùng sách rồi thêm vào giỏ: giỏ hàng có 2 dòng riêng biệt.
- Tăng/giảm/xóa từng dòng không ảnh hưởng dòng phân loại khác.

### 4.5. Cập nhật Cart UI

Files cần sửa:

- `lib/screens/cart/cart_overview_screen.dart`
- `lib/screens/cart/cart_screen.dart` nếu route còn dùng.

UI cần thêm:

- Hiển thị dưới tên sách:
  - `Phân loại: Bìa mềm`
  - `Phân loại: Bìa cứng`
  - `Phân loại: Ebook`
- Nút tăng/giảm/xóa phải thao tác theo `CartItemModel.id`, không thao tác chỉ theo `bookId`.
- Tổng tiền phải tính theo từng dòng cart item.

## 5. Giai đoạn 2: Chuẩn hóa OrderItem và lưu đầy đủ thông tin đặt hàng

### 5.1. Cập nhật OrderItemModel

Hiện tại order item chỉ có:

- `bookId`
- `title`
- `unitPrice`
- `quantity`

Cần thêm:

- `format`: string/enum name, ví dụ `paperback`.
- `formatLabel`: label hiển thị, ví dụ `Bìa mềm`.
- `coverImage`: snapshot ảnh bìa tại thời điểm đặt hàng.
- `author`: snapshot tác giả.
- `subtotal`: nên lưu hoặc tính nhất quán.

File cần sửa:

- `lib/data/models/order_model.dart`

Backward compatibility:

- Nếu order cũ thiếu `format`, hiển thị `Không xác định` hoặc `Bìa mềm` theo default.
- Không để `fromMap` bị crash khi field mới chưa tồn tại.

### 5.2. Cập nhật OrderModel

Cần bổ sung các trường phục vụ mục 12:

- `subtotal`: tổng tiền hàng trước giảm giá/phí ship.
- `shippingFee`: phí vận chuyển.
- `discountAmount`: số tiền giảm.
- `couponCode`: mã giảm giá đã áp dụng, nullable.
- `paymentMethod`: lưu đúng phương thức người dùng chọn.
- `shippingAddressId`: id địa chỉ đã chọn, nếu có.

Giữ `total` là tổng cuối cùng phải thanh toán để không phá UI cũ.

### 5.3. Cập nhật CheckoutController

File cần sửa:

- `lib/controller/checkout_controller.dart`

Cần thay đổi chữ ký `placeOrder`:

```dart
Future<OrderModel?> placeOrder({
  required CartController cartController,
  required double subtotal,
  required double shippingFee,
  required double discountAmount,
  required double total,
  required String paymentMethod,
  String? couponCode,
  String? shippingAddressId,
})
```

Khi tạo `OrderItemModel`, phải lấy format từ `CartItemModel`:

- `format: item.format.name`
- `formatLabel: bookFormatLabel(item.format)`

Acceptance criteria:

- Màn hình xác nhận đơn hàng lưu đúng phân loại từng sản phẩm.
- Chi tiết đơn hàng hiển thị phân loại đã chọn.
- Lịch sử đơn hàng không crash với đơn cũ.
- Phương thức thanh toán hiển thị đúng theo lựa chọn: COD/chuyển khoản/ví nếu có.

## 6. Giai đoạn 3: Hoàn thiện màn hình Order Review, mã giảm giá, phí vận chuyển, thanh toán

### 6.1. Hoàn thiện Coupon

Hiện tại màn hình order review có UI mã giảm giá nhưng button báo chưa hỗ trợ.

Cần thêm model/service/repository/controller:

- `lib/data/models/coupon_model.dart`
- `lib/data/services/coupon_firestore_service.dart`
- `lib/data/repositories/coupon_repository.dart`
- `lib/controller/coupon_controller.dart`

Firestore collection đề xuất:

```text
coupons/{couponId}
```

Field đề xuất:

```json
{
  "code": "SALE10",
  "discountType": "percent",
  "value": 10,
  "maxDiscount": 50000,
  "minOrderValue": 100000,
  "active": true,
  "startAt": "timestamp",
  "endAt": "timestamp",
  "usageLimit": 100,
  "usedCount": 0,
  "perUserLimit": 1
}
```

Logic cần có:

- Chuẩn hóa code uppercase/trim.
- Kiểm tra active.
- Kiểm tra thời hạn.
- Kiểm tra đơn tối thiểu.
- Tính giảm giá theo percent/fixed.
- Không cho giảm quá `maxDiscount`.
- Khi đặt hàng thành công mới tăng `usedCount`.

Files cần sửa:

- `lib/screens/order/order_overview_screen.dart`
- `lib/bindings/shopping_binding.dart`
- `lib/seed_firestore_app.dart` nếu muốn seed coupon mẫu.

Acceptance criteria:

- Nhập mã hợp lệ thì tổng tiền giảm đúng.
- Nhập mã sai/hết hạn/chưa đạt đơn tối thiểu thì báo lỗi rõ ràng.
- Đặt hàng xong order lưu `couponCode` và `discountAmount`.

### 6.2. Hoàn thiện phí vận chuyển

Hiện tại `shippingFee = 0.0` cố định.

Có thể triển khai theo mức đơn giản nhưng đáp ứng yêu cầu:

- Dưới 300.000đ: phí ship 30.000đ.
- Từ 300.000đ đến dưới 700.000đ: phí ship 15.000đ.
- Từ 700.000đ: miễn phí ship.

Hoặc tính theo tỉnh/thành nếu muốn nâng cao sau.

File/service đề xuất:

- `lib/data/services/shipping_fee_service.dart`

API đơn giản:

```dart
class ShippingFeeService {
  double calculate({required double subtotal, AddressModel? address});
}
```

Files cần sửa:

- `lib/screens/order/order_overview_screen.dart`
- `lib/controller/checkout_controller.dart`
- `lib/data/models/order_model.dart`

Acceptance criteria:

- Phí vận chuyển thay đổi theo subtotal.
- Tổng thanh toán = subtotal + shippingFee - discountAmount.
- Order lưu `shippingFee`.

### 6.3. Lưu phương thức thanh toán đúng

Hiện trạng UI có `paymentMethod = 'cash'`/`bank`, nhưng `CheckoutController` đang dùng default `COD` hoặc chưa nhận đúng value.

Chuẩn hóa enum/string:

- `COD`: thanh toán khi nhận hàng.
- `BANK_TRANSFER`: chuyển khoản.
- `MOMO` hoặc `E_WALLET`: nếu có ví điện tử.

Cần sửa:

- UI order review map value từ radio sang constant chuẩn.
- `CheckoutController.placeOrder` nhận `paymentMethod`.
- `OrderModel.paymentMethod` lưu đúng.
- `ordered_detail_screen.dart` hiển thị label theo constant.

Acceptance criteria:

- Chọn chuyển khoản thì order detail hiển thị "Chuyển khoản".
- Chọn COD thì order detail hiển thị "Tiền mặt khi nhận hàng".

## 7. Giai đoạn 4: Hoàn thiện mục 11 - category từ Home và sản phẩm theo danh mục

### 7.1. Wire onTap danh mục ở Home

Hiện tại `home_screen.dart` có TODO khi nhấn category.

Cần làm:

- Khi nhấn category trên Home, điều hướng đến màn hình sản phẩm theo danh mục/subcategory.
- Có thể tận dụng `ProductBySubcategoryScreen` nếu phù hợp.
- Truyền argument rõ ràng:

```dart
Get.toNamed(
  AppRoutes.productBySubcategory,
  arguments: {
    'categoryId': category.id,
    'categoryName': category.name,
  },
);
```

Nếu `AppRoutes.productBySubcategory` chưa có, thêm route.

Files cần sửa:

- `lib/routes/app_routes.dart`
- `lib/routes/app_pages.dart`
- `lib/screens/home/home_screen.dart`
- `lib/screens/product/product_by_subcategory_screen.dart`
- `lib/controller/book_catalog_controller.dart` hoặc `mystore_controller.dart` nếu cần filter.

Acceptance criteria:

- Nhấn danh mục ở Home mở màn hình danh sách sách thuộc danh mục đó.
- Màn hình có title theo tên danh mục.
- Từ danh sách sản phẩm có thể vào chi tiết sản phẩm.

### 7.2. Hoàn thiện tìm kiếm từ Home

Hiện tại search đã cập nhật query trong `BookCatalogController`, cần bảo đảm UX hoàn chỉnh:

- Khi nhập từ khóa, hiển thị kết quả hoặc điều hướng sang màn hình store/search result.
- Nếu không có kết quả, hiển thị empty state.
- Search cần tìm theo title, author, publisher/brand, genre, tags.

Files cần rà soát/sửa:

- `lib/controller/book_catalog_controller.dart`
- `lib/screens/home/home_screen.dart`
- `lib/screens/mystore/mystore_screen.dart` hoặc màn hình store sau khi hợp nhất.

Acceptance criteria:

- Search sách theo tên/tác giả/nhà xuất bản ra kết quả đúng.
- Clear keyword trả về danh sách ban đầu.

### 7.3. Hoàn thiện ảnh sản phẩm nhiều ảnh nếu tài liệu yêu cầu

Trong product detail có TODO dùng PageView nếu `book.images` có dữ liệu.

Cần làm:

- Nếu `book.images` không rỗng, hiển thị PageView/carousel ảnh.
- Nếu rỗng, fallback về `coverImage`.
- Có indicator số ảnh.

File cần sửa:

- `lib/screens/product/product_detail_screen.dart`

## 8. Giai đoạn 5: Hoàn thiện mục 14 - Store/Brand/Category và loại bỏ trùng lặp

### 8.1. Quyết định một bộ màn hình store chính

Hiện đang tồn tại song song:

- `lib/screens/store/*`
- `lib/screens/mystore/*`

Vấn đề:

- Route `myStore` và `allBrands` đang dùng nhóm `mystore`.
- Route `brandDetail` đang dùng nhóm `store`.
- Một số file `mystore` có TODO cũ hoặc constructor không khớp route.

Khuyến nghị:

- Chọn `lib/screens/store/*` làm bộ chính vì đang có `BrandController`, `BrandCard`, `BrandDetailScreen` theo `brandId` rõ hơn.
- Cập nhật `app_pages.dart` để tất cả route store/brand dùng cùng một thư mục.
- Sau khi ổn định, có thể xóa hoặc không còn import `lib/screens/mystore/*` để tránh nhầm lẫn.

Files cần sửa:

- `lib/routes/app_pages.dart`
- `lib/screens/store/mystore_screen.dart`
- `lib/screens/store/all_brand_screen.dart`
- `lib/screens/store/brand_detail_screen.dart`
- Có thể bỏ import từ `lib/screens/mystore/*`.

Acceptance criteria:

- `AppRoutes.myStore`, `AppRoutes.allBrands`, `AppRoutes.brandDetail` hoạt động thống nhất.
- Không còn route trỏ lẫn lộn sang hai bộ màn hình.
- Không còn TODO quan trọng liên quan brand/category navigation.

### 8.2. Wire category và brand onTap trong Store

Trong `store/mystore_screen.dart`, category/brand onTap còn TODO.

Cần làm:

- Category onTap: mở màn hình sản phẩm theo category.
- Brand onTap: mở `AppRoutes.brandDetail` với `brandId`.
- Button "Xem tất cả thương hiệu": mở `AppRoutes.allBrands`.

Acceptance criteria:

- Nhấn category trong Store lọc đúng sản phẩm.
- Nhấn brand nổi bật mở brand detail đúng.
- Nhấn xem tất cả thương hiệu mở danh sách brand.

### 8.3. Hoàn thiện BrandDetailScreen

Cần bảo đảm:

- Lấy `brandId` từ `Get.arguments`.
- Tìm brand trong `BrandController.brands`.
- Lọc sách bằng `brandId` trước, fallback `brandName` nếu dữ liệu cũ thiếu `brandId`.
- Có sort theo phổ biến/giá/tên nếu tài liệu yêu cầu.
- Empty state khi brand không có sản phẩm.

Files cần sửa:

- `lib/controller/brand_controller.dart`
- `lib/screens/store/brand_detail_screen.dart`

Acceptance criteria:

- Brand detail hiển thị đúng danh sách sách của brand.
- Sort/filter không làm mất sản phẩm.
- Từ sản phẩm đi được đến product detail.

## 9. Giai đoạn 6: Hoàn thiện mục 15 - Settings áp dụng toàn ứng dụng

### 9.1. Bổ sung font size setting

Hiện tại settings chưa có cỡ chữ.

Cần thêm vào `SettingsController`:

- `RxDouble fontScale = 1.0.obs`
- `setFontScale(double value)`
- Load/save bằng SharedPreferences.

File cần sửa:

- `lib/controller/settings_controller.dart`
- `lib/data/services/preferences_helper.dart`
- `lib/screens/settings/my_settings_screen.dart`

Giá trị đề xuất:

- Nhỏ: `0.9`
- Mặc định: `1.0`
- Lớn: `1.15`
- Rất lớn: `1.3`

Acceptance criteria:

- Chọn cỡ chữ trong Settings.
- Tắt/mở lại app vẫn giữ cỡ chữ.
- Cỡ chữ áp dụng ở toàn app hoặc ít nhất qua `MediaQuery.textScaler` ở app root.

### 9.2. Áp dụng themeMode ở App root

Hiện `BookStoreApp` mới khai báo `theme`, chưa áp dụng đầy đủ `themeMode`/`darkTheme`.

Cần sửa:

- `lib/app/app.dart`
- `lib/controller/settings_controller.dart`
- Có thể thêm `lib/common/styles/app_theme.dart`

Trong `GetMaterialApp` cần có:

- `theme`
- `darkTheme`
- `themeMode: settingsController.resolvedThemeMode`

Acceptance criteria:

- Chọn Light/Dark/System trong settings đổi giao diện ngay.
- Restart app vẫn giữ lựa chọn.

### 9.3. Áp dụng language/locale ở App root

Hiện controller có `languageCode`, nhưng app root chưa chắc đã bind vào `GetMaterialApp.locale`.

Cần làm:

- Thêm translations nếu muốn dùng GetX translations:
  - `lib/app/app_translations.dart`
- Cấu hình:
  - `locale: Locale(settingsController.languageCode.value)`
  - `fallbackLocale: const Locale('vi')`
  - `translations: AppTranslations()`

Nếu chưa chuyển toàn bộ text sang `.tr`, tối thiểu cần:

- Settings lưu/đọc language đúng.
- Các text chính của Settings/Profile/Order/Home có thể chuyển dần sang key.

Acceptance criteria:

- Chọn tiếng Việt/English trong Settings.
- Các khu vực chính đổi ngôn ngữ hoặc có plan chuyển key rõ ràng.

### 9.4. Đưa Settings vào Profile nếu chưa đầy đủ

Cần kiểm tra màn hình profile có menu vào settings chưa.

Nếu thiếu:

- Thêm item "Cài đặt".
- Điều hướng `Get.toNamed(AppRoutes.settings)`.

Files cần rà soát/sửa:

- `lib/screens/profile/profile_screen.dart`
- `lib/common/widgets/profile_menu_item.dart`

Acceptance criteria:

- Từ Profile vào được Settings.

## 10. Giai đoạn 7: Hoàn thiện seed data và dữ liệu mẫu

Để kiểm thử đầy đủ, cần seed dữ liệu có đủ tình huống.

File cần sửa:

- `lib/seed_firestore_app.dart`

Cần bổ sung/đảm bảo:

- Sách có nhiều `availableFormats`.
- Cart seed có format nếu vẫn seed cart.
- Order seed có `format`, `formatLabel`, `shippingFee`, `discountAmount`, `couponCode`, `paymentMethod`.
- Coupon mẫu:
  - `SALE10`: giảm 10%, tối đa 50.000đ.
  - `FREESHIP`: giảm phí vận chuyển hoặc fixed 30.000đ nếu muốn.
- Brand/category có dữ liệu liên kết bằng `brandId`, `categoryIds`.

Acceptance criteria:

- Chạy seed xong có dữ liệu đủ để test category, brand, coupon, cart format, order detail.

## 11. Giai đoạn 8: Kiểm thử và tiêu chí hoàn thành theo từng mục

### 11.1. Checklist mục 11

- [ ] Home hiển thị tên user đăng nhập.
- [ ] Badge thông báo hoạt động đúng.
- [ ] Badge giỏ hàng tính tổng quantity theo mọi phân loại.
- [ ] Banner hiển thị ổn định.
- [ ] Search tìm theo tên/tác giả/thương hiệu/danh mục.
- [ ] Category onTap mở màn hình sản phẩm theo danh mục.
- [ ] Popular products mở được product detail.
- [ ] Product detail hiển thị ảnh, giá, mô tả, rating, format, quantity.
- [ ] Chọn format rồi add cart lưu đúng format.

### 11.2. Checklist mục 12

- [ ] Cart hiển thị từng dòng theo sách + phân loại.
- [ ] Cart tăng/giảm/xóa theo đúng dòng phân loại.
- [ ] Order review hiển thị phân loại từng item.
- [ ] Order review tính subtotal/shipping/discount/total đúng.
- [ ] Coupon hợp lệ áp dụng đúng.
- [ ] Coupon sai hiển thị lỗi đúng.
- [ ] Payment method được lưu đúng vào order.
- [ ] Place order tạo order item có format/formatLabel.
- [ ] Order success/confirmation hiển thị đúng tổng tiền.
- [ ] My orders list không lỗi với order mới/cũ.
- [ ] Order detail hiển thị format, payment, shipping, discount.
- [ ] Cancel order vẫn hoạt động.
- [ ] Notification order vẫn hoạt động.

### 11.3. Checklist mục 13

- [ ] Toggle wishlist từ product card/product detail hoạt động.
- [ ] Wishlist screen hiển thị sách yêu thích.
- [ ] Xóa khỏi wishlist hoạt động.
- [ ] Từ wishlist mở product detail được.
- [ ] Wishlist không bị ảnh hưởng bởi thay đổi cart/order.

### 11.4. Checklist mục 14

- [ ] Store route dùng một bộ màn hình thống nhất.
- [ ] All brands hiển thị danh sách brand.
- [ ] Brand detail lọc đúng sản phẩm theo brandId/brandName.
- [ ] Category trong store/home lọc đúng sản phẩm.
- [ ] Không còn route trỏ sai giữa `store` và `mystore`.

### 11.5. Checklist mục 15

- [ ] Settings load/save theme.
- [ ] Theme áp dụng toàn app.
- [ ] Settings load/save language.
- [ ] Locale/translations áp dụng ở app root.
- [ ] Settings load/save font size.
- [ ] Font scale áp dụng toàn app.
- [ ] Profile có đường dẫn vào Settings.

## 12. Thứ tự commit/triển khai đề xuất

### Commit 1: CartItemModel và schema cart có format

- Tạo `CartItemModel`.
- Sửa cart service/repository/controller.
- Sửa product detail add-to-cart.
- Sửa cart UI hiển thị format.
- Kiểm thử: cùng sách nhiều format hiển thị thành nhiều dòng.

### Commit 2: OrderItemModel có format và checkout lưu đủ dữ liệu

- Sửa `OrderItemModel`, `OrderModel`.
- Sửa `CheckoutController`.
- Sửa order review/detail/list để đọc dữ liệu mới.
- Kiểm thử: đặt hàng từ cart có nhiều format.

### Commit 3: Coupon + shipping + payment method

- Thêm coupon model/service/repository/controller.
- Thêm shipping fee service.
- Sửa order review tổng tiền.
- Sửa order lưu coupon/shipping/payment.
- Kiểm thử mã giảm giá và payment.

### Commit 4: Category navigation mục 11

- Thêm/hoàn thiện route product by category/subcategory.
- Wire Home category onTap.
- Hoàn thiện search result/empty state nếu cần.

### Commit 5: Store/Brand consolidation mục 14

- Cập nhật route dùng một bộ màn hình store.
- Wire category/brand onTap.
- Hoàn thiện brand detail sort/filter.
- Loại bỏ import/màn hình trùng không dùng.

### Commit 6: Settings mục 15

- Thêm font size preference.
- Áp dụng themeMode/darkTheme/locale/text scale ở app root.
- Cập nhật Settings UI và Profile menu.

### Commit 7: Seed data + final QA

- Cập nhật seed data.
- Chạy analyzer.
- Kiểm thử thủ công toàn bộ checklist mục 11–15.

## 13. Rủi ro và cách xử lý

| Rủi ro | Ảnh hưởng | Cách xử lý |
| --- | --- | --- |
| Dữ liệu cart cũ thiếu format | App crash hoặc cart rỗng | Parser default format, đọc được cả schema cũ. |
| Order cũ thiếu field mới | Order detail crash | `fromMap` dùng default/null-safe. |
| Cùng sách nhiều format bị gộp | Sai giỏ hàng/đơn hàng | Dùng `lineId = bookId_format`. |
| Coupon bị áp dụng nhưng đặt hàng fail | Sai usedCount | Chỉ tăng usedCount sau khi tạo order thành công. |
| Store/mystore trùng route | Điều hướng sai màn hình | Chọn một bộ màn hình chính, sửa imports rõ ràng. |
| Theme/language/font size không rebuild | Settings đổi nhưng UI không đổi | Bọc `GetMaterialApp` bằng `Obx` hoặc dùng controller reactive đúng cách. |

## 14. Kiểm thử cuối cùng

Lệnh kiểm tra:

```bash
flutter analyze
flutter test
```

Kiểm thử thủ công bắt buộc:

1. Đăng nhập tài khoản user.
2. Mở Home, nhấn category, nhấn product, vào product detail.
3. Chọn `Bìa mềm`, thêm vào cart.
4. Quay lại product detail, chọn `Bìa cứng`, thêm vào cart.
5. Mở cart: xác nhận có 2 dòng riêng và hiển thị đúng phân loại.
6. Tăng/giảm từng dòng: xác nhận không ảnh hưởng dòng còn lại.
7. Mở order review: xác nhận item vẫn có phân loại.
8. Nhập coupon hợp lệ: tổng tiền giảm đúng.
9. Chọn phương thức thanh toán chuyển khoản.
10. Đặt hàng: order success hiển thị đúng.
11. Mở My Orders -> Order Detail: xác nhận phân loại, coupon, shipping, payment hiển thị đúng.
12. Mở Wishlist: thêm/xóa/sang detail vẫn hoạt động.
13. Mở Store -> All Brands -> Brand Detail: danh sách sản phẩm đúng.
14. Mở Settings: đổi theme/language/font size, restart app và xác nhận vẫn giữ.

## 15. Định nghĩa hoàn thành 100%

Dự án được xem là hoàn thành 100% mục 11–15 khi:

- Không còn chức năng nào trong bảng đánh giá ở trạng thái "chưa đáp ứng" hoặc "đáp ứng một phần".
- Luồng chọn phân loại sách được lưu xuyên suốt: Product Detail -> Cart -> Order Review -> OrderModel Firestore -> My Orders -> Order Detail.
- Coupon, shipping fee và payment method hoạt động thật, không còn placeholder.
- Category/brand navigation hoạt động đầy đủ và route store không còn trùng lặp gây nhầm lẫn.
- Settings áp dụng thật ở toàn app: theme, language, font size.
- `flutter analyze` không có error/warning nghiêm trọng.
- Kiểm thử thủ công theo checklist đạt toàn bộ.
