# 📚 S-Store (Book Store App)

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![Firebase](https://img.shields.io/badge/firebase-%23039BE5.svg?style=for-the-badge&logo=firebase)](https://firebase.google.com/)
[![GetX](https://img.shields.io/badge/GetX-State_Management-blue?style=for-the-badge)](https://pub.dev/packages/get)

**S-Store** là ứng dụng di động mua bán sách trực tuyến được phát triển trên nền tảng Flutter. Dự án mang đến trải nghiệm mua sắm mượt mà, tiện lợi với giao diện hiện đại, giúp người dùng dễ dàng tìm kiếm, mua sắm và quản lý các đầu sách yêu thích.

---

## 👥 Nhóm phát triển

- **Thành viên 1:** Trần Thị Mỹ Dung (MSSV: 6451071008)
- **Thành viên 2:** Đặng Ngọc Hiếu (MSSV: 6451071024)

---

## ✨ Tính năng nổi bật

### 🔐 Xác thực & Người dùng (Authentication & User)
- Đăng nhập / Đăng ký tài khoản an toàn qua Firebase.
- Quản lý phiên đăng nhập (Session management).
- Tính năng Quên mật khẩu / Khôi phục mật khẩu.

### 🛍 Tính năng Mua sắm (Khám phá & Giỏ hàng)
- **Trang chủ:** Hiển thị Banner quảng cáo, Danh mục sách, Sách nổi bật và Sách mới nhất.
- **Tìm kiếm:** Lọc và tìm kiếm sách theo tên, tác giả, và thể loại.
- **Chi tiết sản phẩm:** Xem thông tin chi tiết, mô tả, đánh giá, và giá sách.
- **Giỏ hàng:** Thêm/sửa/xóa sản phẩm trong giỏ hàng, tự động tính toán tổng tiền.
- **Thanh toán (Checkout):** Quy trình thanh toán nhanh chóng, chọn phương thức giao hàng và thanh toán.

### 👤 Quản lý Hồ sơ & Đơn hàng (Profile & Orders)
- **Hồ sơ cá nhân:** Cập nhật thông tin người dùng, ảnh đại diện.
- **Sổ địa chỉ:** Thêm và quản lý nhiều địa chỉ giao hàng.
- **Tài khoản ngân hàng / Thanh toán:** Tích hợp quản lý thẻ và phương thức thanh toán.
- **Quản lý đơn hàng:** Theo dõi tình trạng giao hàng, xem lại lịch sử mua hàng.
- **Mục yêu thích (Wishlist):** Lưu danh sách các cuốn sách muốn mua trong tương lai.

---

## 🛠 Công nghệ & Thư viện sử dụng

- **Framework:** [Flutter](https://flutter.dev/) (đa nền tảng iOS & Android).
- **Ngôn ngữ:** Dart.
- **State Management & Routing:** [GetX](https://pub.dev/packages/get) (Quản lý trạng thái, điều hướng, dependency injection).
- **Backend as a Service:** Firebase
  - *Firebase Authentication:* Quản lý đăng nhập/đăng ký.
  - *Cloud Firestore:* Cơ sở dữ liệu thời gian thực (Lưu trữ sách, người dùng, đơn hàng).
- **UI & Animation:** Giao diện được thiết kế hiện đại với các widget Material Design, hỗ trợ Onboarding sống động.

---

## 🚀 Hướng dẫn cài đặt & Chạy ứng dụng

### Yêu cầu hệ thống:
- Cài đặt [Flutter SDK](https://docs.flutter.dev/get-started/install) (Khuyến nghị phiên bản mới nhất).
- Cài đặt Android Studio, IntelliJ IDEA, hoặc Visual Studio Code có tích hợp Flutter extension.
- Thiết lập máy ảo (Android Emulator / iOS Simulator) hoặc một thiết bị di động vật lý.

### Các bước cài đặt:

1. **Clone dự án về máy:**
   ```bash
   git clone https://github.com/MyDungTranThi/6451071024_6451071008_MAP_APP.git
   cd 6451071024_6451071008_MAP_APP
   ```

2. **Cài đặt các thư viện phụ thuộc (Dependencies):**
   ```bash
   flutter pub get
   ```

3. **Cấu hình Firebase (Nếu cần thiết):**
   - Dự án đã được liên kết thông qua tệp `firebase_options.dart` và `google-services.json`. 
   - Nếu bạn muốn dùng Firebase của riêng mình, hãy cấu hình lại thông qua [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/).

4. **Tạo dữ liệu mẫu trên Firestore (Nếu Firestore đang trống):**

   Script seed cần chạy trong môi trường Flutter vì sử dụng Firebase/Firestore plugin. Trước tiên kiểm tra thiết bị khả dụng:
   ```bash
   flutter devices
   ```

   Chạy seed trên Android emulator hoặc thiết bị đang kết nối:
   ```bash
   flutter run -t lib/seed_firestore_app.dart -d emulator-5554
   ```


   Script sẽ tạo dữ liệu mẫu cho `books`, `brands`, `categories`, `orders`, `reviews`, `notifications`, `users` và các subcollection như `addresses`, `bank_accounts`, `cartItems`.

5. **Biên dịch và chạy ứng dụng:**
   ```bash
   flutter run
   ```

---

## 📂 Kiến trúc dự án (Project Structure)

Dự án áp dụng cấu trúc thư mục rõ ràng giúp dễ dàng bảo trì và mở rộng định hướng theo **GetX Pattern**:

```
lib/
├── app/               # Cấu hình app gốc (Theme, Constants, App Binding)
├── bindings/          # Dependency Injection (Kết nối Controller và UI)
├── common/            # Các Widget dùng chung (Buttons, TextFields, Loaders...)
├── controller/        # Xử lý Logic và Quản lý State (GetX Controllers)
├── data/              # Models, DTOs, API providers, Repositories
├── routes/            # Quản lý định tuyến (AppRoutes, AppPages)
├── screens/           # Các màn hình UI chính (Onboarding, Login, Home, Profile...)
├── utils/             # Các hàm tiện ích (Format money, Validators, Helpers)
├── firebase_options.dart # Cấu hình Firebase sinh tự động
└── main.dart          # Điểm bắt đầu (Entry point) của ứng dụng
```

---

*Phát triển với ❤️ bởi đội ngũ sinh viên.*
