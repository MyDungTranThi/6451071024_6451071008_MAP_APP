# Tổng Hợp Và Hướng Dẫn Kiểm Thử Chức Năng (Mục 1 - 10)

Tài liệu này tổng hợp lại toàn bộ các chức năng đã được phát triển từ Mục 1 đến hết Mục 10 trong tài liệu thực hành. Bạn có thể sử dụng tài liệu này như một danh sách kiểm tra (checklist) để chạy thử nghiệm và xác nhận hệ thống hoạt động ổn định.

---

## 1. Màn Hình Chờ (Splash Screen)
- **Vị trí hiển thị**: Ngay khi vừa mở ứng dụng.
- **Tính năng cần test**:
  - [ ] Hiển thị logo ứng dụng ở giữa màn hình.
  - [ ] Tự động chuyển hướng sang màn hình **Onboarding** (hoặc màn hình chính/login tùy trạng thái đăng nhập) sau khoảng 2-3 giây.

## 2. Màn Hình Giới Thiệu (Onboarding)
- **Vị trí**: Nối tiếp Splash Screen đối với người dùng lần đầu.
- **Tính năng cần test**:
  - [ ] Vuốt sang trái/phải để chuyển đổi giữa 3 trang giới thiệu (Mua sắm dễ dàng, Thanh toán an toàn, Giao hàng nhanh chóng).
  - [ ] Nút "Tiếp theo" hoạt động và tự động chuyển trang.
  - [ ] Nút "Bỏ qua" góc trên bên phải bỏ qua toàn bộ onboarding và nhảy tới Trang chủ (`/home`).
  - [ ] Ở trang cuối, nút chuyển thành "Bắt đầu" và nhấn vào cũng nhảy tới Trang chủ.
  - [ ] Các chấm (Progress dots) ở dưới cùng phải thay đổi vị trí tương ứng với trang hiện tại.

## 3. Điều Hướng Chính (Main Navigation)
- **Vị trí**: Sau khi vào ứng dụng chính (`/home`).
- **Tính năng cần test**:
  - [ ] Thanh Bottom Navigation ở dưới cùng hiển thị 4 mục: Trang chủ, Cửa hàng, Yêu thích, Hồ sơ.
  - [ ] Bấm vào từng mục phải chuyển đúng trang (hiện tại Trang chủ, Cửa hàng và Yêu thích là giao diện Demo UI).
  - [ ] Bấm vào **Hồ sơ** (Profile) sẽ hiển thị giao diện tuỳ theo trạng thái: chưa đăng nhập ("Guest User") hoặc đã đăng nhập (Hiển thị tên thật và email).

## 4. Xác Thực & Tài Khoản (Authentication)
Vào tab **Hồ sơ**, nếu chưa đăng nhập, nhấn **"Đăng nhập ngay"**.

### Đăng ký tài khoản (Register)
- **Tính năng cần test**:
  - [ ] Trong màn đăng nhập, bấm "Đăng ký ngay".
  - [ ] Bỏ trống các trường và nhấn "Tạo tài khoản" -> Cảnh báo lỗi bỏ trống.
  - [ ] Nhập sai định dạng email, mật khẩu ngắn dưới 6 ký tự, số điện thoại sai -> Báo lỗi validator.
  - [ ] Quên tích "Tôi đồng ý với chính sách..." -> Báo lỗi yêu cầu tích.
  - [ ] Nhập đầy đủ thông tin hợp lệ -> Đăng ký thành công, chuyển sang màn hình **Xác minh Email**.
  - [ ] Nhận được email từ Firebase trong hộp thư thực tế. Nhấn link xác minh trong email.
  - [ ] Quay lại ứng dụng, nhấn "Tiếp tục" ở màn hình Xác minh -> Chuyển đến màn **Đăng ký thành công** rồi về Login.

### Đăng nhập (Login)
- **Tính năng cần test**:
  - [ ] Bỏ trống trường hoặc nhập sai định dạng -> Báo lỗi.
  - [ ] Nhập sai mật khẩu hoặc tài khoản không tồn tại -> Thông báo lỗi từ Firebase.
  - [ ] Tích vào **"Ghi nhớ" (Remember Me)**, đăng nhập. Sau khi đăng xuất, email vẫn được lưu trữ ở khung nhập liệu.
  - [ ] Nhập đúng email/password -> Đăng nhập thành công, nhảy về tab Trang chủ (`/home`).
  - [ ] Tab **Hồ sơ** cập nhật tên thật và email.

### Quên mật khẩu
- **Tính năng cần test**:
  - [ ] Bấm "Quên mật khẩu?" tại màn Login.
  - [ ] Nhập email hợp lệ -> Bấm "Gửi yêu cầu".
  - [ ] Chuyển qua màn hình "Yêu cầu đã được gửi". Kiểm tra email nhận được link đặt lại mật khẩu của Firebase.

