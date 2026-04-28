# 📚 S-Store (Book Store) - Implementation Plan

> **📌 QUY TRÌNH CHUNG:** Tận dụng tối đa và bê nguyên các đoạn mã (source code) mẫu được cung cấp sẵn trong file `Tài liệu thực hành (Xây app).md` để tái sử dụng khung cấu trúc, UI Utilities, Splash, Onboarding... việc này giúp xây dựng base app nhanh nhất. Chỉ thay đổi nội dung (sách thay vì quần áo) và ảnh cho phù hợp.

## Giai đoạn 1: Khởi tạo và Cấu hình Project (Setup & Config)
2. **Cấu hình Firebase:** 
   - Chạy `flutterfire configure` để liên kết project Firebase (tên project: `MSSV1_VS_MSSV2`).
   - Đảm bảo file `firebase_options.dart` được tạo thành công.
3. **Cập nhật thư viện (`pubspec.yaml`):**
   - Thêm các dependencies: `get`, `firebase_core`, `cupertino_icons`.
   - Thêm dev_dependencies: `flutter_launcher_icons`.
   - Khai báo cấu hình images (`assets/images/...`) từ file mẫu.
4. **Tổ chức thư mục gốc:** Tạo cây thư mục `lib/` (gồm `app`, `bindings`, `common`, `controller`, `data`, `routes`, `screens`, `utils`).

## Giai đoạn 2: Khung Giao Diện & Tiện Ích (Common UI & Utils)
1. **Thiết lập Core Routing:** Cập nhật `lib/main.dart` và `lib/app/app.dart`.
2. **Tạo Styles (`lib/common/styles/`):**
   - `app_colors.dart` (primaryBlue, background, trắng, xám).
   - `app_text_styles.dart` (typography).
3. **Tạo Reusable Widgets (`lib/common/widgets/`):**
   - `PrimaryButton`, `ProgressDots`.

## Giai đoạn 3: Màn hình Chào mừng (Splash) & Giới thiệu (Onboarding)
1. **Màn hình Splash:** `SplashScreen`, `SplashController`, `SplashBinding` (2 giây -> Onboarding).
2. **Màn hình Onboarding:** 
   - Tạo dữ liệu giới thiệu sách (`OnboardingModel`).
   - Cài đặt `OnboardingScreen`, `OnboardingController`, `OnboardingBinding`.
3. **Cập nhật Router:** Khai báo vào `AppRoutes` và `AppPages`.

## Giai đoạn 4: Xác thực Người Dùng (Authentication)
1. Giao diện: `LoginScreen`, `RegisterScreen`, `ForgetPasswordScreen`.
2. Logic: `AuthController` kết nối Firebase Auth (Đăng ký, Xác thực Email, Đăng nhập).

## Giai đoạn 5: Core Features - Bán Sách (Home, Product, Store)
1. **Màn hình chính (Home):** Bottom Navigation Bar (Home, Store, Wishlist, Profile).
2. **Quản lý Sản phẩm (Product):** `ProductDetailScreen` (Mô tả sách, giá, định dạng Bìa cứng/mềm, Thêm vào giỏ).
3. **Tìm kiếm & Lọc:** Tìm sách theo Tên, Tác giả, Thể loại.

## Giai đoạn 6: Giỏ hàng & Thanh toán (Cart & Checkout)
1. **Giỏ hàng (`CartScreen`):** Quản lý sách trong giỏ.
2. **Thanh toán (`Checkout`):** `ShippingAddressScreen` (Địa chỉ giao), `OrderScreen` (Theo dõi đơn).

## Giai đoạn 7: Tính năng Phụ & Hoàn thiện
1. `ProfileScreen`: Quản lý thông tin, đổi mật khẩu.
2. `WishlistScreen`: Lưu sách yêu thích.
3. Tích hợp dữ liệu toàn diện lên Firebase Firestore.

---

## 👥 Phân công công việc (Cho nhóm 2 người)

Chiến lược phân chia theo **Vertical Slicing (Chia theo module)** giúp hai thành viên có thể code song song, ít bị conflict (đụng code) khi gom lên Git.

**Giai đoạn làm chung (Pair Programming)**
- **Giai đoạn 1 & 2:** Một người thực hiện tạo project, setup cấu trúc, Firebase, config style và widget cơ bản -> Sau đó đẩy lên GitHub (Main branch) để người kia clone về. Hai người cùng thống nhất các Widget chung.

**Thành viên A: Mảng User & Trải nghiệm đầu vào**
Tập trung vào tuyến người dùng (User Flow), từ lúc tải app đến khi đăng nhập thành công và quản lý tài khoản.
- **Task 1:** Màn hình Splash & Onboarding (Giai đoạn 3)
- **Task 2:** Xác thực người dùng - Đăng ký, Đăng nhập, Quên mật khẩu (Giai đoạn 4)
- **Task 3:** Quản lý Profile (Mật khẩu, Đổi thông tin) & Wishlist (Giai đoạn 7)
- **Task 4:** Làm việc sâu với **Firebase Authentication**.

**Thành viên B: Mảng Shopping & Checkout**
Tập trung vào Core chính của việc chọn sách, mua hàng và thanh toán.
- **Task 1:** Xây dựng khung Navigation Bar (Home) & Thiết kế Book Model (Giai đoạn 5)
- **Task 2:** Đổ dữ liệu và làm màn hình Hiển thị Danh Sách Sách, Chi tiết sách, Tìm kiếm (Giai đoạn 5)
- **Task 3:** Giỏ hàng & Thanh toán (Giai đoạn 6)
- **Task 4:** Làm việc sâu với **Firebase Firestore** (Lưu thông tin đơn hàng, Sách).