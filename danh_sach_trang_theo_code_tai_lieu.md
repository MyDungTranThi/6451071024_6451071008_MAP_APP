- libs/screens/home/home_screen.dart
- libs/screens/mystore/mystore_screen.dart
- libs/screens/wishlist/ wishlist_screen.dart
- libs/screens/home/main_navigation_screen.dart
# Trong file 'docs/Tài liệu thực hành (Xây app).md', có một phần rất quan trọng là "Danh sách trang theo code tài liệu". Phần này sẽ giúp bạn hiểu rõ hơn về cách tổ chức và phân chia các màn hình trong ứng dụng Book Store. Hãy đọc kỹ phần này để nắm được cấu trúc và vị trí của từng màn hình trong dự án, từ đó dễ dàng tìm kiếm và chỉnh sửa khi cần thiết.

**I. Nhóm thư mục Giao diện (Screens) theo phân rã chức năng**
Dựa vào sơ đồ phân rã chức năng của ứng dụng và cấu trúc thư mục `lib/`, các đường dẫn màn hình (`screens`) được phân chia như sau:

1. **Hệ thống & Điều hướng (System & Navigation)**
   * `lib/screens/splash/`: Màn hình khởi động (Splash screen).
   * `lib/screens/onboarding/`: Nhóm màn hình giới thiệu ứng dụng.
   * `lib/routes/`: Quản lý tuyến đường và điều hướng giữa các màn hình.
   * `lib/bindings/`: Nơi kết nối các Controller khi khởi tạo màn hình.

2. **Xác thực & Người dùng (Authentication & User)**
   * `lib/screens/auth/`: Chứa các màn hình đăng nhập, đăng ký, quên mật khẩu, xác minh email.
   * `lib/screens/profile/`: Quản lý hồ sơ người dùng, thay đổi thông tin cá nhân (tên, số điện thoại, email, mật khẩu...).

3. **Sản phẩm & Cửa hàng (Product & Store)**
   * `lib/screens/home/`: Màn hình trang chủ (Duyệt sản phẩm phổ biến, danh mục).
   * `lib/screens/mystore/`: Giao diện cửa hàng, các thương hiệu nổi bật.
   * `lib/screens/product/`: Chi tiết sản phẩm.
   * `lib/screens/review/`: Đánh giá và xếp hạng sản phẩm.

4. **Giao dịch & Giỏ hàng (Transaction & Cart)**
   * `lib/screens/cart/`: Quản lý giỏ hàng, cập nhật số lượng và tổng quan giỏ hàng.

5. **Thanh toán & Vận chuyển (Payment & Shipping)**
   * `lib/screens/order/`: Quản lý đặt hàng, lịch sử đơn hàng, theo dõi trạng thái đơn.
   * `lib/screens/shipping_address/`: Quản lý địa chỉ nhận hàng của người dùng.
   * `lib/screens/bank_account/`: Quản lý tài khoản ngân hàng và phương thức thanh toán.

6. **Tiện ích & Thông báo (Utilities & Notification)**
   * `lib/screens/wishlist/`: Quản lý danh sách sản phẩm yêu thích.
   * `lib/screens/notifications/`: Cài đặt và quản lý thông báo của người dùng.

**II. Nhóm thư mục Kiến trúc (Architecture & Logic)**
Bên cạnh giao diện, dự án được tổ chức theo các thành phần xử lý logic và dữ liệu:
* `lib/app/`: Chứa file thiết lập ứng dụng gốc.
* `lib/common/`: Chứa các thành phần dùng chung như styles (màu sắc, font chữ) và các widgets tái sử dụng.
* `lib/controller/`: Chứa các lớp điều khiển (GetX Controllers) để xử lý logic nghiệp vụ cho từng chức năng.
* `lib/data/`: Thư mục quản lý dữ liệu, bao gồm 2 thư mục con:
  * `lib/data/models/`: Định nghĩa các cấu trúc dữ liệu (User, Product, Cart, Order,...).
  * `lib/data/services/`: Nơi xử lý các thao tác gọi API, kết nối cơ sở dữ liệu Firebase.
* `lib/utils/`: Chứa các hàm tiện ích (ví dụ: các hàm validate dữ liệu).
* `lib/main.dart`: File khởi chạy chính của toàn bộ ứng dụng Flutter.

**III. Nhóm thư mục Tài nguyên (Assets)**
Thư mục này nằm ở gốc của project (ngang hàng với `lib/`), dùng để lưu trữ toàn bộ hình ảnh và ảnh động:
* `assets/images/animations/`: Chứa các ảnh tĩnh hoặc động cho thông báo (như gửi mail thành công).
* `assets/images/banners/`: Chứa các hình ảnh banner quảng cáo trên trang chủ.
* `assets/images/logos/`: Chứa logo của ứng dụng (logo đen, logo trắng).
* `assets/images/on_boarding_images/`: Chứa các file ảnh dạng `.gif` sử dụng trong màn hình giới thiệu (onboarding).