## 5. Quản Lý Hồ Sơ Người Dùng (Profile Management)
Yêu cầu đã đăng nhập. Tại tab **Hồ sơ**, bấm vào **Biểu tượng cái bút (Edit)** góc trên bên phải.

- **Tính năng cần test**:
  - [ ] **Thay đổi Tên**: Nhấn vào Tên -> Chuyển sang màn đổi tên. Nhập tên mới -> Lưu -> Dữ liệu cập nhật trên cả màn chi tiết và thẻ Hồ sơ.
  - [ ] **Thay đổi Username**: Kiểm tra điều kiện >= 4 ký tự, không dùng ký tự đặc biệt lạ -> Lưu thành công.
  - [ ] **Đổi Mật Khẩu**: Nhấn vào đổi mật khẩu. Do yêu cầu bảo mật của Firebase, có thể sẽ yêu cầu Re-authenticate (nhập mật khẩu cũ) trước khi đổi.
  - [ ] **Đổi Số Điện Thoại**: Nhập SĐT không bắt đầu bằng số 0 hoặc sai độ dài (phải 10 số) -> Báo lỗi. Nhập đúng -> Lưu thành công.
  - [ ] **Đổi Giới tính & Ngày sinh**: Nhấn chọn sẽ hiện bảng Radio button hoặc Date Picker. Lưu và kiểm tra lại ngoài màn hình.
  - [ ] **Đổi Email**: Nhập email mới -> Firebase yêu cầu xác minh -> Gửi link qua email mới -> Mở email verify. Quay lại app màn profile kiểm tra thay đổi.

## 6. Quản Lý Tài Khoản Ngân Hàng (Bank Account)
Tại tab **Hồ sơ**, chọn **Tài khoản ngân hàng**.

- **Tính năng cần test**:
  - [ ] Màn hình trống nếu chưa có. Nhấn "Add Bank".
  - [ ] **Gọi API VietQR**: Dropdown chọn ngân hàng sẽ tải danh sách thực tế (VCB, TCB, MB, v.v...). Chọn 1 ngân hàng -> Logo và mã ngân hàng xuất hiện.
  - [ ] Bỏ trống Số tài khoản hoặc Tên chủ tài khoản -> Báo lỗi.
  - [ ] Nhập đủ, lưu thành công -> Hiển thị dạng Card đẹp với logo ngân hàng và Số tài khoản bị che bớt (`**** **** 1234`).
  - [ ] **Sửa**: Bấm nút Edit (biểu tượng cây bút trên thẻ) -> Thay đổi thông tin -> Lưu.
  - [ ] **Xóa**: Bấm nút Delete (thùng rác) -> Hiện Dialog xác nhận. Chọn Delete -> Thẻ biến mất khỏi danh sách.

## 7. Quản Lý Địa Chỉ Giao Hàng (Shipping Address)
Tại tab **Hồ sơ**, chọn **Địa chỉ của tôi**.

- **Tính năng cần test**:
  - [ ] Nếu chưa có địa chỉ, báo trống. Nhấn Add New Address.
  - [ ] **Gọi API Tỉnh/Thành**: Dropdown chọn Tỉnh/Thành phố sẽ load thực tế từ API Open API VN. Sau khi chọn Tỉnh -> Load Quận/Huyện -> Load Phường/Xã.
  - [ ] Nhập thông tin người nhận, SĐT, tên đường cụ thể.
  - [ ] Lưu thành công -> Địa chỉ xuất hiện ngoài danh sách. (Lưu ý: Nếu đây là địa chỉ đầu tiên, nó sẽ tự động được đặt làm Mặc định).
  - [ ] Thêm địa chỉ thứ 2 -> Gạt nút Toggle "Đặt làm mặc định" -> Lưu.
  - [ ] Ở màn danh sách, địa chỉ nào là mặc định sẽ có Label `[Mặc định]` tô xanh và xếp lên trên.

## 8. Đăng Xuất & Chế Độ Khách (Logout & Guest Mode)
- **Tính năng cần test**:
  - [ ] Tại màn Profile, cuộn xuống dưới cùng nhấn **Đăng xuất**.
  - [ ] Hiện bảng Dialog hỏi xác nhận. Chọn Cancel thì ở lại, chọn Đăng xuất thì thực hiện Logout qua Firebase.
  - [ ] Trở về màn hình Tab, tab Profile biến thành "Guest User" với nút "Đăng nhập ngay".
  - [ ] Thử tắt hẳn ứng dụng đi mở lại: 
    - Nếu có bật "Ghi nhớ" lúc Login: Email cũ được giữ trên textbox ở màn hình đăng nhập.
    - Nếu đóng app lúc đang đăng nhập: Mở app tự động vào tài khoản (Duy trì phiên Firebase).
    - Nếu đã đăng xuất: Mở app ở dạng Guest.

---

🎉 **Nếu bạn tick hoàn thành toàn bộ các mục trên mà không có ứng dụng crash đột ngột hay không bắt được lỗi validator, thì module quản lý thông tin tài khoản đã thành công 100%!**
