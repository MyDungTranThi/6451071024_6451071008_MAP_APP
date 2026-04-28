

## I. Tóm tắt bài thực hành

## 1. Yêu cầu lý thuyết

## Sinh viên đã được trang bị các kiến thức về phát triển ứng dụng di động trên framework Flutter,

## gồm:

- Ngôn ngữ lập trình Dart
- Giới thiệu Flutter framework
- Widget trong Flutter
- Xử lý tương tác người dùng với Gesture
- Xây dựng Form và xác thực dữ liệu người dùng
- Điều hướng và định tuyến giữa các màn hình
- Quản lý trạng thái trong Flutter
- Hiệu ứng chuyển động và Animation
- Kết nối API và xử lý dữ liệu JSON
- Lưu trữ và quản lý dữ liệu trong thiết bị và trên môi trường cloud

## 2. Nội dung chính bài thực hành

## Trong buổi 1 và 2 của lớp thực hành, sinh viên sẽ thiết kế và phát triển một ứng dụng di động

## hỗ trợ mua sản phẩm trực tuyến, gồm danh sách các màn hình và các chức năng cơ bản được

## minh họa bởi ứng dụng “S-store” như sau:

## Danh sách các màn hình trong ứng dụng:

- Màn hình khởi động, màn hình chờ (splash screen)

```
TRƯỜNG ĐẠI HỌC GIAO THÔNG VẬN TẢI
PHÂN HIỆU TẠI TP. HỒ CHÍ MINH
Bộ môn: Công nghệ thông tin
```
# Tài liệu thực hành (PHẦN 1)

```
Môn học: Lập trình ứng dụng trên thiết bị di động
```



- Nhòm màn hình giới thiệu (onboarding screen)
- Nhòm màn hình đăng nhập tài khoản (Login screen)




- Nhòm màn hình đăng ký tài khoản (Registration screen)
- Nhòm màn hình quản lý hồ sơ người dùng (Profile screen)




- Màn hình trang chủ (Homepage screen)
- Màn hình giới thiệu cửa hàng (Store screen)




- Màn hình xem chi tiết sản phẩm (Product detail screen)
- Nhóm màn hình xem thông tin đơn hàng (Order screen)

## Danh sách các chức năng điển hình cho người dùng trong ứng dụng:

- Đăng ký / đăng nhập tài khoản
- Xem danh sách sản phẩm
- Tìm kiếm & lọc sản phẩm




- Xem chi tiết sản phẩm (hình ảnh, mô tả, giá, biến thể như size/màu)
- Chọn biến thể sản phẩm (kích cỡ, màu,...)
- Thêm sản phẩm vào giỏ hàng
- Thêm sản phẩm vào danh sách yêu thích (Wishlist)
- Cập nhật / xóa sản phẩm trong giỏ hàng
- Tiến hành thanh toán (Checkout)
- Nhập thông tin giao hàng
- Theo dõi trạng thái đơn hàng
- Nhận thông báo về đơn hàng (xác nhận, giao hàng,...)
- Đánh giá sản phẩm
- Cài đặt thể hiện ứng dụng tùy ý
- ...

## II. Chi tiết bài tập thực hành

## Sinh viên hoàn thành các công việc sau trước khi bắt đầu làm bài

- Lập nhóm 2 sinh viên để làm bài
- Truy cập vào link sau để đăng ký đề tài sẽ làm mua/bán về mặt hàng nào (lưu ý các

## nhóm không được trùng đề tài với nhau)

- Các nhóm tự chuẩn bị sẵn dữ liệu sản phẩm + hình ảnh liên quan đến đề tài
- Một số hình ảnh liên quan đến các màn hình chào, giới thiệu,... sinh viên có thể sử

## dụng tại đây

- Truy cập vào firebase console, tạo 1 project cho quản lý CSDL trong đề tài của nhóm.

## o Đặt tên project theo cú pháp: <MSSV1>VS<MSSV2>

## o Sau khi thực hiện các cấu hình liên quan, truy cập vào Setting → Users and

## permission




## o Trong màn hình Users and permissions → chọn Add members → thực hiện

## thêm tài khoản ntduong@st.utc2.edu.vn với vai trò (Role) là Viewer

## → click nút Add member

## Sau khi chuẩn bị xong, trong bài thực hành này SV được yêu cầu phân tích, thiết kế và phát

## triển một ứng dụng di động hỗ trợ mua/bán hàng trực tuyến. Ứng dụng này cần có danh sách

## các màn hình và chức năng cơ bản giống như ứng dụng minh họa “S-store” trong mục I.

## Để hỗ trợ việc làm bài tập được thuận lợi, trong quá trình làm sinh viên có thể tham khảo và

## tái sử dụng lại cấu trúc thư mục project và bộ mã nguồn của ứng dụng “S-store” được cung

## cấp trong mục III.

## Hình ảnh sau là sơ đồ phân ra chức năng của ứng dụng “S-store”




## II. Hướng dẫn nộp bài tập thực hành

## Để nộp bài thực hành sau mỗi buổi học, các nhóm thực hiện như sau:

- Tạo 1 Repo trên github để lưu trữ mã nguồn của ứng dụng mobile thực hiện được trong

## cả buổi LAB 1 và LAB 2 (2 lab đều dùng chung repo này)

## o Cú pháp tên Repo: <MSSV 1 >_<MSSV2>_MAP_APP

- Tạo 1 Repo khác trên github để lưu trữ mã nguồn của ứng dụng web thực hiện được

## trong buổi LAB 3

## o Cú pháp tên Repo: <MSSV 1 >_<MSSV2>_MAP_WEB

- Tạo 1 link GGdrive/Onedrive lưu trữ video record lại chạy demo chức năng của

## app/web thực hiện được sau từng buổi. Mỗi link drive tương ứng cho mỗi buổi. Đặt

## tên tương ứng như sau: Video LAB1, Video LAB2, VIdeo LAB

- Tổng hợp lại link repo github + link GGDrive/OneDrive của video cho từng buổi và

## paste vào file template được gửi kèm trên LMS




## III. Hướng dẫn thiết kế và xây dựng ứng dụng “S-store”

## 1. Cấu trúc thư mục trong project

## Trên VS Code/ Androis Studio, sinh viên tạo mới 1 project theo framework Flutter, tổ chức

## thư mục lib theo cấu trúc sau:

## lib/

## ├── app/

## ├── bindings/

## ├── common/

## ├── controller/

## ├── data/

## │ ├── models/

## │ └── services/

## ├── routes/

## ├── screens/

## │ ├── auth/

## │ ├── bank_account/

## │ ├── cart/

## │ ├── home/

## │ ├── mystore/

## │ ├── notifications/

## │ ├── onboarding/

## │ ├── order/

## │ ├── product/

## │ ├── profile/

## │ ├── review/

## │ ├── shipping_address/

## │ ├── splash/

## │ └── wishlist/

## ├── utils/

## └── main.dart

## 2. Tạo kết nối đến CSDL lưu trữ trên Firebase (nhắc lại)

## SV xem lại kiến thức trong chương 11 (Lưu trữ và quản lý dữ liệu trong thiết bị và trên môi

## trường cloud), thực hiện các nội dung sau:




- Truy cập Firebase Console, đăng nhập tài khoản Google và tạo một project mới (đặt

## tên, chọn khu vực, tắt/bật Google Analytics nếu cần)

- Trong project Firebase vừa tạo, thực hiện thêm ứng dụng trên nền tảng Flutter và thực

## hiện các cài đặt cấu hình cơ bản (package name, app name nếu có)

- Cài đặt công cụ FlutterFire CLI trên máy (nếu chưa có), sau đó đăng nhập Firebase

## bằng lệnh: firebase login

- Tại thư mục project Flutter trong Visual Studio Code hoặc Android Studio, chạy lệnh:

## flutterfire configure → Chọn project Firebase đã tạo để liên kết

- Sau khi cấu hình thành công, kiểm tra trong thư mục lib/ của project Flutter đã xuất

## hiện file: firebase_options.dart

- Mở file firebase_options.dart để kiểm tra các thông tin cấu hình Firebase

## đã được tạo tự động (API key, project ID, app ID,...), nội dung file sẽ như sau:




```
// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
show defaultTargetPlatform, kIsWeb, TargetPlatform;
```
```
/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
/// options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
static FirebaseOptions get currentPlatform {
if (kIsWeb) {
return web;
}
switch (defaultTargetPlatform) {
case TargetPlatform.android:
return android;
case TargetPlatform.iOS:
return ios;
case TargetPlatform.macOS:
return macos;
case TargetPlatform.windows:
return windows;
case TargetPlatform.linux:
throw UnsupportedError(
'DefaultFirebaseOptions have not been configured for linux - '
'you can reconfigure this by running the FlutterFire CLI again.',
);
default:
throw UnsupportedError(
'DefaultFirebaseOptions are not supported for this platform.',
);
}
}
```
```
static const FirebaseOptions web = FirebaseOptions(
apiKey: 'AIzaSyCtQyzvaXcahnluQcUA-SfLfQa4I_BelVU',
appId: '1:233797330677:web:ff997bcf4b1104761547bc',
messagingSenderId: '233797330677',
projectId: 'map-lab-utc2-e-commerce',
authDomain: 'map-lab-utc2-e-commerce.firebaseapp.com',
```



## 3. Tạo thư mục chứa các hình ảnh

## Trong thư mục gốc của project, tạo thư mục assests để chứa các hình ảnh cần thiết (đã được

## cung cấp trên LMS) cho các màn hình chờ, màn hình giới thiệu,.. theo cấu trúc như sau:

## assets/

## └── images/

## ├── animations/

## │ ├── sammy-line-man-receives-a-mail.png

## │ └── sammy-line-success.png

## ├── banners/

## │ ├── banner_1.jpg

## │ ├── banner_2.jpg

## │ ├── banner_3.jpg

## │ ├── banner_4.jpg

## │ ├── banner_5.jpg

## │ ├── banner_6.jpg

## │ ├── banner_7.jpg

## │ ├── banner_8.jpg

## │ └── default_image.png

## ├── logos/

## │ ├── t-store-splash-logo-black.png

## │ └── t-store-splash-logo-white.png

## └── on_boarding_images/

## ├── sammy-line-delivery.gif

## ├── sammy-line-searching.gif

## └── sammy-line-shopping.gif

## 4. Cập nhật file pubspec.yaml

## Sinh viên kiểm tra nội dung đang có file pubspec.yaml và bổ sung thêm tương ứng cho

## đầy đủ theo nội dung như sau (chú ý lỗi indent):

```
name: draf_project
description: "A new Flutter project."
# The following line prevents the package from being accidentally published
to
# pub.dev using `flutter pub publish`. This is preferred for private
packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev
```
```
version: 1.0.0+
```



```
environment:
sdk: ^3.10.
```
```
# Dependencies specify other packages that your package needs in order to
work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below
to
# the latest version available on pub.dev. To see which dependencies have
newer
# versions available, run `flutter pub outdated`.
dependencies:
flutter:
sdk: flutter
```
```
# The following adds the Cupertino Icons font to your application.
# Use with the CupertinoIcons class for iOS style icons.
cupertino_icons: ^1.0.
firebase_core: ^4.7.
```
```
dev_dependencies:
flutter_test:
sdk: flutter
flutter_launcher_icons: ^0.13.
```
```
# The "flutter_lints" package below contains a set of recommended lints to
# encourage good coding practices. The lint set provided by the package is
# activated in the `analysis_options.yaml` file located at the root of your
# package. See that file for information about deactivating specific lint
# rules and activating additional ones.
flutter_lints: ^6.0.
```
```
# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec
flutter_launcher_icons:
android: true
ios: true
image_path: "assets/images/logos/t-store-splash-logo-white.png"
# The following section is specific to Flutter packages
# The following section is specific to Flutter packages.
flutter:
assets:
```
- assets/images/logos/
- assets/images/on_boarding_images/
- assets/images/animations/
- assets/images/banners/

## Sau đó trong terminal có thể chạy lại lệnh flutter pub get nếu cần




## 5. Tạo style định dạng font chữ chung cho toàn ứng dụng

## Tạo file libs/common/styles/app_colors.dart có nội dung như sau:

## Tạo file libs/common/styles/app_text_styles.dart có nội dung như sau:

## 6. Thiết kế và xây dựng màn hình chờ

## Trong terminal, SV chạy lệnh sau: flutter pub add get

## Cập nhật file main.dart có nội dung như sau:

```
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'package:firebase_core/firebase_core.dart';
```
```
void main() async {
WidgetsFlutterBinding.ensureInitialized();
runApp(MyApp());}
```
```
import 'package:flutter/material.dart';
```
```
class AppColors {
static const Color primaryBlue = Color(0xFF2F80ED);
static const Color background = Color(0xFFF5F6FA);
static const Color white = Colors.white;
static const Color grey = Color(0xFF828282);
static const Color dark = Color(0xFF333333);
}
```
```
import 'package:flutter/material.dart';
import 'app_colors.dart';
```
```
class AppTextStyle {
static TextStyle title = TextStyle(
fontSize: 22 ,
fontWeight: FontWeight.bold,
color: AppColors.dark,
);
```
```
static TextStyle subtitle = TextStyle(fontSize: 14 , color: AppColors.grey);
```
```
static TextStyle whiteTitle = TextStyle(
fontSize: 20 ,
fontWeight: FontWeight.bold,
color: Colors.white,
);
```
```
static TextStyle whiteSubtitle = TextStyle(
fontSize: 14 ,
color: Colors.white70,
);
}
```



## Cập nhật file app/app.dart có nội dung như sau:

```
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
```
```
class MyApp extends StatelessWidget {
const MyApp({super.key});
```
```
@override
Widget build(BuildContext context) {
return GetMaterialApp(
title: 'Flutter E-Commerce',
debugShowCheckedModeBanner: false,
theme: ThemeData(
scaffoldBackgroundColor: Colors.white,
canvasColor: Colors.white,
appBarTheme: const AppBarTheme(
backgroundColor: Colors.white,
elevation: 0 ,
foregroundColor: Colors.black,
),
),
initialRoute: AppRoutes.splash,
routes: AppRoutes.routes,
);
}
}
```
## Trong file libs/routes/app_routes.dart, soạn mã nguồn có nội dung sau:

```
import 'package:flutter/material.dart';
import '../screens/splash/splash_screen.dart';
```
```
class AppRoutes {
static const String splash = '/';
static const String onboarding = '/onboarding';
static const String login = '/login';
static const String forgetPassword = '/forget-password';
static const String resetEmailSent = '/reset-email-sent';
static const String register = '/register';
static const String verifyEmail = '/verify-email';
static const String registerSuccess = '/register-success';
static const String home = '/home';
static const String profile = '/profile';
static const String publisher = '/publisher';
static const String updateAccount = '/update-account';
```
```
static const String changeName = '/change-name';
static const String changeUsername = '/change-username';
```



```
static const String changePassword = '/change-password';
static const String changeEmail = '/change-email';
static const String changePhoneNumber = '/change-phonenumber';
static const String changeGender = '/change-gender';
static const String changeDateofBirth = '/change-datebirth';
static const String cartOverview = '/cart-overview';
static const String orderOverview = '/order-overview';
static const String myOrderview = '/my-order';
static const String myShippingAddressview = '/my_shipping_address';
static const String myBankAccountview = '/my_bank_account';
```
```
static Map<String, WidgetBuilder> routes = {
splash: (context) => const SplashScreen(),
};
}
```
## Tạo file lib/screens/spalsh/splash_screen.dart có nội dung như sau:

```
import 'dart:async';
import 'package:flutter/material.dart';
```
```
class SplashScreen extends StatefulWidget {
const SplashScreen({super.key});
```
```
@override
State<SplashScreen> createState() => _SplashScreenState();
}
```
```
class _SplashScreenState extends State<SplashScreen> {
@override
void initState() {
super.initState();
_navigateToOnboarding();
}
```
```
void _navigateToOnboarding() {
Future.delayed(const Duration(seconds: 2 ), () {
Navigator.pushReplacementNamed(context, '/onboarding');
});
}
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
body: Center(
child: Image.asset(
'assets/images/logos/t-store-splash-logo-black.png',
width: 180 ,
height: 180 ,
fit: BoxFit.contain,
),
```



### ),

### );

### }

### }

## 7. Thiết kế và phát triển nhóm màn hình giới thiệu

## Sinh viên xây dựng các màn hình giới thiệu (onboarding screen) có thể chuyển tiếp sau một

## khoảng thời gian cố định như sau:

## Trong file libs/bindings/onboarding_binding.dart, soạn mã nguồn có nội

## dung sau:

## Trong file libs/bindings/splash_binding.dart, soạn mã nguồn có nội dung sau:

## Trong file libs/controller/splash_controller.dart, soạn mã nguồn có nội

## dung sau:

```
import 'package:get/get.dart';
import '../controller/onboarding_controller.dart';
```
```
class OnboardingBinding extends Bindings {
@override
void dependencies() {
Get.put(OnboardingController());
}
}
```
```
import 'package:get/get.dart';
import '../controller/splash_controller.dart';
```
```
class SplashBinding extends Bindings {
@override
void dependencies() {
Get.put(SplashController());
}
}
```



## Trong file libs/data/models/onboarding_model.dart, soạn mã nguồn có nội

## dung sau:

```
import 'package:get/get.dart';
import '../routes/app_routes.dart';
```
```
class SplashController extends GetxController {
@override
void onInit() {
super.onInit();
_startTimer();
}
```
```
void _startTimer() async {
await Future.delayed(Duration(seconds: 2 ));
```
```
Get.offAllNamed(AppRoutes.onboarding);
}
}
```
```
class OnboardingModel {
final String title;
final String description;
final String imagePath;
```
```
OnboardingModel({
required this.title,
required this.description,
required this.imagePath,
});
}
```



## Trong file libs/controller/onboarding_controller.dart, soạn mã nguồn có

## nội dung sau:

```
import 'package:flutter/material.dart';
import '../data/models/onboarding_model.dart';
```
```
class OnboardingController extends ChangeNotifier {
int currentPage = 0 ;
```
```
final PageController pageController = PageController();
```
```
final List<OnboardingModel> onboardingPages = [
OnboardingModel(
title: 'Mua sắm dễ dàng',
description: 'Tìm kiếm và mua sản phẩm chỉ với vài thao tác.',
imagePath: 'assets/images/on_boarding_images/sammy-line-delivery.gif',
),
OnboardingModel(
title: 'Thanh toán an toàn',
description: 'Hỗ trợ nhiều phương thức thanh toán bảo mật.',
imagePath: 'assets/images/on_boarding_images/sammy-line-searching.gif',
),
OnboardingModel(
title: 'Giao hàng nhanh chóng',
description: 'Đơn hàng được giao đến tận tay bạn.',
imagePath: 'assets/images/on_boarding_images/sammy-line-shopping.gif',
),
];
```
```
void onPageChanged(int index) {
currentPage = index;
notifyListeners();
}
```
```
bool isLastPage() {
return currentPage == onboardingPages.length - 1 ;
}
}
```



## Trong file libs/routes/app_pages.dart, soạn mã nguồn có nội dung sau:

## Trong file libs/common/widgets/progress_dots.dart, soạn mã nguồn có nội

## dung sau:

```
import 'package:get/get.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../bindings/splash_binding.dart';
import '../bindings/onboarding_binding.dart';
import 'app_routes.dart';
```
```
class AppPages {
static final List<GetPage> pages = <GetPage>[
GetPage(
name: AppRoutes.splash,
page: () => SplashScreen(),
binding: SplashBinding(),
),
GetPage(
name: AppRoutes.onboarding,
page: () => OnboardingScreen(),
binding: OnboardingBinding(),
),
];
}
```



## Trong file libs/common/widgets/primary_button.dart, soạn mã nguồn có nội

## dung sau:

```
import 'package:flutter/material.dart';
```
```
class ProgressDots extends StatelessWidget {
final int currentIndex;
final int total;
```
```
const ProgressDots({
super.key,
required this.currentIndex,
required this.total,
});
```
```
@override
Widget build(BuildContext context) {
return Row(
mainAxisAlignment: MainAxisAlignment.center,
children: List.generate(total, (index) {
return Container(
margin: const EdgeInsets.symmetric(horizontal: 4 ),
width: currentIndex == index? 16 : 8 ,
height: 8 ,
decoration: BoxDecoration(
color: currentIndex == index? Colors.blue : Colors.grey,
borderRadius: BorderRadius.circular( 4 ),
),
);
}),
);
}
}
```



## Trong file libs/screens/onboarding/onboarding_screen.dart, soạn mã

## nguồn có nội dung sau:

```
import 'package:flutter/material.dart';
import '../../controller/onboarding_controller.dart';
import '../../common/widgets/progress_dots.dart';
import '../../common/widgets/primary_button.dart';
import '../../routes/app_routes.dart';
```
```
class OnboardingScreen extends StatefulWidget {
const OnboardingScreen({super.key});
```
```
@override
State<OnboardingScreen> createState() => _OnboardingScreenState();
}
```
```
class _OnboardingScreenState extends State<OnboardingScreen> {
late OnboardingController controller;
```
```
@override
void initState() {
super.initState();
controller = OnboardingController();
}
```
```
import 'package:flutter/material.dart';
```
```
class PrimaryButton extends StatelessWidget {
final String title;
final VoidCallback onPressed;
```
```
const PrimaryButton({
super.key,
required this.title,
required this.onPressed,
});
```
```
@override
Widget build(BuildContext context) {
return SizedBox(
width: double.infinity,
height: 48 ,
child: ElevatedButton(
onPressed: onPressed,
child: Text(title, style: const TextStyle(fontSize: 16 )),
),
);
}
}
```



```
void _goToHome() {
Navigator.pushReplacementNamed(context, AppRoutes.home);
}
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
body: SafeArea(
child: Column(
children: [
/// SKIP BUTTON
Align(
alignment: Alignment.centerRight,
child: TextButton(
onPressed: _goToHome,
child: const Text('Bỏ qua'),
),
),
```
```
/// PAGE VIEW
Expanded(
child: PageView.builder(
controller: controller.pageController,
itemCount: controller.onboardingPages.length,
onPageChanged: (index) {
setState(() {
controller.onPageChanged(index);
});
},
itemBuilder: (context, index) {
final page = controller.onboardingPages[index];
```
```
return SingleChildScrollView(
child: Padding(
padding: const EdgeInsets.all( 24 ),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Image.asset(
page.imagePath,
height: 220 ,
fit: BoxFit.contain,
),
const SizedBox(height: 32 ),
Text(
page.title,
style: const TextStyle(
fontSize: 24 ,
fontWeight: FontWeight.bold,
),
```



### ),

```
const SizedBox(height: 12 ),
Text(
page.description,
textAlign: TextAlign.center,
style: const TextStyle(fontSize: 16 ),
),
],
),
),
);
},
),
),
```
```
/// DOT INDICATOR
ProgressDots(
currentIndex: controller.currentPage,
total: controller.onboardingPages.length,
),
```
```
const SizedBox(height: 24 ),
```
```
/// NEXT / GET STARTED
Padding(
padding: const EdgeInsets.symmetric(horizontal: 24 ),
child: controller.isLastPage()
? PrimaryButton(title: 'Bắt đầu', onPressed: _goToHome)
: PrimaryButton(
title: 'Tiếp theo',
onPressed: () {
controller.pageController.nextPage(
duration: const Duration(milliseconds: 300 ),
curve: Curves.easeInOut,
);
},
),
),
```
```
const SizedBox(height: 32 ),
],
),),);}}
```
## Trong file libs/routes/app_routes.dart, cập nhật mã nguồn có nội dung sau:

```
import 'package:draf_project/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import '../screens/spalsh/splash_screen.dart';
```
```
class AppRoutes {
static const String splash = '/';
```



```
static const String onboarding = '/onboarding';
static const String login = '/login';
static const String forgetPassword = '/forget-password';
static const String resetEmailSent = '/reset-email-sent';
static const String register = '/register';
static const String verifyEmail = '/verify-email';
static const String registerSuccess = '/register-success';
static const String home = '/home';
static const String profile = '/profile';
static const String publisher = '/publisher';
static const String updateAccount = '/update-account';
```
```
static const String changeName = '/change-name';
static const String changeUsername = '/change-username';
static const String changePassword = '/change-password';
static const String changeEmail = '/change-email';
static const String changePhoneNumber = '/change-phonenumber';
static const String changeGender = '/change-gender';
static const String changeDateofBirth = '/change-datebirth';
static const String cartOverview = '/cart-overview';
static const String orderOverview = '/order-overview';
static const String myOrderview = '/my-order';
static const String myShippingAddressview = '/my_shipping_address';
static const String myBankAccountview = '/my_bank_account';
```
```
static Map<String, WidgetBuilder> routes = {
splash: (context) => const SplashScreen(),
onboarding: (context) => const OnboardingScreen(),
};
}
```
## 8. Thiết kế và phát triển thanh điều hướng và chuyển tiếp giữa các màn hình chính ở đáy

## Trong phần này chúng ta sẽ xử lý khi người dùng click vào từng mục trong

## BottomTabbarNavigation sẽ được chuyển qua các màn hình như trang chủ (home_page), cửa

## hàng (mystore), danh sách sản phẩm yêu thích (wishlist), quản lý hồ sơ người dùng (profile)

## Đầu tiên, chúng ta cần tạo khung giao diện tạm thời cho các màn hình này

## Trong file libs/screens/home/ home_screen.dart, soạn mã nguồn có nội dung

## tạm thời như sau:

```
import 'package:flutter/material.dart';
```
```
class HomeScreen extends StatelessWidget {
const HomeScreen({super.key});
```
```
@override
Widget build(BuildContext context) {
String fullName = "Guest User";
```



```
return Scaffold(
body: Column(
children: [
/// ===== HEADER =====
Container(
padding: const EdgeInsets.all( 24 ),
decoration: const BoxDecoration(
color: Colors.blue,
borderRadius: BorderRadius.only(
bottomLeft: Radius.circular( 24 ),
bottomRight: Radius.circular( 24 ),
),
),
child: SafeArea(
bottom: false,
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
children: [
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text(
'Good day for shopping',
style: TextStyle(color: Colors.white70),
),
const SizedBox(height: 4 ),
Text(
fullName,
style: const TextStyle(
color: Colors.white,
fontSize: 20 ,
fontWeight: FontWeight.bold,
),
),
],
),
const Spacer(),
```
```
/// Notification Icon (UI only)
IconButton(
onPressed: () {},
icon: const Icon(
Icons.notifications,
color: Colors.white,
),
),
```



```
/// Cart Icon (UI only)
Stack(
children: [
IconButton(
onPressed: () {},
icon: const Icon(
Icons.shopping_cart,
color: Colors.white,
),
),
Positioned(
right: 6 ,
top: 6 ,
child: Container(
padding: const EdgeInsets.all( 4 ),
decoration: const BoxDecoration(
color: Colors.red,
shape: BoxShape.circle,
),
child: const Text(
"2", // mock số lượng
style: TextStyle(
color: Colors.white,
fontSize: 10 ,
),
),
),
),
],
),
],
),
```
```
const SizedBox(height: 16 ),
```
```
/// SEARCH BAR (UI only)
TextField(
decoration: InputDecoration(
hintText: 'Tìm kiếm trong cửa hàng',
prefixIcon: const Icon(Icons.search),
filled: true,
fillColor: Colors.white,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular( 12 ),
borderSide: BorderSide.none,
),
),
),
```
```
const SizedBox(height: 16 ),
```



### /// CATEGORY TITLE

```
const Text(
'Danh mục phổ biến',
style: TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
),
),
```
```
const SizedBox(height: 12 ),
```
```
/// CATEGORY LIST (MOCK)
SizedBox(
height: 90 ,
child: ListView(
scrollDirection: Axis.horizontal,
children: List.generate( 5 , (index) {
return Padding(
padding: const EdgeInsets.only(right: 12 ),
child: Column(
children: [
const CircleAvatar(
radius: 30 ,
backgroundImage: NetworkImage(
'https://via.placeholder.com/150',
),
),
const SizedBox(height: 6 ),
Text(
"Category ${index + 1 }",
style: const TextStyle(
color: Colors.white,
fontSize: 12 ,
),
),
],
),
);
}),
),
),
],
),
),
),
```
### /// ===== CONTENT =====

```
Expanded(
child: SingleChildScrollView(
padding: const EdgeInsets.all( 16 ),
```



```
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
/// BANNER MOCK
Container(
height: 150 ,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular( 12 ),
color: Colors.grey[ 300 ],
),
child: const Center(child: Text("Banner Slider")),
),
```
```
const SizedBox(height: 24 ),
```
```
/// TITLE
Row(
children: [
const Text(
'Sản phẩm phổ biến',
style: TextStyle(
fontSize: 18 ,
fontWeight: FontWeight.bold,
),
),
const Spacer(),
TextButton(
onPressed: () {},
child: const Text('Xem tất cả'),
),
],
),
```
```
const SizedBox(height: 16 ),
```
```
/// PRODUCT GRID (MOCK)
GridView.builder(
itemCount: 6 ,
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
gridDelegate:
const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2 ,
crossAxisSpacing: 12 ,
mainAxisSpacing: 12 ,
childAspectRatio: 0.58,
),
itemBuilder: (context, index) {
return Container(
decoration: BoxDecoration(
```



```
borderRadius: BorderRadius.circular( 12 ),
border: Border.all(color: Colors.grey.shade300),
),
child: Column(
children: [
Expanded(
child: Container(
color: Colors.grey[ 300 ],
child: const Center(child: Text("Image")),
),
),
const SizedBox(height: 8 ),
const Text("Product Name"),
const SizedBox(height: 4 ),
const Text(
"\$99",
style: TextStyle(fontWeight: FontWeight.bold),
),
const SizedBox(height: 8 ),
],
),
);
},
),
],
),
),
),
],
),
);
}
}
```
## Trong file libs/screens/mystore/mystore_screen.dart, soạn mã nguồn có nội

## dung tạm thời như sau

```
import 'package:flutter/material.dart';
```
```
class MystoreScreen extends StatefulWidget {
const MystoreScreen({super.key});
```
```
@override
State<MystoreScreen> createState() => _MystoreScreenState();
}
```
```
class _MystoreScreenState extends State<MystoreScreen> {
int selectedCategoryIndex = 0 ;
```



### /// ===== MOCK DATA =====

```
final List<String> categories = [
"Tất cả",
"Điện tử",
"Thời trang",
"Gia dụng",
"Mỹ phẩm",
];
```
```
final List<String> brands = ["Nike", "Adidas", "Apple", "Samsung"];
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xFFF4F7FA),
```
```
/// ===== APPBAR =====
appBar: AppBar(
title: const Text(
"Cửa hàng của chúng tôi",
style: TextStyle(
color: Colors.black,
fontWeight: FontWeight.bold,
fontSize: 24 ,
),
),
elevation: 0 ,
backgroundColor: Colors.transparent,
actions: [
IconButton(
onPressed: () {},
icon: const Icon(Icons.search_rounded, color: Colors.black87),
),
IconButton(
onPressed: () {},
icon: const Icon(Icons.notifications_none_rounded),
),
],
),
```
```
/// ===== BODY =====
body: CustomScrollView(
physics: const BouncingScrollPhysics(),
slivers: [
_buildSectionTitle("Các thương hiệu nổi bật"),
_buildFeaturedBrands(),
```
```
_buildCategoryTabs(),
```
```
_buildSectionTitle("Thương hiệu trong danh mục"),
```



```
_buildBrandBanner(),
```
```
_buildSectionTitle("Bạn có thể quan tâm"),
_buildProductGrid(),
],
),
);
}
```
### /// ===== SECTION TITLE =====

```
Widget _buildSectionTitle(String title) {
return SliverToBoxAdapter(
child: Padding(
padding: const EdgeInsets.fromLTRB( 20 , 20 , 20 , 10 ),
child: Text(
title,
style: const TextStyle(
fontSize: 18 ,
fontWeight: FontWeight.bold,
color: Color(0xFF2D3142),
),
),
),
);
}
```
### /// ===== FEATURED BRANDS =====

```
Widget _buildFeaturedBrands() {
return SliverToBoxAdapter(
child: SizedBox(
height: 110 ,
child: ListView.builder(
scrollDirection: Axis.horizontal,
padding: const EdgeInsets.symmetric(horizontal: 10 ),
itemCount: brands.length,
itemBuilder: (_, index) {
return Container(
width: 100 ,
margin: const EdgeInsets.all( 10 ),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 20 ),
boxShadow: [
BoxShadow(
color: Colors.blueAccent.withOpacity(0.08),
blurRadius: 15 ,
offset: const Offset( 0 , 8 ),
),
],
),
```



```
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const CircleAvatar(backgroundColor: Colors.blue, radius:
20 ),
const SizedBox(height: 8 ),
Text(brands[index], style: const TextStyle(fontSize: 12 )),
],
),
);
},
),
),
);
}
```
```
/// ===== CATEGORY TABS =====
Widget _buildCategoryTabs() {
return SliverPersistentHeader(
pinned: true,
delegate: _SliverAppBarDelegate(
minHeight: 70 ,
maxHeight: 70 ,
child: Container(
color: const Color(0xFFF4F7FA),
child: ListView.builder(
scrollDirection: Axis.horizontal,
padding: const EdgeInsets.symmetric(horizontal: 10 ),
itemCount: categories.length,
itemBuilder: (_, index) {
final isSelected = selectedCategoryIndex == index;
```
```
return GestureDetector(
onTap: () {
setState(() {
selectedCategoryIndex = index;
});
},
child: AnimatedContainer(
duration: const Duration(milliseconds: 250 ),
margin: const EdgeInsets.symmetric(
horizontal: 6 ,
vertical: 12 ,
),
padding: const EdgeInsets.symmetric(horizontal: 20 ),
decoration: BoxDecoration(
gradient: isSelected
? const LinearGradient(
colors: [Color(0xFF4960F9), Color(0xFF1937FE)],
)
```



```
: null,
color: isSelected? null : Colors.white,
borderRadius: BorderRadius.circular( 15 ),
),
child: Center(
child: Text(
categories[index],
style: TextStyle(
color: isSelected? Colors.white : Colors.blueGrey,
fontWeight: isSelected
? FontWeight.bold
: FontWeight.normal,
),
),
),
),
);
},
),
),
),
);
}
```
```
/// ===== BRAND BANNER =====
Widget _buildBrandBanner() {
return SliverToBoxAdapter(
child: Column(
children: brands.map((brand) {
return Container(
margin: const EdgeInsets.symmetric(horizontal: 20 , vertical: 8 ),
padding: const EdgeInsets.all( 20 ),
decoration: BoxDecoration(
gradient: const LinearGradient(
colors: [Color(0xFF2D3142), Color(0xFF4F5D75)],
),
borderRadius: BorderRadius.circular( 20 ),
),
child: Row(
children: [
const Icon(Icons.store, color: Colors.white),
const SizedBox(width: 12 ),
Expanded(
child: Text(
brand,
style: const TextStyle(color: Colors.white),
),
),
ElevatedButton(onPressed: () {}, child: const Text("Theo
dõi")),
```



### ],

### ),

### );

```
}).toList(),
),
);
}
```
```
/// ===== PRODUCT GRID =====
Widget _buildProductGrid() {
return SliverPadding(
padding: const EdgeInsets.all( 20 ),
sliver: SliverGrid(
delegate: SliverChildBuilderDelegate((_, index) {
return Container(
decoration: BoxDecoration(
borderRadius: BorderRadius.circular( 12 ),
color: Colors.white,
),
child: Column(
children: [
Expanded(
child: Container(
color: Colors.grey[ 300 ],
child: const Center(child: Text("Image")),
),
),
const SizedBox(height: 8 ),
const Text("Product"),
const SizedBox(height: 4 ),
const Text("\$99"),
],
),
);
}, childCount: 6 ),
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2 ,
mainAxisSpacing: 20 ,
crossAxisSpacing: 20 ,
mainAxisExtent: 280 ,
),
),
);
}
}
```
### /// ===== STICKY HEADER =====

```
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
final double minHeight;
final double maxHeight;
```



```
final Widget child;
```
```
_SliverAppBarDelegate({
required this.minHeight,
required this.maxHeight,
required this.child,
});
```
```
@override
double get minExtent => minHeight;
```
```
@override
double get maxExtent => maxHeight;
```
```
@override
Widget build(context, shrinkOffset, overlapsContent) {
return SizedBox.expand(child: child);
}
```
```
@override
bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
return true;
}
}
```
## Trong file libs/screens/wishlist/ wishlist_screen.dart, soạn mã nguồn có

## nội dung tạm thời như sau:

```
import 'package:flutter/material.dart';
```
```
class WishlistScreen extends StatelessWidget {
const WishlistScreen({super.key});
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xFFF8F9FA),
body: Column(
children: [
/// ===== HEADER =====
Container(
width: double.infinity,
padding: const EdgeInsets.fromLTRB( 20 , 60 , 20 , 30 ),
color: Colors.blue,
child: Column(
children: [
const Icon(
Icons.favorite_border,
size: 80 ,
color: Colors.white,
```



### ),

```
const SizedBox(height: 16 ),
```
```
const Text(
'Wishlist',
style: TextStyle(
fontSize: 22 ,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
```
```
const SizedBox(height: 8 ),
```
```
const Text(
'Đăng nhập để xem danh sách yêu thích',
style: TextStyle(color: Colors.white70),
textAlign: TextAlign.center,
),
```
```
const SizedBox(height: 16 ),
```
### /// ===== LOGIN BUTTON =====

```
ElevatedButton(
onPressed: () {
Navigator.pushNamed(context, '/login');
// nhớ map route này trong MaterialApp
},
child: const Text('Đăng nhập ngay'),
),
],
),
),
```
### /// ===== OPTIONAL TEXT =====

```
Expanded(
child: Center(
child: Text(
'Bạn chưa đăng nhập',
style: TextStyle(color: Colors.grey[ 600 ]),
),
),
),
],
),
);
}
}
```



## Trong file libs/screens/profile/profile_screen.dart, soạn mã nguồn có nội

## dung sau:

```
import 'package:flutter/material.dart';
```
```
class ProfileScreen extends StatelessWidget {
const ProfileScreen({super.key});
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xFFF5F6FA),
body: Column(
children: [
/// ===== HEADER =====
Container(
width: double.infinity,
padding: const EdgeInsets.fromLTRB( 20 , 60 , 20 , 30 ),
color: Colors.blue,
child: Column(
children: [
const CircleAvatar(
radius: 40 ,
child: Icon(Icons.person, size: 40 ),
),
const SizedBox(height: 16 ),
```
```
const Text(
'Guest User',
style: TextStyle(
fontSize: 20 ,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
```
```
const SizedBox(height: 16 ),
```
### /// ===== LOGIN BUTTON =====

```
ElevatedButton(
onPressed: () {
Navigator.pushNamed(context, '/login');
// đổi '/login' theo route bạn dùng
},
child: const Text('Đăng nhập ngay'),
),
],
),
),
```



```
/// ===== OPTIONAL CONTENT (có thể bỏ nếu muốn tối giản hơn) =====
Expanded(
child: Center(
child: Text(
'Vui lòng đăng nhập để sử dụng đầy đủ tính năng',
style: TextStyle(color: Colors.grey[ 600 ]),
),
),
),
],
),
);
}
}
```
## Trong file libs/screens/home/main_navigation_screen.dart, soạn mã

## nguồn có nội dung sau:

```
import 'package:flutter/material.dart';
import 'home_screen.dart';
import '../profile/profile_screen.dart';
import '../mystore/mystore_screen.dart';
import '../wishlist/wishlist_screen.dart';
```
```
class MainNavigationScreen extends StatefulWidget {
const MainNavigationScreen({super.key});
```
```
@override
State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}
```
```
class _MainNavigationScreenState extends State<MainNavigationScreen> {
int currentIndex = 0 ;
```
```
final List<Widget> screens = [
HomeScreen(),
MystoreScreen(),
const WishlistScreen(),
const ProfileScreen(),
];
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
body: screens[currentIndex],
bottomNavigationBar: BottomNavigationBar(
currentIndex: currentIndex,
type: BottomNavigationBarType.fixed,
onTap: (index) {
```



```
setState(() {
currentIndex = index;
});
},
items: const [
BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
BottomNavigationBarItem(
icon: Icon(Icons.business),
label: 'My store',
),
BottomNavigationBarItem(
icon: Icon(Icons.favorite_border),
label: 'Wishlist',
),
BottomNavigationBarItem(icon: Icon(Icons.person), label:
'Profile'),
],
),
);
}
}
```
## Trong file libs/routes/app_routes.dart, cập nhật tiếp mã nguồn có nội dung sau:

```
import 'package:draf_project/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import '../screens/home/main_navigation_screen.dart';
import '../screens/spalsh/splash_screen.dart';
```
```
class AppRoutes {
static const String splash = '/';
static const String onboarding = '/onboarding';
static const String login = '/login';
static const String forgetPassword = '/forget-password';
static const String resetEmailSent = '/reset-email-sent';
static const String register = '/register';
static const String verifyEmail = '/verify-email';
static const String registerSuccess = '/register-success';
static const String home = '/home';
static const String profile = '/profile';
static const String publisher = '/publisher';
static const String updateAccount = '/update-account';
```
```
static const String changeName = '/change-name';
static const String changeUsername = '/change-username';
static const String changePassword = '/change-password';
static const String changeEmail = '/change-email';
static const String changePhoneNumber = '/change-phonenumber';
static const String changeGender = '/change-gender';
```



```
static const String changeDateofBirth = '/change-datebirth';
static const String cartOverview = '/cart-overview';
static const String orderOverview = '/order-overview';
static const String myOrderview = '/my-order';
static const String myShippingAddressview = '/my_shipping_address';
static const String myBankAccountview = '/my_bank_account';
```
```
static Map<String, WidgetBuilder> routes = {
splash: (context) => const SplashScreen(),
onboarding: (context) => const OnboardingScreen(),
home: (context) => const MainNavigationScreen(),
};
}
```
## 9. Thiết kế và phát triển nhóm chức năng đăng nhập và đăng ký tài khoản người dùng

## Trong file libs/common/state/ auth_manager.dart, soạn mã nguồn có nội dung

## như sau:

## Trong file libs/common/widgets/social_login_button.dart, soạn mã nguồn

## có nội dung như sau:

```
class AuthManager {
static bool _isLoggedIn = false;
```
```
static bool get isLoggedIn {
return _isLoggedIn;
}
```
```
static void login() {
_isLoggedIn = true;
}
```
```
static void logout() {
_isLoggedIn = false;
}
}
```



## Trong file libs/common/widgets/custom_textfield.dart, soạn mã nguồn có

## nội dung như sau:

```
import 'package:flutter/material.dart';
```
```
class CustomTextField extends StatelessWidget {
final TextEditingController controller;
final String labelText;
final bool obscureText;
final Widget? suffixIcon;
final TextInputType keyboardType;
final String? Function(String?)? validator;
```
```
const CustomTextField({
super.key,
required this.controller,
required this.labelText,
required this.keyboardType,
this.obscureText = false,
this.suffixIcon,
this.validator,
});
```
```
import 'package:flutter/material.dart';
```
```
class SocialLoginButton extends StatelessWidget {
final IconData icon;
final String title;
final VoidCallback onPressed;
```
```
const SocialLoginButton({
super.key,
required this.icon,
required this.title,
required this.onPressed,
});
```
```
@override
Widget build(BuildContext context) {
return OutlinedButton.icon(
onPressed: onPressed,
icon: Icon(icon),
label: Text(title),
style: OutlinedButton.styleFrom(
minimumSize: const Size(double.infinity, 48 ),
),
);
}
}
```



```
@override
Widget build(BuildContext context) {
return TextFormField(
controller: controller,
keyboardType: keyboardType,
obscureText: obscureText,
validator: validator,
decoration: InputDecoration(
labelText: labelText,
border: const OutlineInputBorder(),
suffixIcon: suffixIcon,
),
);
}
}
```
## Trong file libs/controller/login_controller.dart, soạn mã nguồn có nội

## dung như sau:

```
import '../data/services/login_auth_service.dart';
import '../data/models/user_model.dart';
import 'package:get/get.dart';
```
```
class AuthController extends GetxController {
final AuthService _authService = AuthService();
```
```
UserModel? currentUser;
Future<void> login(String email, String password) async {
UserModel user = await _authService.loginWithEmailPassword(email,
password);
```
```
currentUser = user;
```
```
Get.back(result: true);
}
```
```
Future<void> logout() async {
await _authService.logout();
currentUser = null;
```
```
update();
}
}
```



## Trong file libs/controller/register_controller.dart, soạn mã nguồn có nội

## dung như sau:

## Trong file libs/data/services/login_auth_service.dart, soạn mã nguồn có

## nội dung như sau:

```
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
```
```
class AuthService {
final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
```
```
import 'package:get/get.dart';
import '../data/services/register_auth_service.dart';
import '../data/models/user_model.dart';
```
```
class RegisterController {
final AuthService _authService = AuthService();
```
```
Future<String?> register({
required String firstName,
required String lastName,
required String username,
required String email,
required String phone,
required String password,
}) async {
try {
UserModel userModel = UserModel(
id: "",
firstName: firstName,
lastName: lastName,
username: username,
email: email,
phone: phone,
);
```
```
await _authService.registerUser(userModel: userModel, password:
password);
```
```
return null;
} catch (e) {
return e.toString();
}
}
}
```



```
Future<UserModel> loginWithEmailPassword(
String email,
String password,
) async {
try {
UserCredential credential = await _auth.signInWithEmailAndPassword(
email: email,
password: password,
);
```
```
User? firebaseUser = credential.user;
```
```
if (firebaseUser == null) {
throw Exception('Không tìm thấy người dùng');
}
```
```
if (!firebaseUser.emailVerified) {
throw Exception('Email not verified');
}
```
```
DocumentSnapshot userDoc = await _firestore
.collection('users')
.doc(firebaseUser.uid)
.get();
```
```
if (!userDoc.exists) {
throw Exception('Không tìm thấy dữ liệu người dùng');
}
```
```
Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
```
```
UserModel userModel = UserModel.fromMap(data);
```
```
return userModel;
} on FirebaseAuthException catch (e) {
if (e.code == 'user-not-found') {
throw Exception('Email không tồn tại');
}
```
```
if (e.code == 'wrong-password') {
throw Exception('Mật khẩu không đúng');
}
```
```
if (e.code == 'invalid-email') {
throw Exception('Email không hợp lệ');
}
```
```
if (e.code == 'user-disabled') {
throw Exception('Tài khoản đã bị vô hiệu hóa');
}
```



```
throw Exception('Đăng nhập thất bại');
}
}
```
```
Future<void> logout() async {
await _auth.signOut();
}
}
```
## Trong terminal, chạy lệnh sau flutter pub add firebase_core firebase_auth

## để thêm vào thư viện của firebase cần thiết

## Tiếp tục trong terminal, chạy lệnh sau flutter pub add cloud_firestore để thêm

## vào thư viện của firebase cần thiết

## Trong file libs/data/services/register_auth_service.dart, soạn mã

## nguồn có nội dung như sau:

```
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
```
```
class AuthService {
final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
Future<User?> registerUser({
required UserModel userModel,
required String password,
}) async {
UserCredential credential = await _auth.createUserWithEmailAndPassword(
email: userModel.email,
password: password,
);
```
```
User? firebaseUser = credential.user;
```
```
if (firebaseUser != null) {
await firebaseUser.sendEmailVerification();
```
```
String uid = firebaseUser.uid;
```
```
UserModel updatedUserModel = UserModel(
id: uid,
firstName: userModel.firstName,
lastName: userModel.lastName,
username: userModel.username,
email: userModel.email,
phone: userModel.phone,
);
```



```
await _firestore
.collection("users")
.doc(uid)
.set(updatedUserModel.toMap());
}
```
```
return firebaseUser;
}
}
```
## Trong file libs/screens/auth/ forget_password_screen.dart, soạn mã

## nguồn có nội dung như sau:

```
import 'package:flutter/material.dart';
import '../../common/widgets/primary_button.dart';
import '../../routes/app_routes.dart';
import '../../utils/validators.dart';
```
```
class ForgetPasswordScreen extends StatelessWidget {
ForgetPasswordScreen({super.key});
```
```
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
final TextEditingController emailController = TextEditingController();
```
```
void _submit(BuildContext context) {
final bool isValid = formKey.currentState!.validate();
```
```
if (!isValid) {
return;
}
```
```
Navigator.pushNamed(
context,
AppRoutes.resetEmailSent,
arguments: emailController.text,
);
}
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Khôi phục mật khẩu')),
body: Padding(
padding: const EdgeInsets.all( 24 ),
child: Form(
key: formKey,
child: Column(
children: [
TextFormField(
```



```
controller: emailController,
keyboardType: TextInputType.emailAddress,
decoration: const InputDecoration(
labelText: 'Email',
border: OutlineInputBorder(),
),
validator: (value) {
return Validators.validateEmail(value ?? '');
},
),
```
```
const SizedBox(height: 24 ),
```
```
PrimaryButton(
title: 'Gửi yêu cầu',
onPressed: () => _submit(context),
),
],
),
),
),
);
}
}
```
## Trong file libs/screens/auth/login_screen.dart, soạn mã nguồn có nội dung

## như sau:

```
import 'package:draf_project/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/primary_button.dart';
import '../../common/widgets/social_login_button.dart';
import '../../routes/app_routes.dart';
import '../../utils/validators.dart';
import '../../utils/preferences_helper.dart';
```
```
class LoginScreen extends StatefulWidget {
const LoginScreen({super.key});
```
```
@override
State<LoginScreen> createState() => _LoginScreenState();
}
```
```
class _LoginScreenState extends State<LoginScreen>
with SingleTickerProviderStateMixin {
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
```



```
final AuthController authController = Get.put(AuthController());
```
```
bool isPasswordHidden = true;
bool rememberMe = false;
```
```
// Hiệu ứng cho các phần tử xuất hiện
late AnimationController _controller;
late Animation<double> _fadeAnimation;
```
```
@override
void initState() {
super.initState();
_loadRememberMe();
_controller = AnimationController(
vsync: this,
duration: const Duration(milliseconds: 1000 ),
);
_fadeAnimation = CurvedAnimation(parent: _controller, curve:
Curves.easeIn);
_controller.forward();
}
```
```
@override
void dispose() {
_controller.dispose();
emailController.dispose();
passwordController.dispose();
super.dispose();
}
```
```
Future<void> _loadRememberMe() async {
final bool savedRememberMe = await PreferencesHelper.getRememberMe();
final String? savedEmail = await PreferencesHelper.getSavedEmail();
```
```
setState(() {
rememberMe = savedRememberMe;
if (savedEmail != null) {
emailController.text = savedEmail;
}
});
}
```
```
Future<void> _handleLogin() async {
final bool isValid = formKey.currentState!.validate();
if (!isValid) return;
```
```
try {
await authController.login(
emailController.text.trim(),
passwordController.text.trim(),
```



### );

```
await PreferencesHelper.saveRememberMe(rememberMe,
emailController.text);
```
```
if (mounted) {
Navigator.pushNamedAndRemoveUntil(
context,
AppRoutes.home,
(route) => false,
);
}
} catch (e) {
String message = e.toString();
if (message.contains('Email not verified')) {
message = 'Vui lòng xác thực email trước khi đăng nhập';
}
```
```
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text(message),
behavior: SnackBarBehavior.floating,
backgroundColor: Colors.redAccent,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 10 ),
),
),
);
}
}
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
body: Container(
// Hiệu ứng Gradient cho nền
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [Colors.blue.shade50, Colors.white,
Colors.blue.shade100],
),
),
child: SafeArea(
child: FadeTransition(
opacity: _fadeAnimation,
child: SingleChildScrollView(
physics: const BouncingScrollPhysics(),
child: Padding(
```



```
padding: const EdgeInsets.symmetric(horizontal: 24.0),
child: Form(
key: formKey,
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const SizedBox(height: 40 ),
```
```
// Biểu tượng Logo sinh động
Center(
child: Container(
padding: const EdgeInsets.all( 16 ),
decoration: BoxDecoration(
color: Colors.blue.withOpacity(0.1),
),
child: const Icon(
Icons.lock_person_rounded,
size: 80 ,
color: Colors.blueAccent,
),
),
),
```
```
const SizedBox(height: 24 ),
```
```
const Center(
child: Text(
'Chào mừng trở lại!',
style: TextStyle(
fontSize: 28 ,
fontWeight: FontWeight.bold,
color: Colors.black87,
letterSpacing: 0.5,
),
),
),
const Center(
child: Text(
'Vui lòng đăng nhập để tiếp tục',
style: TextStyle(fontSize: 16 , color: Colors.grey),
),
),
```
```
const SizedBox(height: 40 ),
```
```
// Input Email
TextFormField(
controller: emailController,
keyboardType: TextInputType.emailAddress,
decoration: InputDecoration(
```



```
labelText: 'Email',
hintText: 'example@gmail.com',
prefixIcon: const Icon(Icons.email_outlined),
filled: true,
fillColor: Colors.white.withOpacity(0.8),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular( 15 ),
borderSide: BorderSide.none,
),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular( 15 ),
borderSide: BorderSide(color:
Colors.blue.shade100),
),
),
validator: (value) =>
Validators.validateEmail(value ?? ''),
),
```
```
const SizedBox(height: 20 ),
```
```
// Input Password
TextFormField(
controller: passwordController,
obscureText: isPasswordHidden,
decoration: InputDecoration(
labelText: 'Mật khẩu',
prefixIcon: const Icon(Icons.lock_outline_rounded),
filled: true,
fillColor: Colors.white.withOpacity(0.8),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular( 15 ),
borderSide: BorderSide.none,
),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular( 15 ),
borderSide: BorderSide(color:
Colors.blue.shade100),
),
suffixIcon: IconButton(
icon: Icon(
isPasswordHidden
? Icons.visibility_off_outlined
: Icons.visibility_outlined,
color: Colors.blue,
),
onPressed: () => setState(
() => isPasswordHidden = !isPasswordHidden,
),
),
```



### ),

```
validator: (value) =>
Validators.validatePassword(value ?? ''),
),
```
```
const SizedBox(height: 12 ),
```
```
// Ghi nhớ & Quên mật khẩu
Row(
children: [
SizedBox(
height: 24 ,
width: 24 ,
child: Checkbox(
value: rememberMe,
activeColor: Colors.blueAccent,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 4 ),
),
onChanged: (value) =>
setState(() => rememberMe = value ??
false),
),
),
const SizedBox(width: 8 ),
const Text(
'Ghi nhớ',
style: TextStyle(color: Colors.black54),
),
const Spacer(),
TextButton(
onPressed: () => Navigator.pushNamed(
context,
AppRoutes.forgetPassword,
),
child: const Text(
'Quên mật khẩu?',
style: TextStyle(
color: Colors.blueAccent,
fontWeight: FontWeight.w600,
),
),
),
],
),
```
```
const SizedBox(height: 24 ),
```
```
// Nút Đăng nhập
SizedBox(
```



```
width: double.infinity,
child: PrimaryButton(
title: 'Đăng nhập',
onPressed: _handleLogin,
),
),
```
```
const SizedBox(height: 24 ),
```
```
// Phân tách OR sinh động hơn
Row(
children: [
Expanded(
child: Divider(
color: Colors.grey.shade400,
thickness: 1 ,
),
),
const Padding(
padding: EdgeInsets.symmetric(horizontal: 16 ),
child: Text(
'Hoặc đăng nhập với',
style: TextStyle(color: Colors.grey),
),
),
Expanded(
child: Divider(
color: Colors.grey.shade400,
thickness: 1 ,
),
),
],
),
```
```
const SizedBox(height: 24 ),
```
```
// Social Login
SocialLoginButton(
icon: Icons.facebook,
title: 'Facebook',
onPressed: () {},
),
const SizedBox(height: 12 ),
SocialLoginButton(
icon: Icons.g_mobiledata,
title: 'Google',
onPressed: () {},
),
```
```
const SizedBox(height: 32 ),
```



```
// Footer
Center(
child: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Text("Bạn chưa có tài khoản? "),
GestureDetector(
onTap: () => Navigator.pushNamed(
context,
AppRoutes.register,
),
child: const Text(
'Đăng ký ngay',
style: TextStyle(
color: Colors.blueAccent,
fontWeight: FontWeight.bold,
fontSize: 15 ,
),
),
),
],
),
),
const SizedBox(height: 40 ),
],
),
),
),
),
),
),
),
);
}
}
```
## Trong file libs/screens/auth/register_screen.dart, soạn mã nguồn có nội

## dung như sau:

```
import 'package:draf_project/controller/register_controller.dart';
import 'package:flutter/material.dart';
import '../../common/widgets/primary_button.dart';
import '../../common/widgets/social_login_button.dart';
import '../../utils/validators.dart';
import '../../routes/app_routes.dart';
```
```
class RegisterScreen extends StatefulWidget {
const RegisterScreen({super.key});
```



```
@override
State<RegisterScreen> createState() => _RegisterScreenState();
}
```
```
class _RegisterScreenState extends State<RegisterScreen> {
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
```
```
final TextEditingController firstNameController = TextEditingController();
final TextEditingController lastNameController = TextEditingController();
final TextEditingController usernameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final RegisterController registerController = RegisterController();
bool isPasswordHidden = true;
bool agreePolicy = false;
```
```
Future<void> _submitRegister() async {
final bool isValid = formKey.currentState!.validate();
```
```
if (!isValid) {
return;
}
```
```
if (!agreePolicy) {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text('Bạn phải đồng ý Privacy & Terms')),
);
return;
}
```
```
String? error = await registerController.register(
firstName: firstNameController.text.trim(),
lastName: lastNameController.text.trim(),
username: usernameController.text.trim(),
email: emailController.text.trim(),
phone: phoneController.text.trim(),
password: passwordController.text.trim(),
);
```
```
if (error != null) {
ScaffoldMessenger.of(
context,
).showSnackBar(SnackBar(content: Text(error)));
return;
}
```
```
Navigator.pushNamed(
context,
```



```
AppRoutes.verifyEmail,
arguments: emailController.text.trim(),
);
}
```
```
InputDecoration _inputDecoration(
String label,
IconData icon, {
Widget? suffixIcon,
}) {
return InputDecoration(
labelText: label,
border: const OutlineInputBorder(),
prefixIcon: Icon(icon),
suffixIcon: suffixIcon,
);
}
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Tạo tài khoản')),
body: SafeArea(
child: SingleChildScrollView(
padding: const EdgeInsets.all( 24 ),
child: Form(
key: formKey,
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text(
"Nhập thông tin tài khoản đăng ký ở đây",
style: TextStyle(fontSize: 26 , fontWeight:
FontWeight.bold),
),
```
```
const SizedBox(height: 32 ),
```
```
TextFormField(
controller: firstNameController,
decoration: _inputDecoration('First Name', Icons.person),
validator: (value) {
return Validators.validateRequired(
value ?? '',
'First name',
);
},
),
```
```
const SizedBox(height: 16 ),
```



```
TextFormField(
controller: lastNameController,
decoration: _inputDecoration(
'Last Name',
Icons.person_outline,
),
validator: (value) {
return Validators.validateRequired(
value ?? '',
'Last name',
);
},
),
```
```
const SizedBox(height: 16 ),
```
```
TextFormField(
controller: usernameController,
decoration: _inputDecoration(
'Username',
Icons.alternate_email,
),
validator: (value) {
return Validators.validateRequired(value ?? '',
'Username');
},
),
```
```
const SizedBox(height: 16 ),
```
```
TextFormField(
controller: emailController,
keyboardType: TextInputType.emailAddress,
decoration: _inputDecoration('Email', Icons.email),
validator: (value) {
return Validators.validateEmail(value ?? '');
},
),
```
```
const SizedBox(height: 16 ),
```
```
TextFormField(
controller: phoneController,
keyboardType: TextInputType.phone,
decoration: _inputDecoration('Phone Number', Icons.phone),
validator: (value) {
return Validators.validatePhone(value ?? '');
},
),
```



```
const SizedBox(height: 16 ),
```
```
TextFormField(
controller: passwordController,
obscureText: isPasswordHidden,
decoration: _inputDecoration(
'Password',
Icons.lock,
suffixIcon: IconButton(
icon: Icon(
isPasswordHidden
? Icons.visibility_off
: Icons.visibility,
),
onPressed: () {
setState(() {
isPasswordHidden = !isPasswordHidden;
});
},
),
),
validator: (value) {
return Validators.validatePassword(value ?? '');
},
),
```
```
const SizedBox(height: 16 ),
```
```
Row(
children: [
Checkbox(
value: agreePolicy,
onChanged: (value) {
setState(() {
agreePolicy = value ?? false;
});
},
),
Expanded(
child: Wrap(
children: const [
Text('Tôi đồng ý với '),
Text(
'Chính sách bảo mật',
style: TextStyle(
color: Colors.blue,
decoration: TextDecoration.underline,
),
),
```



```
Text(' và '),
Text(
'Điều khoản sử dụng',
style: TextStyle(
color: Colors.blue,
decoration: TextDecoration.underline,
),
),
],
),
),
],
),
```
```
const SizedBox(height: 16 ),
```
```
PrimaryButton(
title: 'Tạo tài khoản',
onPressed: _submitRegister,
),
```
```
const SizedBox(height: 24 ),
```
```
const Center(child: Text('OR')),
```
```
const SizedBox(height: 16 ),
```
```
SocialLoginButton(
icon: Icons.g_mobiledata,
title: 'Đăng ký với Google',
onPressed: () {},
),
```
```
const SizedBox(height: 12 ),
```
```
SocialLoginButton(
icon: Icons.facebook,
title: 'Đăng ký với Facebook',
onPressed: () {},
),
],
),
),
),
),
);
}
}
```



## Trong file libs/screens/auth/register_success_screen.dart, soạn mã

## nguồn có nội dung như sau:

```
import 'package:flutter/material.dart';
import '../../common/widgets/primary_button.dart';
import '../../routes/app_routes.dart';
```
```
class RegisterSuccessScreen extends StatelessWidget {
const RegisterSuccessScreen({super.key});
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
body: SafeArea(
child: Padding(
padding: const EdgeInsets.all( 24 ),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Image.asset(
'assets/images/animations/sammy-line-success.png',
height: 200 ,
),
```
```
const SizedBox(height: 32 ),
```
```
const Text(
'Tài khoản của bạn đã được tạo thành công',
textAlign: TextAlign.center,
style: TextStyle(fontSize: 26 , fontWeight: FontWeight.bold),
),
```
```
const SizedBox(height: 16 ),
```
```
const Text(
'Chào mừng! Tài khoản của bạn đã sẵn sàng để sử dụng.',
textAlign: TextAlign.center,
),
```
```
const SizedBox(height: 32 ),
```
```
PrimaryButton(
title: 'Tiếp tục',
onPressed: () {
Navigator.pushNamedAndRemoveUntil(
context,
AppRoutes.login,
(route) => false,
);
```



### },

### ),

### ],

### ),

### ),

### ),

### );

### }

### }

## Trong file libs/screens/auth/reset_email_sent_screen.dart, soạn mã

## nguồn có nội dung như sau:

```
import 'package:flutter/material.dart';
import '../../common/widgets/primary_button.dart';
import '../../routes/app_routes.dart';
```
```
class ResetEmailSentScreen extends StatelessWidget {
final String email;
```
```
const ResetEmailSentScreen({super.key, required this.email});
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
body: SafeArea(
child: Padding(
padding: const EdgeInsets.all( 24 ),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Icon(Icons.email_outlined, size: 100 ),
```
```
const SizedBox(height: 24 ),
```
```
const Text(
'Yêu cầu đã được gửi',
style: TextStyle(fontSize: 24 , fontWeight: FontWeight.bold),
),
```
```
const SizedBox(height: 12 ),
```
```
Text('Liên kết khôi phục mật khẩu đã gửi tới:'),
```
```
const SizedBox(height: 8 ),
```
```
Text(email, style: const TextStyle(fontWeight:
FontWeight.bold)),
```
```
const SizedBox(height: 32 ),
```



```
PrimaryButton(
title: 'Xong',
onPressed: () {
Navigator.pushNamedAndRemoveUntil(
context,
AppRoutes.login,
(route) => false,
);
},
),
```
```
TextButton(onPressed: () {}, child: const Text('Gửi lại
email')),
],
),
),
),
);
}
}
```
## Trong file libs/screens/auth/verify_email_screen.dart, soạn mã nguồn có

## nội dung như sau:

```
import 'package:flutter/material.dart';
import '../../common/widgets/primary_button.dart';
import '../../routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
```
```
class VerifyEmailScreen extends StatelessWidget {
final String email;
```
```
const VerifyEmailScreen({super.key, required this.email});
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
body: SafeArea(
child: Padding(
padding: const EdgeInsets.all( 24 ),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
/// Image
Image.asset(
'assets/images/animations/sammy-line-man-receives-a-
mail.png',
height: 200 ,
```



### ),

```
const SizedBox(height: 32 ),
```
```
const Text(
'Xác minh địa chỉ email của bạn',
textAlign: TextAlign.center,
style: TextStyle(fontSize: 26 , fontWeight: FontWeight.bold),
),
```
```
const SizedBox(height: 16 ),
```
```
const Text(
'Hệ thống đã gửi một liên kết xác minh tới:',
textAlign: TextAlign.center,
),
```
```
const SizedBox(height: 8 ),
```
```
Text(email, style: const TextStyle(fontWeight:
FontWeight.bold)),
```
```
const SizedBox(height: 32 ),
```
```
PrimaryButton(
title: 'Tiếp tục',
onPressed: () async {
User? user = FirebaseAuth.instance.currentUser;
```
```
if (user != null) {
await user.reload();
user = FirebaseAuth.instance.currentUser;
```
```
if (user!.emailVerified) {
Navigator.pushNamed(context,
AppRoutes.registerSuccess);
} else {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text(
'Hãy xác minh email trước khi tiếp tục',
),
),
);
}
}
},
),
```
```
const SizedBox(height: 16 ),
```



```
TextButton(
onPressed: () async {
User? user = FirebaseAuth.instance.currentUser;
```
```
if (user != null) {
await user.sendEmailVerification();
```
```
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text('Email xác minh đã được gửi lại'),
),
);
}
},
child: const Text('Gửi lại email'),
),
],
),
),
),
);
}
}
```
## Trong file libs/utils/validators.dart, soạn mã nguồn có nội dung như sau:

```
class Validators {
static String? validateEmail(String value) {
if (value.isEmpty) {
return 'Email không được để trống';
}
```
```
if (!value.contains('@')) {
return 'Email không hợp lệ';
}
```
```
return null;
}
```
```
static String? validatePassword(String value) {
if (value.isEmpty) {
return 'Password không được để trống';
}
```
```
if (value.length < 6 ) {
return 'Password phải >= 6 ký tự';
}
```



```
return null;
}
```
```
static String? validateRequired(String value, String fieldName) {
if (value.isEmpty) {
return '$fieldName không được để trống';
}
return null;
}
```
```
static String? validatePhone(String value) {
if (value.isEmpty) {
return 'Số điện thoại không được để trống';
}
```
```
if (value.length < 9 ) {
return 'Số điện thoại không hợp lệ';
}
```
```
return null;
}
}
```
## Trong file libs/utils/preferences_helper.dart, soạn mã nguồn có nội dung

## như sau:




## Tiếp tục trong terminal, chạy lệnh sau flutter pub add shared_preferences để

## thêm vào thư viện shared_preferences

## Trong file libs/routes/app_routes.dart, cập nhật mã nguồn có nội dung sau:

```
import 'package:draf_project/screens/auth/forget_password_screen.dart';
import 'package:draf_project/screens/auth/login_screen.dart';
import 'package:draf_project/screens/auth/register_screen.dart';
import 'package:draf_project/screens/auth/register_success_screen.dart';
import 'package:draf_project/screens/auth/reset_email_sent_screen.dart';
import 'package:draf_project/screens/auth/verify_email_screen.dart';
import 'package:draf_project/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import '../screens/home/main_navigation_screen.dart';
import '../screens/spalsh/splash_screen.dart';
```
```
class AppRoutes {
static const String splash = '/';
static const String onboarding = '/onboarding';
```
```
import 'package:shared_preferences/shared_preferences.dart';
```
```
class PreferencesHelper {
static const String rememberMeKey = 'remember_me';
static const String emailKey = 'saved_email';
```
```
static Future<void> saveRememberMe(bool rememberMe, String email) async {
final SharedPreferences prefs = await SharedPreferences.getInstance();
```
```
await prefs.setBool(rememberMeKey, rememberMe);
```
```
if (rememberMe) {
await prefs.setString(emailKey, email);
} else {
await prefs.remove(emailKey);
}
}
```
```
static Future<bool> getRememberMe() async {
final SharedPreferences prefs = await SharedPreferences.getInstance();
```
```
return prefs.getBool(rememberMeKey) ?? false;
}
```
```
static Future<String?> getSavedEmail() async {
final SharedPreferences prefs = await SharedPreferences.getInstance();
```
```
return prefs.getString(emailKey);
}
}
```



```
static const String login = '/login';
static const String forgetPassword = '/forget-password';
static const String resetEmailSent = '/reset-email-sent';
static const String register = '/register';
static const String verifyEmail = '/verify-email';
static const String registerSuccess = '/register-success';
static const String home = '/home';
static const String profile = '/profile';
static const String publisher = '/publisher';
static const String updateAccount = '/update-account';
```
```
static const String changeName = '/change-name';
static const String changeUsername = '/change-username';
static const String changePassword = '/change-password';
static const String changeEmail = '/change-email';
static const String changePhoneNumber = '/change-phonenumber';
static const String changeGender = '/change-gender';
static const String changeDateofBirth = '/change-datebirth';
static const String cartOverview = '/cart-overview';
static const String orderOverview = '/order-overview';
static const String myOrderview = '/my-order';
static const String myShippingAddressview = '/my_shipping_address';
static const String myBankAccountview = '/my_bank_account';
```
```
static Map<String, WidgetBuilder> routes = {
splash: (context) => const SplashScreen(),
onboarding: (context) => const OnboardingScreen(),
home: (context) => const MainNavigationScreen(),
register: (context) => const RegisterScreen(),
login: (context) => const LoginScreen(),
forgetPassword: (context) => ForgetPasswordScreen(),
verifyEmail: (context) {
final String email = ModalRoute.of(context)!.settings.arguments as
String;
return VerifyEmailScreen(email: email);
},
```
```
registerSuccess: (context) => const RegisterSuccessScreen(),
```
```
resetEmailSent: (context) {
final email = ModalRoute.of(context)!.settings.arguments as String;
return ResetEmailSentScreen(email: email);
},
};
}
```
## Trong file libs/main.dart, cập nhật mã nguồn có nội dung sau:




## 10. Thiết kế và phát triển nhóm chức năng quản lý thông tin người dùng

## Trong file libs/common/widgets/profile_menu_item.dart, cập nhật mã nguồn

## có nội dung sau:

```
import 'package:flutter/material.dart';
import '../styles/app_colors.dart';
import '../styles/app_text_styles.dart';
```
```
class ProfileMenuItem extends StatelessWidget {
final IconData icon;
final String title;
final String subtitle;
final VoidCallback onTap;
```
```
const ProfileMenuItem({
super.key,
required this.icon,
required this.title,
required this.subtitle,
required this.onTap,
});
```
```
@override
Widget build(BuildContext context) {
return InkWell(
onTap: onTap,
child: Padding(
padding: const EdgeInsets.symmetric(vertical: 14 ),
child: Row(
children: [
Icon(icon, color: AppColors.primaryBlue),
const SizedBox(width: 16 ),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
```
```
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'package:firebase_core/firebase_core.dart';
```
```
import 'package:get/get.dart';
import 'controller/login_controller.dart';
```
```
void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
Get.put(AuthController());
runApp(MyApp());
}
```



```
children: [
Text(title, style: AppTextStyle.title.copyWith(fontSize:
16 )),
const SizedBox(height: 4 ),
Text(subtitle, style: AppTextStyle.subtitle),
],
),
),
const Icon(Icons.arrow_forward_ios, size: 16 ),
],
),
),
);
}
}
```
## Trong file libs/controller/update_account_controller.dart, cập nhật mã

## nguồn có nội dung sau:

```
import 'package:draf_project/controller/login_controller.dart';
import 'package:flutter/material.dart';
import '../data/services/update_account_service.dart';
import 'package:get/get.dart';
import 'package:draf_project/controller/login_controller.dart';
```
```
class UpdateAccountController extends GetxController {
final UpdateAccountService _service = UpdateAccountService();
```
```
Future<void> changeName(String fullName) async {
final authController = Get.find<AuthController>();
```
```
final user = authController.currentUser;
```
```
if (user == null) return;
```
```
// Tách firstName + lastName
List<String> parts = fullName.trim().split(' ');
```
```
String firstName = parts.first;
String lastName = parts.length > 1? parts.sublist( 1 ).join(' ') : '';
```
```
// Update Firestore
await _service.updateName(
userId: user.id,
firstName: firstName,
lastName: lastName,
);
```
```
// 2Update local currentUser
```



```
authController.currentUser = user.copyWith(
firstName: firstName,
lastName: lastName,
);
```
```
authController.update(); // nếu dùng GetBuilder
}
```
```
Future<void> updateUsername(String username) async {
await _service.updateUsername(username);
}
```
```
Future<void> updateEmail(String email) async {
await _service.updateEmail(email);
}
```
```
Future<void> syncEmailAfterVerification() async {
await _service.syncEmailAfterVerification();
}
```
```
Future<void> updateGender(String gender) async {
await _service.updateGender(gender);
}
```
```
Future<void> updateDateOfBirth(DateTime date) async {
await _service.updateDateOfBirth(date);
}
```
```
Future<void> updatePhone(String phone) async {
await _service.updatePhone(phone);
}
```
```
Stream getUserData() {
return _service.getUserData();}}
```
## Trong file libs/data/services/update_account_service.dart, cập nhật mã

## nguồn có nội dung sau:

```
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
```
```
class UpdateAccountService {
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
```
```
Future<void> updateName({
required String userId,
required String firstName,
required String lastName,
}) async {
```



```
await _firestore.collection('users').doc(userId).update({
'firstName': firstName,
'lastName': lastName,
});
}
```
```
Future<void> updateUsername(String username) async {
final uid = _auth.currentUser!.uid;
```
```
await _firestore.collection('users').doc(uid).update({
'username': username,
});
}
```
```
Future<void> updatePhone(String phone) async {
final uid = _auth.currentUser!.uid;
```
```
await _firestore.collection('users').doc(uid).update({'phone': phone});
}
```
```
Future<void> updateGender(String gender) async {
final uid = _auth.currentUser!.uid;
```
```
await _firestore.collection('users').doc(uid).update({'gender': gender});
}
```
```
Future<void> updateDateOfBirth(DateTime date) async {
final uid = _auth.currentUser!.uid;
```
```
await _firestore.collection('users').doc(uid).update({
'dateOfBirth': Timestamp.fromDate(date),
});
}
```
```
Future<void> updateEmail(String newEmail) async {
final user = _auth.currentUser!;
final uid = user.uid;
```
```
if (user.email == newEmail) {
throw Exception("Email mới trùng với email hiện tại");
}
```
### /// CHECK TRÙNG FIRESTORE

```
final existingEmail = await _firestore
.collection('users')
.where('email', isEqualTo: newEmail)
.get();
```
```
if (existingEmail.docs.isNotEmpty) {
throw Exception("Email đã tồn tại trong hệ thống");
```



### }

```
try {
/// Gửi email xác minh trước khi đổi
await user.verifyBeforeUpdateEmail(newEmail);
} on FirebaseAuthException catch (e) {
if (e.code == 'requires-recent-login') {
throw Exception("Vui lòng đăng nhập lại để đổi email");
} else if (e.code == 'email-already-in-use') {
throw Exception("Email đã được sử dụng");
} else if (e.code == 'invalid-email') {
throw Exception("Email không hợp lệ");
} else {
throw Exception(e.message);
}
}
}
```
```
Future<void> syncEmailAfterVerification() async {
final user = _auth.currentUser!;
final uid = user.uid;
```
```
await _firestore.collection('users').doc(uid).update({'email':
user.email});
}
```
```
Stream<DocumentSnapshot> getUserData() {
final uid = _auth.currentUser!.uid;
return _firestore.collection('users').doc(uid).snapshots();
}
}
```
## Trong file libs/screens/profile/profile_screen.dart, cập nhật mã nguồn có

## nội dung sau:

```
import
'package:draf_project/screens/shipping_address/my_shipping_address_screen.dar
t';
import 'package:flutter/material.dart';
import '../../common/styles/app_colors.dart';
import '../../common/styles/app_text_styles.dart';
import '../../common/widgets/profile_menu_item.dart';
import '../../routes/app_routes.dart';
```
```
import '../bank_account/my_bank_account_screen.dart';
```
```
import 'package:get/get.dart';
import 'package:draf_project/controller/login_controller.dart';
```



```
class ProfileScreen extends StatelessWidget {
const ProfileScreen({super.key});
```
```
@override
Widget build(BuildContext context) {
return GetBuilder<AuthController>(
builder: (authController) {
bool loggedIn = authController.currentUser != null;
```
```
if (!loggedIn) {
return _buildGuestProfile(context);
}
```
```
return _buildUserProfile(context, authController);
},
);
}
```
```
/// ===== Header xanh =====
Widget _buildHeader(BuildContext context, AuthController authController) {
final user = authController.currentUser;
```
```
String fullName = '';
String email = '';
```
```
if (user != null) {
fullName = '${user.firstName} ${user.lastName}';
email = user.email;
}
```
```
return Container(
width: double.infinity,
padding: const EdgeInsets.fromLTRB( 20 , 60 , 20 , 30 ),
color: AppColors.primaryBlue,
child: Row(
children: [
const CircleAvatar(
radius: 32 ,
backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
),
const SizedBox(width: 16 ),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
fullName,
style: const TextStyle(
fontSize: 20 ,
```



```
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
const SizedBox(height: 4 ),
Text(
email,
style: const TextStyle(fontSize: 14 , color:
Colors.white70),
),
],
),
),
IconButton(
onPressed: () {
Navigator.pushNamed(context, AppRoutes.updateAccount);
},
icon: const Icon(Icons.edit, color: Colors.white),
),
],
),
);
}
```
```
Widget _buildUserProfile(
BuildContext context,
AuthController authController,
) {
final AuthController authController = Get.find<AuthController>();
```
```
return Scaffold(
backgroundColor: AppColors.background,
body: Column(
children: [
_buildHeader(context, authController),
Expanded(
child: SingleChildScrollView(
child: Container(
padding: const EdgeInsets.all( 20 ),
decoration: const BoxDecoration(
color: AppColors.white,
borderRadius: BorderRadius.only(
topLeft: Radius.circular( 24 ),
topRight: Radius.circular( 24 ),
),
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
_buildAccountSetting(context),
```



```
const SizedBox(height: 24 ),
_buildAppSettingLabel(),
_buildLogoutButton(context),
],
),
),
),
),
],
),
);
}
```
```
/// ===== Account Setting =====
Widget _buildAccountSetting(BuildContext context) {
return Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('Cài đặt tài khoản', style: AppTextStyle.title),
const SizedBox(height: 16 ),
```
```
ProfileMenuItem(
icon: Icons.location_on,
title: 'Địa chỉ của tôi',
subtitle: 'Quản lý địa chỉ giao hàng',
onTap: () {
Navigator.push(
context,
MaterialPageRoute(builder: (_) => MyShippingAddressScreen()),
);
},
),
```
```
ProfileMenuItem(
icon: Icons.shopping_cart,
title: 'Giỏ hàng của tôi',
subtitle: 'Xem các mặt hàng trong giỏ hàng',
onTap: () {
Navigator.pushNamed(context, AppRoutes.cartOverview);
},
),
```
```
ProfileMenuItem(
icon: Icons.account_balance,
title: 'Tài khoản ngân hàng',
subtitle: 'Quản lý phương thức thanh toán',
onTap: () {
Navigator.push(
context,
MaterialPageRoute(builder: (_) => MyBankAccountScreen()),
```



### );

### },

### ),

```
ProfileMenuItem(
icon: Icons.discount,
title: 'Mã giảm giá',
subtitle: 'Xem các mã giảm giá có sẵn',
onTap: () {},
),
```
```
ProfileMenuItem(
icon: Icons.lock,
title: 'Bảo mật tài khoản',
subtitle: 'Cài đặt bảo mật và quyền riêng tư',
onTap: () {},
),
],
);
}
```
```
/// ===== App Setting label =====
Widget _buildAppSettingLabel() {
return Text('Cài đặt ứng dụng', style: AppTextStyle.title);
}
```
```
Widget _buildLogoutButton(BuildContext context) {
final AuthController authController = Get.find<AuthController>();
```
```
return Padding(
padding: const EdgeInsets.only(top: 16 ),
child: GestureDetector(
onTap: () async {
bool? confirm = await showDialog<bool>(
context: context,
builder: (BuildContext dialogContext) {
return AlertDialog(
title: const Text('Đang xuất'),
content: const Text('Bann có chắc muốn đăng xuất không?'),
actions: [
TextButton(
onPressed: () {
Navigator.of(dialogContext).pop(false);
},
child: const Text('Hủy'),
),
TextButton(
onPressed: () {
Navigator.of(dialogContext).pop(true);
},
```



```
child: const Text(
'Đăng xuất',
style: TextStyle(color: Colors.red),
),
),
],
);
},
);
```
```
if (confirm == true) {
await authController.logout();
```
```
Navigator.pushNamedAndRemoveUntil(
context,
AppRoutes.home,
(route) => false,
);
}
},
child: Container(
width: double.infinity,
padding: const EdgeInsets.symmetric(vertical: 16 ),
decoration: BoxDecoration(
border: Border.all(color: Colors.red),
borderRadius: BorderRadius.circular( 12 ),
),
child: const Center(
child: Text(
'Đăng xuất',
style: TextStyle(
color: Colors.red,
fontSize: 16 ,
fontWeight: FontWeight.bold,
),
),
),
),
),
);
}
}
```
```
Widget _buildGuestProfile(BuildContext context) {
return Scaffold(
backgroundColor: AppColors.background,
body: Column(
children: [
Container(
width: double.infinity,
```



```
padding: const EdgeInsets.fromLTRB( 20 , 60 , 20 , 30 ),
color: AppColors.primaryBlue,
child: Column(
children: [
const CircleAvatar(
radius: 40 ,
child: Icon(Icons.person, size: 40 ),
),
const SizedBox(height: 16 ),
const Text(
'Guest User',
style: TextStyle(
fontSize: 20 ,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
const SizedBox(height: 16 ),
ElevatedButton(
onPressed: () {
Navigator.pushNamed(context, AppRoutes.login);
},
child: const Text('Đăng nhập ngay'),
),
],
),
),
],
),
);
}
```
## Trong file libs/screens/profile/update_account_screen.dart, cập nhật

## mã nguồn có nội dung sau:

```
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../common/styles/app_colors.dart';
```
```
import '../../routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:draf_project/controller/update_account_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
```
```
class UpdateAccountScreen extends StatelessWidget {
const UpdateAccountScreen({super.key});
```



```
@override
Widget build(BuildContext context) {
// Khởi tạo controller thông qua Get.put để quản lý vòng đời tốt hơn
final UpdateAccountController _controller = Get.put(
UpdateAccountController(),
);
```
```
return Scaffold(
backgroundColor: Colors.grey[ 50 ], // Nền xám nhạt để nổi bật các Card
appBar: AppBar(
title: const Text(
'Hồ sơ của tôi',
style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
),
backgroundColor: AppColors.primaryBlue,
centerTitle: true,
elevation: 0 ,
),
body: StreamBuilder(
stream: _controller.getUserData(),
builder: (context, snapshot) {
if (snapshot.connectionState == ConnectionState.waiting) {
return const Center(child: CircularProgressIndicator());
}
if (!snapshot.hasData) {
return const Center(
child: Text("Không thể tải dữ liệu người dùng"),
);
}
```
```
final authUserEmail = FirebaseAuth.instance.currentUser?.email;
final data = snapshot.data!.data() as Map<String, dynamic>;
final firestoreEmail = data['email'];
```
```
if (authUserEmail != firestoreEmail) {
_controller.syncEmailAfterVerification();
}
```
```
// Xử lý dữ liệu hiển thị
final fullName =
'${data['firstName'] ?? ''} ${data['lastName'] ?? ''}';
final username = data['username'] ?? 'Not set';
final email = data['email'] ?? '';
final phone = data['phone'] ?? 'Not set';
final id = data['id'] ?? '';
final gender = data['gender'] ?? 'Not set';
```
```
final dynamic dobData = data['dateOfBirth'];
String dateOfBirth = 'Chưa cập nhật';
if (dobData != null) {
```



```
if (dobData is Timestamp) {
dateOfBirth =
DateFormat('dd/MM/yyyy').format(dobData.toDate());
} else if (dobData is String) {
dateOfBirth = dobData;
}
}
```
```
return SingleChildScrollView(
physics: const BouncingScrollPhysics(),
child: Column(
children: [
// Header Avatar
_buildAvatarHeader(context),
```
```
const SizedBox(height: 10 ),
```
```
// Group 1: Profile Info
_buildSectionCard(
title: 'Thông tin hồ sơ',
items: [
_buildTile(
context,
Icons.person_outline,
'Name',
fullName,
() => Navigator.pushNamed(context,
AppRoutes.changeName),
),
_buildTile(
context,
Icons.alternate_email,
'Username',
username,
() => Navigator.pushNamed(
context,
AppRoutes.changeUsername,
),
),
_buildTile(
context,
Icons.lock_outline,
'Mật khẩu',
'********',
() => Navigator.pushNamed(
context,
AppRoutes.changePassword,
),
),
],
```



### ),

```
// Group 2: Personal Info
_buildSectionCard(
title: 'Thông tin cá nhân',
items: [
_buildTile(context, Icons.fingerprint, 'User ID', id, ()
{
Clipboard.setData(ClipboardData(text: id));
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text("ID đã được sao chép vào clipboard"),
),
);
}, trailing: Icons.copy),
_buildTile(
context,
Icons.mail_outline,
'Email',
email,
() => Navigator.pushNamed(context,
AppRoutes.changeEmail),
),
_buildTile(
context,
Icons.phone_android,
'Số điện thoại',
phone,
() => Navigator.pushNamed(
context,
AppRoutes.changePhoneNumber,
),
),
_buildTile(
context,
Icons.cake_outlined,
'Ngày sinh',
dateOfBirth,
() => Navigator.pushNamed(
context,
AppRoutes.changeDateofBirth,
),
),
_buildTile(
context,
Icons.wc_outlined,
'Giới tính',
gender,
() =>
```



```
Navigator.pushNamed(context,
AppRoutes.changeGender),
),
],
),
```
```
// Danger Zone
Padding(
padding: const EdgeInsets.symmetric(vertical: 20 ),
child: TextButton.icon(
onPressed: () {},
icon: const Icon(
Icons.delete_forever,
color: Colors.redAccent,
),
label: const Text(
'Đóng tài khoản',
style: TextStyle(
color: Colors.redAccent,
fontWeight: FontWeight.bold,
),
),
),
),
],
),
);
},
),
);
}
```
```
// Widget Avatar với Header background
Widget _buildAvatarHeader(BuildContext context) {
return Container(
width: double.infinity,
padding: const EdgeInsets.only(bottom: 30 ),
decoration: BoxDecoration(
color: AppColors.primaryBlue,
borderRadius: const BorderRadius.only(
bottomLeft: Radius.circular( 30 ),
bottomRight: Radius.circular( 30 ),
),
),
child: Column(
children: [
Stack(
alignment: Alignment.bottomRight,
children: [
Container(
```



```
decoration: BoxDecoration(
shape: BoxShape.circle,
border: Border.all(color: Colors.white, width: 4 ),
),
child: const CircleAvatar(
radius: 50 ,
backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
),
),
CircleAvatar(
radius: 18 ,
backgroundColor: Colors.white,
child: IconButton(
icon: const Icon(
Icons.camera_alt,
size: 16 ,
color: Colors.blue,
),
onPressed: () {},
),
),
],
),
const SizedBox(height: 15 ),
const Text(
"Thay đổi ảnh đại diện",
style: TextStyle(color: Colors.white70, fontSize: 14 ),
),
],
),
);
}
```
```
// Widget Card bao bọc một section
Widget _buildSectionCard({
required String title,
required List<Widget> items,
}) {
return Container(
margin: const EdgeInsets.fromLTRB( 16 , 16 , 16 , 0 ),
padding: const EdgeInsets.all( 16 ),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 16 ),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.03),
blurRadius: 10 ,
offset: const Offset( 0 , 5 ),
),
```



### ],

### ),

```
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
title,
style: const TextStyle(
fontSize: 16 ,
fontWeight: FontWeight.bold,
color: Colors.blueGrey,
),
),
const SizedBox(height: 10 ),
...items,
],
),
);
}
```
```
// Widget từng dòng thông tin
Widget _buildTile(
BuildContext context,
IconData icon,
String label,
String value,
VoidCallback onTap, {
IconData trailing = Icons.arrow_forward_ios,
}) {
return InkWell(
onTap: onTap,
child: Padding(
padding: const EdgeInsets.symmetric(vertical: 12 ),
child: Row(
children: [
Icon(icon, size: 22 , color: Colors.grey[ 600 ]),
const SizedBox(width: 16 ),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
label,
style: TextStyle(color: Colors.grey[ 500 ], fontSize: 13 ),
),
const SizedBox(height: 2 ),
Text(
value,
style: const TextStyle(
fontSize: 15 ,
```



```
fontWeight: FontWeight.w500,
),
),
],
),
),
Icon(trailing, size: 14 , color: Colors.grey[ 400 ]),
],
),
),
);
}
}
```
## Trong terminal, sinh viên chạy lệnh sau: flutter pub add intl

## Trong file libs/screens/profile/change_dateofbirth_screen.dart, cập

## nhật mã nguồn có nội dung sau:

```
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:draf_project/controller/update_account_controller.dart';
```
```
class ChangeDateOfBirthScreen extends StatefulWidget {
const ChangeDateOfBirthScreen({super.key});
```
```
@override
State<ChangeDateOfBirthScreen> createState() =>
_ChangeDateOfBirthScreenState();
}
```
```
class _ChangeDateOfBirthScreenState extends State<ChangeDateOfBirthScreen> {
final TextEditingController _dateController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final UpdateAccountController _controller = UpdateAccountController();
bool _isLoading = false;
```
```
DateTime? _selectedDate;
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Change Date of Birth')),
body: Padding(
padding: const EdgeInsets.all( 20 ),
child: Form(
key: _formKey,
child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
```



```
TextFormField(
controller: _dateController,
readOnly: true,
decoration: const InputDecoration(
labelText: 'Date of Birth',
hintText: 'dd/MM/yyyy',
prefixIcon: Icon(Icons.calendar_today),
border: OutlineInputBorder(),
),
onTap: _pickDate,
validator: (value) {
if (value == null || value.isEmpty) {
return 'Vui lòng chọn ngày sinh';
}
return null;
},
),
```
```
const SizedBox(height: 30 ),
```
```
SizedBox(
height: 48 ,
child: ElevatedButton(
onPressed: _isLoading
? null
: () async {
if (_formKey.currentState!.validate()) {
if (_selectedDate == null) return;
```
```
setState(() {
_isLoading = true;
});
```
```
await
_controller.updateDateOfBirth(_selectedDate!);
```
```
setState(() {
_isLoading = false;
});
```
```
Navigator.pop(context);
}
},
child: _isLoading
? const CircularProgressIndicator(color: Colors.white)
: const Text('Save'),
),
),
],
),
```



### ),

### ),

### );

### }

```
/// ===== Date Picker =====
Future<void> _pickDate() async {
final DateTime now = DateTime.now();
```
```
final DateTime? pickedDate = await showDatePicker(
context: context,
initialDate: _selectedDate ?? DateTime(now.year - 18 ),
firstDate: DateTime( 1900 ),
lastDate: now,
);
```
```
if (pickedDate != null) {
setState(() {
_selectedDate = pickedDate;
_dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
});
}
}
```
```
@override
void dispose() {
_dateController.dispose();
super.dispose();
}
}
```
## Trong file libs/screens/profile/change_email_screen.dart, cập nhật mã

## nguồn có nội dung sau:

```
import 'package:flutter/material.dart';
import 'package:draf_project/controller/update_account_controller.dart';
```
```
class ChangeEmailScreen extends StatefulWidget {
const ChangeEmailScreen({super.key});
```
```
@override
State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}
```
```
class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
final TextEditingController _emailController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final UpdateAccountController _controller = UpdateAccountController();
bool _isLoading = false;
```



```
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Change Email')),
body: Padding(
padding: const EdgeInsets.all( 20 ),
child: Form(
key: _formKey,
child: Column(
children: [
TextFormField(
controller: _emailController,
keyboardType: TextInputType.emailAddress,
decoration: const InputDecoration(
labelText: 'Email',
hintText: 'example@email.com',
prefixIcon: Icon(Icons.email),
border: OutlineInputBorder(),
),
validator: (value) {
if (value == null || value.isEmpty) {
return 'Email không được để trống';
}
```
```
final RegExp emailRegex = RegExp(
r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
);
```
```
if (!emailRegex.hasMatch(value)) {
return 'Email không hợp lệ';
}
```
```
return null;
},
),
```
```
const SizedBox(height: 30 ),
```
```
SizedBox(
width: double.infinity,
height: 48 ,
child: ElevatedButton(
onPressed: _isLoading
? null
: () async {
if (_formKey.currentState!.validate()) {
setState(() => _isLoading = true);
```
```
try {
await _controller.updateEmail(
```



```
_emailController.text.trim(),
);
```
```
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text(
"Đã gửi email xác minh. Vui lòng kiểm tra
hộp thư.",
),
),
);
```
```
Navigator.pop(context);
} catch (e) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text(e.toString())),
);
}
```
```
setState(() => _isLoading = false);
}
},
child: _isLoading
? const CircularProgressIndicator(color: Colors.white)
: const Text('Save'),
),
),
],
),
),
),
);
}
}
```
## Trong file libs/screens/profile/change_gender_screen.dart, cập nhật mã

## nguồn có nội dung sau:

```
import 'package:flutter/material.dart';
import 'package:draf_project/controller/update_account_controller.dart';
```
```
enum Gender { male, female, other }
```
```
class ChangeGenderScreen extends StatefulWidget {
const ChangeGenderScreen({super.key});
```
```
@override
State<ChangeGenderScreen> createState() => _ChangeGenderScreenState();
}
```



```
class _ChangeGenderScreenState extends State<ChangeGenderScreen> {
Gender _selectedGender = Gender.male;
final UpdateAccountController _controller = UpdateAccountController();
bool _isLoading = false;
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Change Gender')),
body: Padding(
padding: const EdgeInsets.all( 20 ),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text(
'Select your gender',
style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),
),
```
```
const SizedBox(height: 20 ),
```
```
_buildRadioTile(title: 'Male', value: Gender.male),
```
```
_buildRadioTile(title: 'Female', value: Gender.female),
```
```
_buildRadioTile(title: 'Other', value: Gender.other),
```
```
const Spacer(),
```
```
SizedBox(
width: double.infinity,
height: 48 ,
child: ElevatedButton(
onPressed: _isLoading
? null
: () async {
setState(() {
_isLoading = true;
});
```
```
await _controller.updateGender(
_selectedGender.name, // male / female / other
);
```
```
setState(() {
_isLoading = false;
});
```
```
Navigator.pop(context);
```



### },

```
child: _isLoading
? const CircularProgressIndicator(color: Colors.white)
: const Text('Save'),
),
),
],
),
),
);
}
```
```
Widget _buildRadioTile({required String title, required Gender value}) {
return RadioListTile<Gender>(
title: Text(title),
value: value,
groupValue: _selectedGender,
onChanged: (Gender? newValue) {
if (newValue != null) {
setState(() {
_selectedGender = newValue;
});
}
},
);
}
}
```
## Trong file libs/screens/profile/change_name_screen.dart, cập nhật mã

## nguồn có nội dung sau:

```
import 'package:flutter/material.dart';
import 'package:draf_project/controller/login_controller.dart';
import 'package:draf_project/controller/update_account_controller.dart';
import 'package:get/get.dart';
```
```
class ChangeNameScreen extends StatefulWidget {
const ChangeNameScreen({super.key});
```
```
@override
State<ChangeNameScreen> createState() => _ChangeNameScreenState();
}
```
```
class _ChangeNameScreenState extends State<ChangeNameScreen> {
final TextEditingController _controller = TextEditingController();
final UpdateAccountController controller =
Get.put(UpdateAccountController());
@override
void initState() {
```



```
super.initState();
```
```
final authController = Get.find<AuthController>();
final user = authController.currentUser;
```
```
if (user != null) {
_controller.text = '${user.firstName} ${user.lastName}';
}
}
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Thay đổi tên')),
body: Padding(
padding: const EdgeInsets.all( 20 ),
child: Column(
children: [
TextField(
controller: _controller,
decoration: const InputDecoration(
labelText: 'Name',
prefixIcon: Icon(Icons.person),
),
),
const SizedBox(height: 30 ),
ElevatedButton(
onPressed: () async {
final newName = _controller.text.trim();
```
```
if (newName.isEmpty) return;
```
```
try {
await UpdateAccountController().changeName(newName);
```
```
if (!mounted) return;
```
```
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text("Tên đã được cập nhật thành công"),
),
);
```
```
Navigator.pop(context, true);
} catch (e) {
ScaffoldMessenger.of(
context,
).showSnackBar(SnackBar(content: Text("Lỗi: $e")));
}
},
```



```
child: const Text('Lưu'),
),
],
),
),
);
}
}
```
## Trong file libs/screens/profile/change_phonenumber_screen.dart, cập

## nhật mã nguồn có nội dung sau:

```
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:draf_project/controller/update_account_controller.dart';
```
```
class ChangePhoneNumberScreen extends StatefulWidget {
const ChangePhoneNumberScreen({super.key});
```
```
@override
State<ChangePhoneNumberScreen> createState() =>
_ChangePhoneNumberScreenState();
}
```
```
class _ChangePhoneNumberScreenState extends State<ChangePhoneNumberScreen> {
final TextEditingController _phoneController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final UpdateAccountController _controller = UpdateAccountController();
bool _isLoading = false;
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Change Phone Number')),
body: Padding(
padding: const EdgeInsets.all( 20 ),
child: Form(
key: _formKey,
child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
TextFormField(
controller: _phoneController,
keyboardType: TextInputType.phone,
inputFormatters: [FilteringTextInputFormatter.digitsOnly],
decoration: const InputDecoration(
labelText: 'Phone Number',
hintText: '0123456789',
prefixIcon: Icon(Icons.phone),
border: OutlineInputBorder(),
```



### ),

```
validator: (value) {
if (value == null || value.isEmpty) {
return 'Số điện thoại không được để trống';
}
```
```
// VN phone: 10 digits, bắt đầu bằng 0
if (!RegExp(r'^0\d{9}$').hasMatch(value)) {
return 'Số điện thoại không hợp lệ';
}
```
```
return null;
},
),
```
```
const SizedBox(height: 30 ),
```
```
SizedBox(
height: 48 ,
child: ElevatedButton(
onPressed: _isLoading
? null
: () async {
if (_formKey.currentState!.validate()) {
setState(() {
_isLoading = true;
});
```
```
try {
await _controller.updatePhone(
_phoneController.text.trim(),
);
```
```
Navigator.pop(context);
} catch (e) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text(e.toString())),
);
}
```
```
setState(() {
_isLoading = false;
});
}
},
child: _isLoading
? const CircularProgressIndicator(color: Colors.white)
: const Text('Save'),
),
),
```



### ],

### ),

### ),

### ),

### );

### }

```
@override
void dispose() {
_phoneController.dispose();
super.dispose();
}
}
```
## Trong file libs/screens/profile/change_username_screen.dart, cập nhật

## mã nguồn có nội dung sau:

```
import 'package:flutter/material.dart';
import 'package:draf_project/controller/update_account_controller.dart';
```
```
class ChangeUsernameScreen extends StatefulWidget {
const ChangeUsernameScreen({super.key});
```
```
@override
State<ChangeUsernameScreen> createState() => _ChangeUsernameScreenState();
}
```
```
class _ChangeUsernameScreenState extends State<ChangeUsernameScreen> {
final TextEditingController _usernameController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final UpdateAccountController _controller = UpdateAccountController();
bool _isLoading = false;
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Change Username')),
body: Padding(
padding: const EdgeInsets.all( 20 ),
child: Form(
key: _formKey,
child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
TextFormField(
controller: _usernameController,
keyboardType: TextInputType.text,
decoration: const InputDecoration(
labelText: 'Username',
```



```
hintText: 'Enter your username',
prefixIcon: Icon(Icons.person),
border: OutlineInputBorder(),
),
validator: (value) {
if (value == null || value.isEmpty) {
return 'Username không được để trống';
}
```
```
if (value.length < 4 ) {
return 'Username phải có ít nhất 4 ký tự';
}
```
```
final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9._]+$');
```
```
if (!usernameRegex.hasMatch(value)) {
return 'Username chỉ gồm chữ, số, dấu. và _';
}
```
```
return null;
},
),
const SizedBox(height: 30 ),
SizedBox(
height: 48 ,
child: ElevatedButton(
onPressed: _isLoading
? null
: () async {
if (_formKey.currentState!.validate()) {
setState(() {
_isLoading = true;
});
```
```
await _controller.updateUsername(
_usernameController.text.trim(),
);
```
```
setState(() {
_isLoading = false;
});
```
```
Navigator.pop(context);
}
},
child: _isLoading
? const CircularProgressIndicator(color: Colors.white)
: const Text('Save'),
),
),
```



### ],

### ),

### ),

### ),

### );

### }

```
@override
void dispose() {
_usernameController.dispose();
super.dispose();
}
}
```
## Trong file libs/controller/bank_account_controller.dart, cập nhật mã

## nguồn có nội dung sau:

```
import '/data/models/bank_account_model.dart';
import '/data/services/bank_account_service.dart';
```
```
class BankAccountController {
final BankAccountService _service = BankAccountService();
```
```
Stream<List<BankAccountModel>> getBanks() {
return _service.getBanks();
}
```
```
Future<void> addBank(BankAccountModel bank) async {
await _service.addBank(bank);
}
```
```
Future<void> updateBank(BankAccountModel bank) async {
await _service.updateBank(bank);
}
```
```
Future<void> deleteBank(String id) async {
await _service.deleteBank(id);
}
}
```
## Trong file libs/data/models/bank_account_model.dart, cập nhật mã nguồn có

## nội dung sau:

```
class BankAccountModel {
final String id;
final String accountNumber;
final String accountHolderName;
```
```
final String bankName;
```



```
final String shortName;
final String bankCode;
final String bin;
final String logo;
```
```
BankAccountModel({
required this.id,
required this.accountNumber,
required this.accountHolderName,
required this.bankName,
required this.shortName,
required this.bankCode,
required this.bin,
required this.logo,
});
```
```
factory BankAccountModel.fromMap(String id, Map<String, dynamic> map) {
return BankAccountModel(
id: id,
accountNumber: map['accountNumber'] ?? '',
accountHolderName: map['accountHolderName'] ?? '',
bankName: map['bankName'] ?? '',
shortName: map['shortName'] ?? '',
bankCode: map['bankCode'] ?? '',
bin: map['bin'] ?? '',
logo: map['logo'] ?? '',
);
}
```
```
Map<String, dynamic> toMap() {
return {
'accountNumber': accountNumber,
'accountHolderName': accountHolderName,
'bankName': bankName,
'shortName': shortName,
'bankCode': bankCode,
'bin': bin,
'logo': logo,
'createdAt': DateTime.now(),
};
}
}
```
## Trong file libs/data/services/bank_account_service.dart, cập nhật mã

## nguồn có nội dung sau:

```
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/bank_account_model.dart';
```



```
class BankAccountService {
final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
```
```
String get uid => _auth.currentUser!.uid;
```
```
CollectionReference get _bankRef =>
_firestore.collection('users').doc(uid).collection('bank_accounts');
```
```
Future<void> addBank(BankAccountModel bank) async {
await _bankRef.add(bank.toMap());
}
```
```
Future<void> updateBank(BankAccountModel bank) async {
await _bankRef.doc(bank.id).update(bank.toMap());
}
```
```
Future<void> deleteBank(String id) async {
await _bankRef.doc(id).delete();
}
```
```
Stream<List<BankAccountModel>> getBanks() {
return _bankRef.snapshots().map(
(snapshot) => snapshot.docs.map((doc) {
return BankAccountModel.fromMap(
doc.id,
doc.data() as Map<String, dynamic>,
);
}).toList(),
);
}
}
```
## Trong file libs/data/services/list_bank_api_service.dart, cập nhật mã

## nguồn có nội dung sau:




## Trong file libs/screens/bank_account/my_bank_account_screen.dart,

## cập nhật mã nguồn có nội dung sau:

```
import 'package:flutter/material.dart';
import '/controller/bank_account_controller.dart';
import '/data/models/bank_account_model.dart';
import 'add_edit_bank_account_screen.dart';
```
```
class MyBankAccountScreen extends StatelessWidget {
final BankAccountController _controller = BankAccountController();
```
```
MyBankAccountScreen({super.key});
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xFFF8F9FE), // Nền xám nhạt cực sang
appBar: AppBar(
title: const Text(
'My Bank Accounts',
style: TextStyle(fontWeight: FontWeight.bold, color:
Colors.black87),
),
centerTitle: true,
backgroundColor: Colors.transparent,
elevation: 0 ,
actions: [
IconButton(
icon: const Icon(Icons.refresh, color: Colors.blue),
onPressed: () => (context as Element).markNeedsBuild(),
),
],
),
floatingActionButton: FloatingActionButton.extended(
onPressed: () {
```
```
import 'dart:convert';
import 'package:http/http.dart' as http;
```
```
class BankApiService {
Future<List<dynamic>> fetchBanks() async {
final response = await http.get(
Uri.parse('https://api.vietqr.io/v2/banks'),
);
```
```
final data = jsonDecode(response.body);
```
```
return data['data'];
}
}
```



```
Navigator.push(
context,
MaterialPageRoute(builder: (_) => const EditBankAccountScreen()),
);
},
label: const Text(
'Add Bank',
style: TextStyle(fontWeight: FontWeight.bold),
),
icon: const Icon(Icons.add),
backgroundColor: Colors.blueAccent,
),
body: StreamBuilder<List<BankAccountModel>>(
stream: _controller.getBanks(),
builder: (context, snapshot) {
if (snapshot.connectionState == ConnectionState.waiting) {
return const Center(child: CircularProgressIndicator());
}
```
```
final banks = snapshot.data ?? [];
```
```
if (banks.isEmpty) {
return _buildEmptyState(context);
}
```
```
return ListView.builder(
padding: const EdgeInsets.symmetric(horizontal: 16 , vertical:
10 ),
itemCount: banks.length,
itemBuilder: (context, index) {
final bank = banks[index];
return _buildBankCard(context, bank);
},
);
},
),
);
}
```
```
// 1. Widget cho từng thẻ ngân hàng
Widget _buildBankCard(BuildContext context, BankAccountModel bank) {
// Xử lý che số tài khoản an toàn
String maskedNumber = bank.accountNumber.length > 4
? '**** **** ${bank.accountNumber.substring(bank.accountNumber.length
```
- 4 )}'
: bank.accountNumber;

```
return Container(
margin: const EdgeInsets.only(bottom: 16 ),
decoration: BoxDecoration(
```



```
color: Colors.white,
borderRadius: BorderRadius.circular( 20 ),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.04),
blurRadius: 10 ,
offset: const Offset( 0 , 4 ),
),
],
),
child: ClipRRect(
borderRadius: BorderRadius.circular( 20 ),
child: IntrinsicHeight(
child: Row(
children: [
// Thanh màu bên trái để tạo điểm nhấn
Container(width: 6 , color: Colors.blueAccent),
const SizedBox(width: 12 ),
```
```
// Logo ngân hàng
Container(
padding: const EdgeInsets.all( 8 ),
child: Image.network(
bank.logo,
width: 50 ,
height: 50 ,
errorBuilder: (_, __, ___) =>
const Icon(Icons.account_balance, size: 40 ),
),
),
const SizedBox(width: 8 ),
```
```
// Thông tin tài khoản
Expanded(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
bank.shortName,
style: const TextStyle(
fontWeight: FontWeight.bold,
fontSize: 16 ,
),
),
const SizedBox(height: 4 ),
Text(
maskedNumber,
style: TextStyle(
color: Colors.grey.shade600,
```



```
letterSpacing: 1.2,
),
),
],
),
),
```
```
// Nút hành động
_buildActionButtons(context, bank),
],
),
),
),
);
}
```
```
// 2. Cụm nút bấm Edit/Delete
Widget _buildActionButtons(BuildContext context, BankAccountModel bank) {
return Row(
mainAxisSize: MainAxisSize.min,
children: [
IconButton(
icon: const Icon(Icons.edit_note_rounded, color: Colors.blue),
onPressed: () => Navigator.push(
context,
MaterialPageRoute(
builder: (_) => EditBankAccountScreen(bank: bank),
),
),
),
IconButton(
icon: const Icon(
Icons.delete_outline_rounded,
color: Colors.redAccent,
),
onPressed: () => _confirmDelete(context, bank),
),
const SizedBox(width: 8 ),
],
);
}
```
```
// 3. Widget khi chưa có ngân hàng nào
Widget _buildEmptyState(BuildContext context) {
return Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
Icons.account_balance_wallet_outlined,
```



```
size: 80 ,
color: Colors.grey.shade300,
),
const SizedBox(height: 16 ),
const Text(
'No bank account linked yet',
style: TextStyle(
fontSize: 18 ,
fontWeight: FontWeight.w500,
color: Colors.grey,
),
),
const SizedBox(height: 8 ),
TextButton(
onPressed: () => Navigator.push(
context,
MaterialPageRoute(builder: (_) => const
EditBankAccountScreen()),
),
child: const Text('Add your first account'),
),
],
),
);
}
```
```
// 4. Dialog xác nhận xóa kiểu hiện đại
Future<void> _confirmDelete(
BuildContext context,
BankAccountModel bank,
) async {
final bool? confirm = await showDialog<bool>(
context: context,
builder: (_) => AlertDialog(
shape: RoundedRectangleBorder(borderRadius:
BorderRadius.circular( 20 )),
title: const Text('Delete account?'),
content: Text(
'Do you really want to remove ${bank.shortName} from your list?',
),
actions: [
TextButton(
onPressed: () => Navigator.pop(context, false),
child: const Text('Cancel', style: TextStyle(color:
Colors.grey)),
),
ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor: Colors.redAccent,
shape: RoundedRectangleBorder(
```



```
borderRadius: BorderRadius.circular( 10 ),
),
),
onPressed: () => Navigator.pop(context, true),
child: const Text('Delete', style: TextStyle(color:
Colors.white)),
),
],
),
);
```
```
if (confirm == true) {
await _controller.deleteBank(bank.id);
if (context.mounted) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text('Removed ${bank.shortName}'),
behavior: SnackBarBehavior.floating,
),
);
}
}
}
}
```
## Trong file

## libs/screens/bank_account/add_edit_bank_account_screen.dart,

## cập nhật mã nguồn có nội dung sau:

```
import 'package:flutter/material.dart';
import '/data/models/bank_account_model.dart';
import '/controller/bank_account_controller.dart';
import '/data/services/list_bank_api_service.dart';
```
```
class EditBankAccountScreen extends StatefulWidget {
final BankAccountModel? bank;
```
```
const EditBankAccountScreen({super.key, this.bank});
```
```
@override
State<EditBankAccountScreen> createState() =>
_EditBankAccountScreenState();
}
```
```
class _EditBankAccountScreenState extends State<EditBankAccountScreen> {
final _controller = BankAccountController();
final _bankApiService = BankApiService();
```
```
List<dynamic> _banks = [];
```



```
dynamic _selectedBank;
```
```
final _accountNumber = TextEditingController();
final _accountHolderName = TextEditingController();
```
```
// Thêm biến để theo dõi trạng thái đang xử lý
bool _isLoading = false;
```
```
@override
void initState() {
super.initState();
_loadBanks();
```
```
if (widget.bank != null) {
_accountNumber.text = widget.bank!.accountNumber;
_accountHolderName.text = widget.bank!.accountHolderName;
}
}
```
```
Future<void> _loadBanks() async {
try {
final banks = await _bankApiService.fetchBanks();
if (mounted) {
setState(() {
_banks = banks;
```
```
if (widget.bank != null) {
// Tìm ngân hàng đã chọn dựa trên shortName hoặc code
_selectedBank = _banks.firstWhere(
(b) => b['shortName'] == widget.bank!.shortName,
orElse: () => null,
);
}
});
}
} catch (e) {
debugPrint('Error loading banks: $e');
}
}
```
```
Future<void> _save() async {
// 1. Kiểm tra tính hợp lệ của dữ liệu (Validation)
if (_selectedBank == null) {
_showError('Please select a bank');
return;
}
if (_accountNumber.text.trim().isEmpty) {
_showError('Please enter account number');
return;
}
```



```
if (_accountHolderName.text.trim().isEmpty) {
_showError('Please enter account holder name');
return;
}
```
```
setState(() => _isLoading = true);
```
```
try {
final bank = BankAccountModel(
id: widget.bank?.id ?? '',
accountNumber: _accountNumber.text.trim(),
accountHolderName: _accountHolderName.text
.trim()
.toUpperCase(), // Tên thường viết hoa
bankName: _selectedBank['name'],
shortName: _selectedBank['shortName'],
bankCode: _selectedBank['code'],
bin: _selectedBank['bin'],
logo: _selectedBank['logo'],
);
```
```
if (widget.bank == null) {
await _controller.addBank(bank);
} else {
await _controller.updateBank(bank);
}
```
```
if (mounted) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text(
widget.bank == null
? 'Bank account added'
: 'Bank account updated',
),
),
);
Navigator.pop(context);
}
} catch (e) {
_showError('Something went wrong: $e');
} finally {
if (mounted) setState(() => _isLoading = false);
}
}
```
```
void _showError(String message) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text(message), backgroundColor: Colors.red),
);
```



### }

```
Widget _bankInfo() {
if (_selectedBank == null) return const SizedBox();
```
```
return Card(
elevation: 0 ,
color: Colors.blue.withOpacity(0.05),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 12 ),
side: BorderSide(color: Colors.blue.shade100),
),
margin: const EdgeInsets.only(top: 20 ),
child: Padding(
padding: const EdgeInsets.all( 16 ),
child: Row(
// Chuyển sang Row để tối ưu không gian chiều ngang
children: [
Image.network(
_selectedBank['logo'],
height: 40 ,
width: 80 ,
fit: BoxFit.contain,
),
const SizedBox(width: 16 ),
Expanded(
// Expanded ở đây cực kỳ quan trọng để chống tràn chữ
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
_selectedBank['name'],
style: const TextStyle(fontWeight: FontWeight.bold),
maxLines: 1 ,
overflow: TextOverflow.ellipsis,
),
Text(
'Code: ${_selectedBank['code']} - BIN:
${_selectedBank['bin']}',
style: TextStyle(color: Colors.grey.shade600, fontSize:
13 ),
),
],
),
),
],
),
),
);
}
```



```
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text(
widget.bank == null? 'Add Bank Account' : 'Edit Bank Account',
),
elevation: 0 ,
),
body: GestureDetector(
onTap: () =>
FocusScope.of(context).unfocus(), // Chạm ra ngoài để tắt bàn
phím
child: SingleChildScrollView(
padding: const EdgeInsets.all( 20 ),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text(
"Select Bank",
style: TextStyle(fontWeight: FontWeight.w600),
),
const SizedBox(height: 8 ),
```
```
/// Dropdown Bank - FIX OVERFLOW Ở ĐÂY
DropdownButtonFormField<dynamic>(
isExpanded:
true, // Ép dropdown không được vượt quá chiều ngang màn
hình
value: _selectedBank,
icon: const Icon(Icons.keyboard_arrow_down),
decoration: InputDecoration(
contentPadding: const EdgeInsets.symmetric(
horizontal: 12 ,
vertical: 8 ,
),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular( 12 ),
),
filled: true,
fillColor: Colors.grey.shade50,
),
hint: const Text("Choose a bank"),
items: _banks.map((bank) {
return DropdownMenuItem(
value: bank,
child: Text(
bank['name'],
overflow: TextOverflow
```



```
.ellipsis, // Nếu tên quá dài sẽ hiện dấu "..."
maxLines: 1 ,
),
);
}).toList(),
onChanged: (value) => setState(() => _selectedBank = value),
),
```
```
_bankInfo(),
```
```
const SizedBox(height: 24 ),
const Text(
"Account Details",
style: TextStyle(fontWeight: FontWeight.w600),
),
const SizedBox(height: 12 ),
```
```
TextField(
controller: _accountNumber,
keyboardType: TextInputType.number,
decoration: InputDecoration(
labelText: 'Account Number',
prefixIcon: const Icon(Icons.numbers),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular( 12 ),
),
),
),
```
```
const SizedBox(height: 16 ),
```
```
TextField(
controller: _accountHolderName,
textCapitalization:
TextCapitalization.characters, // Tự động viết hoa
decoration: InputDecoration(
labelText: 'Account Holder Name',
prefixIcon: const Icon(Icons.person_outline),
helperText: "Example: NGUYEN VAN A",
border: OutlineInputBorder(
borderRadius: BorderRadius.circular( 12 ),
),
),
),
```
```
const SizedBox(height: 32 ),
```
```
/// Nút bấm rộng đầy màn hình
SizedBox(
width: double.infinity,
```



```
height: 52 ,
child: ElevatedButton(
onPressed: _isLoading? null : _save,
style: ElevatedButton.styleFrom(
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 12 ),
),
backgroundColor: Colors.blue,
foregroundColor: Colors.white,
),
child: _isLoading
? const CircularProgressIndicator(color: Colors.white)
: const Text(
'Save Bank Account',
style: TextStyle(
fontSize: 16 ,
fontWeight: FontWeight.bold,
),
),
),
),
],
),
),
),
);
}
}
```
## Trong file libs/controller/address_controller.dart, cập nhật mã nguồn có

## nội dung sau:

```
import '/data/models/address_model.dart';
import '/data/services/address_service.dart';
```
```
class AddressController {
final AddressService _service = AddressService();
```
```
Stream<List<AddressModel>> getAddresses() {
return _service.getAddresses();
}
```
```
Future<void> addAddress(AddressModel address) async {
await _service.addAddress(address);
}
```
```
Future<void> updateAddress(AddressModel address) async {
await _service.updateAddress(address);
}
```



```
Future<void> setDefaultAddress(String id) async {
await _service.setDefaultAddress(id);
}
```
```
Future<void> deleteAddress(String id) async {
await _service.deleteAddress(id);
}
}
```
## Trong file libs/data/models/address_model.dart, cập nhật mã nguồn có nội

## dung sau:

```
class AddressModel {
final String id;
final String city;
final String ward;
final String street;
final String number;
final bool isDefault;
final double latitude;
final double longitude;
```
```
AddressModel({
required this.id,
required this.city,
required this.ward,
required this.street,
required this.number,
required this.isDefault,
required this.latitude,
required this.longitude,
});
```
```
factory AddressModel.fromMap(String id, Map<String, dynamic> map) {
return AddressModel(
id: id,
city: map['city'] ?? '',
ward: map['ward'] ?? '',
street: map['street'] ?? '',
number: map['number'] ?? '',
isDefault: map['isDefault'] ?? false,
latitude: 0.0,
longitude: 0.0,
);
}
```
```
Map<String, dynamic> toMap() {
return {
'city': city,
```



```
'ward': ward,
'street': street,
'number': number,
'isDefault': isDefault,
'createdAt': DateTime.now(),
};
}
```
```
String get fullAddress => '$number, $street, $ward, $city';
}
```
## Trong file libs/data/services/address_service.dart, cập nhật mã nguồn có

## nội dung sau:

```
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/address_model.dart';
```
```
class AddressService {
final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
```
```
String get uid => _auth.currentUser!.uid;
```
```
CollectionReference get _addressRef =>
_firestore.collection('users').doc(uid).collection('addresses');
```
```
Future<void> addAddress(AddressModel address) async {
await _addressRef.add(address.toMap());
}
```
```
Future<void> updateAddress(AddressModel address) async {
await _addressRef.doc(address.id).update(address.toMap());
}
```
```
Future<void> deleteAddress(String id) async {
await _addressRef.doc(id).delete();
}
```
```
Future<void> setDefaultAddress(String addressId) async {
final snapshot = await _addressRef.get();
```
```
for (var doc in snapshot.docs) {
await doc.reference.update({'isDefault': false});
}
```
```
await _addressRef.doc(addressId).update({'isDefault': true});
}
```
```
Stream<List<AddressModel>> getAddresses() {
```



```
return _addressRef.snapshots().map(
(snapshot) => snapshot.docs.map((doc) {
return AddressModel.fromMap(doc.id, doc.data() as Map<String,
dynamic>);
}).toList(),
);
}
}
```
## Trong file libs/data/services/list_location_service.dart, cập nhật mã

## nguồn có nội dung sau:

```
import 'dart:convert';
import 'package:http/http.dart' as http;
```
```
class LocationService {
Future<List<dynamic>> fetchCities() async {
final response = await http.get(
Uri.parse('https://provinces.open-api.vn/api/v2/?depth=2'),
);
```
```
return jsonDecode(response.body);
}
}
```
## Trong file libs

## /screens/shipping_address/my_shipping_address_screen.dart’,cập

## nhật mã nguồn có nội dung sau:

```
import
'package:draf_project/screens/shipping_address/add_edit_address_screen.dart';
import 'package:flutter/material.dart';
import '/controller/address_controller.dart';
import '/data/models/address_model.dart';
```
```
class MyShippingAddressScreen extends StatelessWidget {
final AddressController _controller = AddressController();
```
```
MyShippingAddressScreen({super.key});
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor:
Colors.grey[ 50 ], // Màu nền xám nhạt để nổi bật các Card trắng
appBar: AppBar(
title: const Text(
'My Addresses',
style: TextStyle(fontWeight: FontWeight.bold),
```



### ),

```
centerTitle: true,
elevation: 0 ,
backgroundColor: Colors.white,
foregroundColor: Colors.black,
),
floatingActionButton: FloatingActionButton.extended(
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(builder: (_) => const EditAddressScreen()),
);
},
label: const Text('Add New Address'),
icon: const Icon(Icons.add),
backgroundColor: Colors.blueAccent,
),
body: StreamBuilder<List<AddressModel>>(
stream: _controller.getAddresses(),
builder: (context, snapshot) {
if (snapshot.connectionState == ConnectionState.waiting) {
return const Center(child: CircularProgressIndicator());
}
```
```
if (!snapshot.hasData || snapshot.data!.isEmpty) {
return _buildEmptyState();
}
```
```
final addresses = snapshot.data!;
```
```
return ListView.builder(
padding: const EdgeInsets.all( 16 ),
itemCount: addresses.length,
itemBuilder: (context, index) {
final address = addresses[index];
return _buildAddressCard(context, address);
},
);
},
),
);
}
```
```
// --- WIDGET GIAO DIỆN KHI TRỐNG ---
Widget _buildEmptyState() {
return Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
```



```
Icon(Icons.location_off_outlined, size: 80 , color:
Colors.grey[ 300 ]),
const SizedBox(height: 16 ),
Text(
'No address yet',
style: TextStyle(
fontSize: 18 ,
color: Colors.grey[ 600 ],
fontWeight: FontWeight.w500,
),
),
const SizedBox(height: 8 ),
const Text('Please add your shipping address to continue'),
],
),
);
}
```
### // --- WIDGET CARD ĐỊA CHỈ ---

```
Widget _buildAddressCard(BuildContext context, AddressModel address) {
return Container(
margin: const EdgeInsets.only(bottom: 16 ),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 16 ),
border: address.isDefault
? Border.all(
color: Colors.blueAccent,
width: 2 ,
) // Viền xanh nếu là mặc định
: Border.all(color: Colors.transparent),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.05),
blurRadius: 10 ,
offset: const Offset( 0 , 4 ),
),
],
),
child: InkWell(
onTap: () => Navigator.push(
context,
MaterialPageRoute(
builder: (_) => EditAddressScreen(address: address),
),
),
borderRadius: BorderRadius.circular( 16 ),
child: Padding(
padding: const EdgeInsets.all( 16 ),
child: Column(
```



```
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
children: [
const Icon(Icons.location_on, color: Colors.blueAccent),
const SizedBox(width: 8 ),
// Giả sử AddressModel của bạn có thêm trường Name hoặc
Type (Home/Office)
const Text(
"Shipping Address",
style: TextStyle(fontWeight: FontWeight.bold, fontSize:
16 ),
),
const Spacer(),
if (address.isDefault)
Container(
padding: const EdgeInsets.symmetric(
horizontal: 8 ,
vertical: 4 ,
),
decoration: BoxDecoration(
color: Colors.blueAccent.withOpacity(0.1),
borderRadius: BorderRadius.circular( 8 ),
),
child: const Text(
'Default',
style: TextStyle(
color: Colors.blueAccent,
fontSize: 12 ,
fontWeight: FontWeight.bold,
),
),
),
],
),
const Padding(
padding: EdgeInsets.symmetric(vertical: 12 ),
child: Divider(height: 1 ),
),
Text(
address.fullAddress,
style: TextStyle(
color: Colors.grey[ 800 ],
height: 1.5,
fontSize: 15 ,
),
),
const SizedBox(height: 12 ),
Row(
mainAxisAlignment: MainAxisAlignment.end,
```



```
children: [
// Nút Xóa nhanh hoặc Menu
TextButton.icon(
onPressed: () => Navigator.push(
context,
MaterialPageRoute(
builder: (_) => EditAddressScreen(address: address),
),
),
icon: const Icon(Icons.edit_outlined, size: 18 ),
label: const Text("Edit"),
),
PopupMenuButton(
icon: const Icon(Icons.more_vert, color: Colors.grey),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 12 ),
),
itemBuilder: (context) => [
if (!address.isDefault)
const PopupMenuItem(
value: 'default',
child: Row(
children: [
Icon(Icons.check_circle_outline, size: 20 ),
SizedBox(width: 8 ),
Text('Set as Default'),
],
),
),
const PopupMenuItem(
value: 'delete',
child: Row(
children: [
Icon(
Icons.delete_outline,
color: Colors.red,
size: 20 ,
),
SizedBox(width: 8 ),
Text('Delete', style: TextStyle(color:
Colors.red)),
],
),
),
],
onSelected: (value) {
if (value == 'default') {
_controller.setDefaultAddress(address.id);
} else if (value == 'delete') {
_showDeleteConfirm(context, address.id);
```



### }

### },

### ),

### ],

### ),

### ],

### ),

### ),

### ),

### );

### }

### // --- HÀM XÁC NHẬN XÓA ---

```
void _showDeleteConfirm(BuildContext context, String addressId) {
showDialog(
context: context,
builder: (context) => AlertDialog(
title: const Text('Delete Address?'),
content: const Text('Are you sure you want to remove this address?'),
actions: [
TextButton(
onPressed: () => Navigator.pop(context),
child: const Text('Cancel'),
),
TextButton(
onPressed: () {
_controller.deleteAddress(addressId);
Navigator.pop(context);
},
child: const Text('Delete', style: TextStyle(color: Colors.red)),
),
],
),
);
}
}
```
## Trong file libs /screens/shipping_address/

## add_edit_address_screen.dart, cập nhật mã nguồn có nội dung sau:

```
import 'package:flutter/material.dart';
import '/data/models/address_model.dart';
import '/controller/address_controller.dart';
import '../../data/services/list_location_service.dart';
```
```
class EditAddressScreen extends StatefulWidget {
final AddressModel? address;
```
```
const EditAddressScreen({super.key, this.address});
```



```
@override
State<EditAddressScreen> createState() => _EditAddressScreenState();
}
```
```
class _EditAddressScreenState extends State<EditAddressScreen> {
final AddressController _controller = AddressController();
final LocationService _locationService = LocationService();
final _formKey = GlobalKey<FormState>();
```
```
List<dynamic> _cities = [];
List<dynamic> _wards = [];
String? _selectedCity;
String? _selectedWard;
```
```
bool _isDefault = false;
bool _isLoadingLocation = true;
bool _isSaving = false;
```
```
final TextEditingController _streetController = TextEditingController();
final TextEditingController _numberController = TextEditingController();
```
```
@override
void initState() {
super.initState();
_loadCities();
}
```
```
// --- LOGIC GIỮ NGUYÊN ---
Future<void> _loadCities() async {
try {
final cities = await _locationService.fetchCities();
if (mounted) {
setState(() {
_cities = cities;
_isLoadingLocation = false;
});
if (widget.address != null) {
_selectedCity = widget.address!.city;
_selectedWard = widget.address!.ward;
_streetController.text = widget.address!.street;
_numberController.text = widget.address!.number;
_isDefault = widget.address!.isDefault;
_loadWardsFromCity(_selectedCity);
}
}
} catch (e) {
if (mounted) setState(() => _isLoadingLocation = false);
}
}
```



```
void _loadWardsFromCity(String? cityName) {
if (cityName == null) return;
final city = _cities.firstWhere(
(c) => c['name'] == cityName,
orElse: () => null,
);
if (city != null) setState(() => _wards = city['wards']);
}
```
```
void _onCityChanged(String? value) {
setState(() {
_selectedCity = value;
_selectedWard = null;
_wards = [];
});
_loadWardsFromCity(value);
}
```
```
Future<void> _save() async {
if (!_formKey.currentState!.validate()) return;
setState(() => _isSaving = true);
final address = AddressModel(
id: widget.address?.id ?? '',
city: _selectedCity!,
ward: _selectedWard!,
street: _streetController.text.trim(),
number: _numberController.text.trim(),
isDefault: _isDefault,
latitude: 0.0,
longitude: 0.0,
);
try {
if (widget.address == null) {
await _controller.addAddress(address);
} else {
await _controller.updateAddress(address);
}
if (_isDefault && widget.address != null) {
await _controller.setDefaultAddress(widget.address!.id);
}
if (mounted) Navigator.pop(context);
} catch (e) {
ScaffoldMessenger.of(
context,
).showSnackBar(SnackBar(content: Text('Error: $e')));
} finally {
if (mounted) setState(() => _isSaving = false);
}
}
```



### // --- GIAO DIỆN MỚI ---

```
@override
Widget build(BuildContext context) {
if (_isLoadingLocation) {
return const Scaffold(
body: Center(child: CircularProgressIndicator(strokeWidth: 2 )),
);
}
```
```
return Scaffold(
backgroundColor: Colors.grey[ 50 ], // Màu nền hơi xám cho nổi bật các
card
appBar: AppBar(
title: Text(
widget.address == null? 'New Shipping Address' : 'Edit Address',
),
elevation: 0 ,
backgroundColor: Colors.white,
foregroundColor: Colors.black,
),
body: GestureDetector(
onTap: () => FocusScope.of(context).unfocus(),
child: SingleChildScrollView(
padding: const EdgeInsets.all( 20 ),
child: Form(
key: _formKey,
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
_buildSectionTitle("Location Details"),
const SizedBox(height: 12 ),
```
```
// Dropdown Thành phố
_buildDropdownContainer(
child: DropdownButtonFormField<String>(
isExpanded: true, // Chống tràn
value: _selectedCity,
hint: const Text("Select Province/City"),
decoration:
_inputDecoration(Icons.location_city_outlined),
items: _cities
.map(
(city) => DropdownMenuItem(
value: city['name'] as String,
child: Text(
city['name'],
overflow: TextOverflow.ellipsis,
),
),
```



### )

```
.toList(),
onChanged: _onCityChanged,
validator: (v) => v == null? 'Please select a city' :
null,
),
),
```
```
const SizedBox(height: 16 ),
```
```
// Dropdown Phường xã
_buildDropdownContainer(
child: DropdownButtonFormField<String>(
isExpanded: true, // Chống tràn
value: _selectedWard,
hint: const Text("Select Ward/Commune"),
decoration: _inputDecoration(Icons.map_outlined),
items: _wards
.map(
(ward) => DropdownMenuItem(
value: ward['name'] as String,
child: Text(
ward['name'],
overflow: TextOverflow.ellipsis,
),
),
)
.toList(),
onChanged: (v) => setState(() => _selectedWard = v),
validator: (v) => v == null? 'Please select a ward' :
null,
),
),
```
```
const SizedBox(height: 24 ),
_buildSectionTitle("Address Details"),
const SizedBox(height: 12 ),
```
```
// Đường
TextFormField(
controller: _streetController,
decoration: _inputDecoration(
Icons.signpost_outlined,
label: "Street Name",
),
validator: (v) =>
(v == null || v.isEmpty)? 'Enter street name' : null,
),
```
```
const SizedBox(height: 16 ),
```



```
// Số nhà
TextFormField(
controller: _numberController,
decoration: _inputDecoration(
Icons.home_outlined,
label: "House Number / Building",
),
validator: (v) =>
(v == null || v.isEmpty)? 'Enter house number' : null,
),
```
```
const SizedBox(height: 16 ),
```
```
// Switch Set Default (Nhìn sang chảnh hơn Checkbox)
Container(
padding: const EdgeInsets.symmetric(horizontal: 4 ),
child: SwitchListTile(
contentPadding: EdgeInsets.zero,
value: _isDefault,
activeColor: Colors.blue,
title: const Text(
'Set as default address',
style: TextStyle(fontSize: 15 ),
),
onChanged: (v) => setState(() => _isDefault = v),
),
),
```
```
const SizedBox(height: 40 ),
```
```
// Nút Save
SizedBox(
width: double.infinity,
height: 55 ,
child: ElevatedButton(
onPressed: _isSaving? null : _save,
style: ElevatedButton.styleFrom(
backgroundColor: Colors.blue[ 700 ],
foregroundColor: Colors.white,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 16 ),
),
elevation: 2 ,
),
child: _isSaving
? const SizedBox(
height: 20 ,
width: 20 ,
child: CircularProgressIndicator(
```



```
color: Colors.white,
strokeWidth: 2 ,
),
)
: const Text(
'Save Address',
style: TextStyle(
fontSize: 16 ,
fontWeight: FontWeight.bold,
),
),
),
),
],
),
),
),
),
);
}
```
### // --- HELPER WIDGETS ---

```
InputDecoration _inputDecoration(IconData icon, {String? label}) {
return InputDecoration(
labelText: label,
prefixIcon: Icon(icon, color: Colors.blue[ 400 ], size: 22 ),
filled: true,
fillColor: Colors.white,
contentPadding: const EdgeInsets.symmetric(horizontal: 16 , vertical:
16 ),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular( 16 ),
borderSide: BorderSide.none,
),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular( 16 ),
borderSide: BorderSide(color: Colors.grey[ 200 ]!),
),
focusedBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular( 16 ),
borderSide: const BorderSide(color: Colors.blue, width: 1.5),
),
errorBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular( 16 ),
borderSide: const BorderSide(color: Colors.red, width: 1 ),
),
);
}
```



```
Widget _buildSectionTitle(String title) {
return Text(
title.toUpperCase(),
style: TextStyle(
fontSize: 12 ,
fontWeight: FontWeight.bold,
color: Colors.grey[ 600 ],
letterSpacing: 1.2,
),
);
}
```
```
Widget _buildDropdownContainer({required Widget child}) {
// Dùng container này để đồng bộ shadow và bo góc nếu cần
return child;
}
```
```
@override
void dispose() {
_streetController.dispose();
_numberController.dispose();
super.dispose();
}
}
```
## Trong file libs/routes/app_routes.dart, cập nhật mã nguồn có nội dung sau:

```
import 'package:draf_project/screens/auth/forget_password_screen.dart';
import 'package:draf_project/screens/auth/login_screen.dart';
import 'package:draf_project/screens/auth/register_screen.dart';
import 'package:draf_project/screens/auth/register_success_screen.dart';
import 'package:draf_project/screens/auth/reset_email_sent_screen.dart';
import 'package:draf_project/screens/auth/verify_email_screen.dart';
import
'package:draf_project/screens/bank_account/my_bank_account_screen.dart';
import 'package:draf_project/screens/onboarding/onboarding_screen.dart';
import 'package:draf_project/screens/profile/change_dateofbirth_screen.dart';
import 'package:draf_project/screens/profile/change_email_screen.dart';
import 'package:draf_project/screens/profile/change_gender_screen.dart';
import 'package:draf_project/screens/profile/change_name_screen.dart';
import 'package:draf_project/screens/profile/change_password_screen.dart';
import 'package:draf_project/screens/profile/change_phonenumber_screen.dart';
import 'package:draf_project/screens/profile/change_username_screen.dart';
import 'package:draf_project/screens/profile/update_account_screen.dart';
import
'package:draf_project/screens/shipping_address/my_shipping_address_screen.dar
t';
import 'package:flutter/material.dart';
import '../screens/home/main_navigation_screen.dart';
import '../screens/spalsh/splash_screen.dart';
```



```
class AppRoutes {
static const String splash = '/';
static const String onboarding = '/onboarding';
static const String login = '/login';
static const String forgetPassword = '/forget-password';
static const String resetEmailSent = '/reset-email-sent';
static const String register = '/register';
static const String verifyEmail = '/verify-email';
static const String registerSuccess = '/register-success';
static const String home = '/home';
static const String profile = '/profile';
static const String publisher = '/publisher';
static const String updateAccount = '/update-account';
```
```
static const String changeName = '/change-name';
static const String changeUsername = '/change-username';
static const String changePassword = '/change-password';
static const String changeEmail = '/change-email';
static const String changePhoneNumber = '/change-phonenumber';
static const String changeGender = '/change-gender';
static const String changeDateofBirth = '/change-datebirth';
static const String cartOverview = '/cart-overview';
static const String orderOverview = '/order-overview';
static const String myOrderview = '/my-order';
static const String myShippingAddressview = '/my_shipping_address';
static const String myBankAccountview = '/my_bank_account';
```
```
static Map<String, WidgetBuilder> routes = {
splash: (context) => const SplashScreen(),
onboarding: (context) => const OnboardingScreen(),
home: (context) => const MainNavigationScreen(),
register: (context) => const RegisterScreen(),
login: (context) => const LoginScreen(),
forgetPassword: (context) => ForgetPasswordScreen(),
forgetPassword: (context) => ForgetPasswordScreen(),
home: (context) => const MainNavigationScreen(),
updateAccount: (context) => const UpdateAccountScreen(),
changeName: (context) => const ChangeNameScreen(),
changeUsername: (context) => const ChangeUsernameScreen(),
changePassword: (context) => const ChangePasswordScreen(),
changeEmail: (context) => const ChangeEmailScreen(),
changePhoneNumber: (context) => const ChangePhoneNumberScreen(),
changeGender: (context) => const ChangeGenderScreen(),
changeDateofBirth: (context) => const ChangeDateOfBirthScreen(),
myShippingAddressview: (context) => MyShippingAddressScreen(),
myBankAccountview: (context) => MyBankAccountScreen(),
verifyEmail: (context) {
final String email = ModalRoute.of(context)!.settings.arguments as
String;
```



```
return VerifyEmailScreen(email: email);
},
```
```
registerSuccess: (context) => const RegisterSuccessScreen(),
```
```
resetEmailSent: (context) {
final email = ModalRoute.of(context)!.settings.arguments as String;
return ResetEmailSentScreen(email: email);
},
};
}
```
## 11. Thiết kế và phát triển nhóm chức năng của màn hình trang chủ

## Trong màn hình trang chủ, chúng ta sẽ có những chức năng cơ bản như:

- Hiện tên người dùng sau khi đăng nhập
- Hiện thông báo khi có cập nhật trạng thái mới từ đơn hàng
- Hiện số lượng sản phẩm đang có trong giỏ hàng
- Banner quảng bá cửa hàng
- Tìm kiếm sản phẩm
- Hiện danh mục sản phẩm đang có
- Hiện một số sản phẩm phổ biến nhất trong cửa hàng

## Để làm được những chức năng này, sinh viên tạo các file mã nguồn sau:

## 1) Nhóm file mã nguồn liên quan đến chức năng xem số lượng sản phẩm trong giỏ hàng

## Trong file libs/controller/cart_controller.dart , soạn mã nguồn có nội

## dung sau:

```
import 'package:get/get.dart';
import '../data/models/cart_item_model.dart';
import '../data/services/cart_service.dart';
```
```
class CartController extends GetxController {
final CartService _service = CartService();
```
```
RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
```
```
/// ADD
void addToCart(CartItemModel item) {
_service.addToCart(item);
```
```
///QUAN TRỌNG: phải assign lại list
cartItems.assignAll(_service.cart.items);
```
```
Get.snackbar("Success", "Added to cart");
```



### }

### /// REMOVE

```
void removeItem(CartItemModel item) {
_service.removeItem(item);
cartItems.assignAll(_service.cart.items);
}
```
```
/// INCREASE
void increaseQty(CartItemModel item) {
_service.increaseQty(item);
cartItems.assignAll(_service.cart.items);
}
```
### /// DECREASE

```
void decreaseQty(CartItemModel item) {
_service.decreaseQty(item);
cartItems.assignAll(_service.cart.items);
}
```
```
/// TOTAL PRICE
double get totalPrice {
return cartItems.fold(
0 ,
(sum, item) => sum + item.finalPrice * item.quantity,
);
}
```
```
/// TOTAL COUNT (cho icon)
int get totalItems {
return cartItems.fold( 0 , (sum, item) => sum + item.quantity);
}
```
```
bool isInCart(String productId, Map<String, String>? variation) {
return cartItems.any(
(item) =>
item.productId == productId &&
_isSameVariation(item.selectedVariation, variation),
);
}
```
```
/// copy lại logic từ service
bool _isSameVariation(Map<String, String>? a, Map<String, String>? b)
{
if (a == null && b == null) return true;
if (a == null || b == null) return false;
if (a.length != b.length) return false;
```
```
for (final key in a.keys) {
if (a[key] != b[key]) return false;
```



### }

```
return true;
}
```
```
bool isProductInCart(String productId, Map<String, String>? variation)
{
return cartItems.any((item) {
/// chỉ cần cùng productId là đủ (bỏ variation)
return item.productId == productId;
});
}
}
```
## Trong file libs/data/models/cart_model.dart , soạn mã nguồn có nội dung

## sau:

```
import 'package:draf_project/data/models/cart_item_model.dart';
```
```
class CartModel {
String cartId;
List<CartItemModel> items;
```
```
CartModel({required this.cartId, required this.items});
```
```
static CartModel empty() => CartModel(cartId: '', items: []);
}
```
## Trong file libs/data/models/cart_item_model.dart , soạn mã nguồn có

## nội dung sau:

```
class CartItemModel {
String productId;
int quantity;
```
```
String? image;
double price;
```
```
String title;
String? brandName;
```
```
Map<String, String>? selectedVariation;
```
```
CartItemModel({
required this.productId,
required this.quantity,
this.image,
this.price = 0.0,
this.title = '',
this.brandName,
this.selectedVariation,
});
```



```
double get finalPrice => price;
Map<String, dynamic> toJson() {
return {
'productId': productId,
'quantity': quantity,
'image': image,
'price': price,
'title': title,
'brandName': brandName,
'selectedVariation': selectedVariation,
};
}
```
```
factory CartItemModel.fromJson(Map<String, dynamic> json) {
return CartItemModel(
productId: json['productId'],
quantity: json['quantity'],
image: json['image'],
price: (json['price'] ?? 0 ).toDouble(),
title: json['title'] ?? '',
brandName: json['brandName'],
selectedVariation: (json['selectedVariation'] as Map?)
?.cast<String, String>(),
);
}
}
```
## Trong file libs/data/services/cart_service.dart , soạn mã nguồn có

## nội dung sau:

```
import '/data/models/cart_model.dart';
import '/data/models/cart_item_model.dart';
```
```
class CartService {
final CartModel _cart = CartModel.empty();
```
```
CartModel get cart => _cart;
```
```
/// Add to cart
void addToCart(CartItemModel item) {
final index = _cart.items.indexWhere(
(e) =>
e.productId == item.productId &&
_isSameVariation(e.selectedVariation, item.selectedVariation),
);
```
```
if (index >= 0 ) {
_cart.items[index].quantity += item.quantity;
} else {
```



```
_cart.items.add(item);
}
}
```
```
/// Remove item
void removeItem(CartItemModel item) {
_cart.items.remove(item);
}
```
```
/// Increase
void increaseQty(CartItemModel item) {
item.quantity++;
}
```
```
/// Decrease
void decreaseQty(CartItemModel item) {
if (item.quantity > 1 ) {
item.quantity--;
} else {
_cart.items.remove(item);
}
}
```
```
///Compare variation
bool _isSameVariation(Map<String, String>? a, Map<String, String>? b)
{
if (a == null && b == null) return true;
if (a == null || b == null) return false;
if (a.length != b.length) return false;
```
```
for (final key in a.keys) {
if (a[key] != b[key]) return false;
}
return true;
}
}
```
## Trong file libs/screens/cart_overview_screen.dart , soạn mã nguồn có

## nội dung sau:

```
import 'package:draf_project/controller/login_controller.dart';
import 'package:draf_project/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../data/models/cart_item_model.dart';
import '../order/order_overview_screen.dart';
```
```
class CartOverviewScreen extends StatelessWidget {
const CartOverviewScreen({super.key});
```



```
@override
Widget build(BuildContext context) {
final cartController = Get.find<CartController>();
```
```
return Scaffold(
backgroundColor: Colors.grey[ 50 ], // Nền xám nhạt đồng bộ
appBar: AppBar(
title: const Text(
'Giỏ hàng của bạn',
style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18 ),
),
centerTitle: true,
elevation: 0 ,
foregroundColor: Colors.white,
flexibleSpace: Container(
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [Colors.blue.shade700, Colors.blue.shade400],
),
),
),
),
body: Column(
children: [
/// ================= DANH SÁCH GIỎ HÀNG =================
Expanded(
child: Obx(() {
if (cartController.cartItems.isEmpty) {
return Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
Icons.shopping_cart_outlined,
size: 100 ,
color: Colors.grey.shade300,
),
const SizedBox(height: 16 ),
const Text(
"Giỏ hàng của bạn đang trống",
style: TextStyle(fontSize: 16 , color:
Colors.grey),
),
const SizedBox(height: 24 ),
ElevatedButton(
onPressed: () => Get.back(),
style: ElevatedButton.styleFrom(
```



```
backgroundColor: Colors.blue.shade600,
foregroundColor: Colors.white,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 12 ),
),
),
child: const Text("Tiếp tục mua sắm"),
),
],
),
);
}
```
```
return ListView.builder(
itemCount: cartController.cartItems.length,
padding: const EdgeInsets.all( 16 ),
physics: const BouncingScrollPhysics(),
itemBuilder: (context, index) {
final item = cartController.cartItems[index];
```
```
return _CartItem(
item: item,
onIncrease: () => cartController.increaseQty(item),
onDecrease: () => cartController.decreaseQty(item),
onRemove: () => cartController.removeItem(item),
);
},
);
}),
),
```
```
/// ================= THANH THANH TOÁN (BOTTOM BAR)
=================
Obx(
() => Container(
padding: const EdgeInsets.fromLTRB( 24 , 16 , 24 , 32 ),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: const BorderRadius.only(
topLeft: Radius.circular( 30 ),
topRight: Radius.circular( 30 ),
),
boxShadow: [
BoxShadow(
blurRadius: 20 ,
color: Colors.black.withOpacity(0.08),
offset: const Offset( 0 , - 5 ),
),
],
),
```



```
child: Row(
children: [
Expanded(
child: Column(
mainAxisSize: MainAxisSize.min,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text(
'Tổng thanh toán',
style: TextStyle(color: Colors.grey, fontSize:
14 ),
),
Text(
'\$${cartController.totalPrice.toStringAsFixed
( 2 )}',
style: TextStyle(
fontSize: 22 ,
fontWeight: FontWeight.bold,
color: Colors.blue.shade800,
),
),
],
),
),
const SizedBox(width: 16 ),
Expanded(
child: Container(
height: 55 ,
decoration: BoxDecoration(
gradient: LinearGradient(
colors: [Colors.blue.shade700,
Colors.blue.shade400],
),
borderRadius: BorderRadius.circular( 16 ),
boxShadow: [
BoxShadow(
color: Colors.blue.withOpacity(0.3),
blurRadius: 10 ,
offset: const Offset( 0 , 4 ),
),
],
),
child: ElevatedButton.icon(
onPressed: () async {
final auth = Get.find<AuthController>();
```
```
if (auth.currentUser == null) {
final result = await Get.to(() =>
LoginScreen());
if (result == true) {
```



```
Get.to(() => const OrderReviewScreen());
}
} else {
Get.to(() => const OrderReviewScreen());
}
},
style: ElevatedButton.styleFrom(
backgroundColor: Colors.transparent,
shadowColor: Colors.transparent,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 16 ),
),
),
icon: const Icon(
Icons.payment_rounded,
color: Colors.white,
),
label: const Text(
'Thanh toán',
style: TextStyle(
color: Colors.white,
fontSize: 16 ,
fontWeight: FontWeight.bold,
),
),
),
),
),
],
),
),
),
],
),
);
}
}
```
```
class _CartItem extends StatelessWidget {
final CartItemModel item;
final VoidCallback onIncrease;
final VoidCallback onDecrease;
final VoidCallback onRemove;
```
```
const _CartItem({
required this.item,
required this.onIncrease,
required this.onDecrease,
required this.onRemove,
});
```



```
@override
Widget build(BuildContext context) {
final total = item.finalPrice * item.quantity;
```
```
return Container(
margin: const EdgeInsets.only(bottom: 16 ),
padding: const EdgeInsets.all( 12 ),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 16 ),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.04),
blurRadius: 10 ,
offset: const Offset( 0 , 4 ),
),
],
),
child: Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
/// ================= HÌNH ẢNH =================
Stack(
children: [
Container(
decoration: BoxDecoration(
borderRadius: BorderRadius.circular( 12 ),
color: Colors.grey.shade100,
),
child: ClipRRect(
borderRadius: BorderRadius.circular( 12 ),
child: Image.network(
item.image ?? '',
height: 90 ,
width: 90 ,
fit: BoxFit.cover,
errorBuilder: (_, __, ___) =>
const Icon(Icons.image_not_supported, size: 40 ),
),
),
),
],
),
```
```
const SizedBox(width: 16 ),
```
```
/// ================= THÔNG TIN =================
Expanded(
child: Column(
```



```
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Expanded(
child: Text(
item.brandName ?? '',
maxLines: 1 ,
overflow: TextOverflow.ellipsis,
style: TextStyle(
fontSize: 12 ,
color: Colors.blue.shade700,
fontWeight: FontWeight.w500,
),
),
),
GestureDetector(
onTap: onRemove,
child: Icon(
Icons.delete_outline_rounded,
color: Colors.red.shade400,
size: 22 ,
),
),
],
),
```
```
const SizedBox(height: 2 ),
```
```
Text(
item.title,
maxLines: 1 ,
overflow: TextOverflow.ellipsis,
style: const TextStyle(
fontWeight: FontWeight.bold,
fontSize: 15 ,
),
),
```
```
const SizedBox(height: 4 ),
```
```
if (item.selectedVariation != null &&
item.selectedVariation!.isNotEmpty)
Container(
padding: const EdgeInsets.symmetric(
horizontal: 8 ,
vertical: 4 ,
),
decoration: BoxDecoration(
```



```
color: Colors.grey.shade100,
borderRadius: BorderRadius.circular( 6 ),
),
child: Text(
item.selectedVariation!.entries
.map((e) => "${e.key}: ${e.value}")
.join(" | "),
style: const TextStyle(fontSize: 11 , color:
Colors.grey),
),
),
```
```
const SizedBox(height: 12 ),
```
### /// SỐ LƯỢNG + GIÁ

```
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Container(
decoration: BoxDecoration(
color: Colors.grey.shade50,
borderRadius: BorderRadius.circular( 10 ),
border: Border.all(color: Colors.grey.shade200),
),
child: Row(
children: [
_QtyButton(icon: Icons.remove, onTap:
onDecrease),
Container(
constraints: const BoxConstraints(minWidth:
30 ),
alignment: Alignment.center,
child: Text(
item.quantity.toString(),
style: const TextStyle(
fontWeight: FontWeight.bold,
),
),
),
_QtyButton(icon: Icons.add, onTap:
onIncrease),
],
),
),
Text(
'\$${total.toStringAsFixed( 2 )}',
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 16 ,
color: Colors.blue.shade800,
```



### ),

### ),

### ],

### ),

### ],

### ),

### ),

### ],

### ),

### );

### }

### }

```
class _QtyButton extends StatelessWidget {
final IconData icon;
final VoidCallback onTap;
```
```
const _QtyButton({required this.icon, required this.onTap});
```
```
@override
Widget build(BuildContext context) {
return InkWell(
onTap: onTap,
borderRadius: BorderRadius.circular( 8 ),
child: Padding(
padding: const EdgeInsets.all( 6 ),
child: Icon(icon, size: 18 , color: Colors.blue.shade700),
),
);
}
}
```
## 2) Nhóm file mã nguồn liên quan đến chức năng xem thông báo cập nhật trạng thái đơn

## hàng

## Trong file libs/controller/notification_controller.dart, soạn mã

## nguồn có nội dung sau:

```
import 'package:get/get.dart';
import '../data/models/notification_model.dart';
import '../data/services/notification_service.dart';
import 'login_controller.dart';
```
```
class NotificationController extends GetxController {
final NotificationService _service = NotificationService();
```
```
final notifications = <NotificationModel>[].obs;
final unreadCount = 0.obs;
```



```
late AuthController authController;
```
```
@override
void onInit() {
super.onInit();
```
```
authController = Get.find<AuthController>();
final user = authController.currentUser;
```
```
if (user != null) {
_service.getUserNotifications(user.id).listen((data) {
notifications.value = data;
```
```
///tính số chưa đọc
unreadCount.value = data.where((n) => n.isRead == false).length;
});
}
}
```
```
/// đánh dấu đã đọc
Future<void> markAsRead(NotificationModel noti) async {
if (noti.isRead) return;
```
```
await _service.markAsRead(noti.id);
```
```
/// reload lại list từ firestore
notifications.value = notifications.map((n) {
if (n.id == noti.id) {
return NotificationModel(
id: n.id,
userId: n.userId,
orderId: n.orderId,
orderStatus: n.orderStatus,
message: n.message,
isRead: true,
createdAt: n.createdAt,
);
}
return n;
}).toList();
```
```
unreadCount.value = notifications.where((n) => !n.isRead).length;}}
```
## Trong file libs/data/models/notification_model.dart, soạn mã nguồn

## có nội dung sau:




## Trong file libs/data/services/notification_service.dart, soạn mã

## nguồn có nội dung sau:

```
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/notification_model.dart';
```
```
class NotificationService {
final _db = FirebaseFirestore.instance;
```
```
Stream<List<NotificationModel>> getUserNotifications(String userId) {
return _db
.collection('notifications')
.where('userId', isEqualTo: userId)
.orderBy('createdAt', descending: true)
```
```
import 'package:cloud_firestore/cloud_firestore.dart';
```
```
class NotificationModel {
final String id;
final String userId;
final String orderId;
final String orderStatus;
final String message;
final bool isRead;
final DateTime createdAt;
```
```
NotificationModel({
required this.id,
required this.userId,
required this.orderId,
required this.orderStatus,
required this.message,
required this.isRead,
required this.createdAt,
});
```
```
factory NotificationModel.fromFirestore(DocumentSnapshot doc) {
final data = doc.data() as Map<String, dynamic>;
```
```
return NotificationModel(
id: doc.id,
userId: data['userId'],
orderId: data['orderId'],
orderStatus: data['orderStatus'],
message: data['message'],
isRead: data['isRead'] ?? false,
createdAt: (data['createdAt'] as Timestamp).toDate(),
);
}
}
```



```
.snapshots()
.map((snapshot) {
return snapshot.docs
.map((doc) => NotificationModel.fromFirestore(doc))
.toList();
});
}
```
```
Future<void> markAsRead(String docId) async {
await FirebaseFirestore.instance
.collection('notifications')
.doc(docId)
.update({"isRead": true});
}
}
```
## Trong file libs//screens/notifications/my_notifications.dart

## , soạn mã nguồn có nội dung sau:

```
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draf_project/data/models/order_model.dart';
import 'package:draf_project/screens/order/ordered_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/notification_controller.dart';
```
```
class MyNotificationScreen extends StatelessWidget {
MyNotificationScreen({super.key});
```
```
final NotificationController controller = Get.find();
// Hàm hỗ trợ lấy Icon và Màu sắc dựa trên OrderStatus
Map<String, dynamic> _getStatusStyle(String message) {
String msg = message.toLowerCase();
if (msg.contains('created'))
return {'icon': Icons.create, 'color': Colors.blue};
if (msg.contains('pending'))
return {'icon': Icons.hourglass_empty, 'color': Colors.orange};
if (msg.contains('processing'))
return {'icon': Icons.sync, 'color': Colors.amber};
if (msg.contains('shipped'))
return {'icon': Icons.local_shipping, 'color': Colors.purple};
if (msg.contains('delivered'))
return {'icon': Icons.check_circle, 'color': Colors.green};
if (msg.contains('cancelled'))
return {'icon': Icons.cancel, 'color': Colors.red};
if (msg.contains('returned'))
return {'icon': Icons.keyboard_return, 'color': Colors.blueGrey};
if (msg.contains('refunded'))
return {'icon': Icons.monetization_on, 'color': Colors.teal};
```



```
return {'icon': Icons.notifications, 'color': Colors.grey}; // Mặc
định
}
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.grey[ 100 ], // Nền xám nhạt cho chuyên
nghiệp
appBar: AppBar(
elevation: 0 ,
centerTitle: true,
title: const Text(
"Thông báo của tôi",
style: TextStyle(fontWeight: FontWeight.bold, color:
Colors.black),
),
backgroundColor: Colors.white,
actions: [
IconButton(
icon: const Icon(Icons.done_all, color: Colors.blue),
onPressed: () {
// Logic đánh dấu đọc hết tất cả nếu cần
},
),
],
),
body: Obx(() {
if (controller.notifications.isEmpty) {
return Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
Icons.notifications_none,
size: 100 ,
color: Colors.grey[ 300 ],
),
const SizedBox(height: 20 ),
Text(
"Chưa có thông báo nào",
style: TextStyle(
fontSize: 18 ,
color: Colors.grey[ 600 ],
fontWeight: FontWeight.w500,
),
),
const SizedBox(height: 10 ),
const Text(
```



```
"Các cập nhật về đơn hàng sẽ hiện ở đây",
style: TextStyle(color: Colors.grey),
),
],
),
);
}
```
```
return ListView.builder(
padding: const EdgeInsets.symmetric(vertical: 10 ),
itemCount: controller.notifications.length,
itemBuilder: (context, index) {
final noti = controller.notifications[index];
final style = _getStatusStyle(noti.message);
```
```
return Container(
margin: const EdgeInsets.symmetric(horizontal: 16 ,
vertical: 6 ),
decoration: BoxDecoration(
color: noti.isRead
? Colors.white
: Colors.blue.withOpacity(0.05),
borderRadius: BorderRadius.circular( 15 ),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.03),
blurRadius: 10 ,
offset: const Offset( 0 , 5 ),
),
],
),
child: ClipRRect(
borderRadius: BorderRadius.circular( 15 ),
child: IntrinsicHeight(
child: Row(
children: [
// Thanh màu chỉ thị bên trái
Container(
width: 5 ,
color: noti.isRead
? Colors.transparent
: style['color'],
),
Expanded(
child: ListTile(
contentPadding: const EdgeInsets.symmetric(
horizontal: 15 ,
vertical: 10 ,
),
leading: CircleAvatar(
```



```
backgroundColor:
style['color'].withOpacity(0.1),
child: Icon(style['icon'], color:
style['color']),
),
title: Text(
noti.message,
style: TextStyle(
fontWeight: noti.isRead
? FontWeight.normal
: FontWeight.bold,
fontSize: 15 ,
),
),
subtitle: Padding(
padding: const EdgeInsets.only(top: 8.0),
child: Row(
children: [
const Icon(
Icons.access_time,
size: 14 ,
color: Colors.grey,
),
const SizedBox(width: 5 ),
Text(
// Hiển thị thời gian (Bạn có thể dùng
intl để format đẹp hơn)
"${noti.createdAt.hour}:${noti.created
At.minute} -
${noti.createdAt.day}/${noti.createdAt.month}/${noti.createdAt.year}",
style: const TextStyle(
fontSize: 12 ,
color: Colors.grey,
),
),
],
),
),
trailing: !noti.isRead
? Container(
width: 10 ,
height: 10 ,
decoration: const BoxDecoration(
color: Colors.red,
shape: BoxShape.circle,
),
)
: null,
onTap: () async {
/// mark read
```



```
await controller.markAsRead(noti);
```
```
/// load order
final orderDoc = await
FirebaseFirestore.instance
.collection('orders')
.where('id', isEqualTo: noti.orderId)
.limit( 1 )
.get();
```
```
if (orderDoc.docs.isNotEmpty) {
final data = orderDoc.docs.first.data();
data['docId'] = orderDoc.docs.first.id;
```
```
final order = OrderModel.fromJson(data);
```
```
Navigator.push(
context,
MaterialPageRoute(
builder: (_) =>
OrderDetailScreen(order: order),
),
);
}
},
),
),
],
),
),
),
);
},
);
}),
);
}
}
```
## 3) Nhóm file mã nguồn liên quan đến chức năng chạy banner quảng cáo

## Trong file libs/common/widgets/ home_banner_slider.dart, soạn mã

## nguồn có nội dung sau:

```
import 'dart:async';
import 'package:flutter/material.dart';
```
```
class HomeBannerSlider extends StatefulWidget {
```



```
const HomeBannerSlider({super.key});
```
```
@override
State<HomeBannerSlider> createState() => _HomeBannerSliderState();
}
```
```
class _HomeBannerSliderState extends State<HomeBannerSlider> {
late PageController pageController;
late Timer autoSlideTimer;
```
```
int currentIndex = 0 ;
```
```
final List<String> bannerImages = [
'assets/images/banners/banner_1.jpg',
'assets/images/banners/banner_2.jpg',
'assets/images/banners/banner_3.jpg',
'assets/images/banners/banner_4.jpg',
'assets/images/banners/banner_5.jpg',
'assets/images/banners/banner_6.jpg',
'assets/images/banners/banner_7.jpg',
'assets/images/banners/banner_8.jpg',
];
```
```
@override
void initState() {
super.initState();
```
```
pageController = PageController(initialPage: 0 );
```
```
autoSlideTimer = Timer.periodic(const Duration(seconds: 3 ), (timer)
{
if (currentIndex < bannerImages.length - 1 ) {
currentIndex++;
} else {
currentIndex = 0 ;
}
```
```
pageController.animateToPage(
currentIndex,
duration: const Duration(milliseconds: 400 ),
curve: Curves.easeInOut,
);
});
}
```
```
@override
void dispose() {
autoSlideTimer.cancel();
pageController.dispose();
super.dispose();
```



### }

```
@override
Widget build(BuildContext context) {
return Column(
children: [
/// BANNER
SizedBox(
height: 160 ,
child: PageView.builder(
controller: pageController,
itemCount: bannerImages.length,
onPageChanged: (index) {
setState(() {
currentIndex = index;
});
},
itemBuilder: (context, index) {
return Container(
margin: const EdgeInsets.only(right: 12 ),
decoration: BoxDecoration(
borderRadius: BorderRadius.circular( 16 ),
image: DecorationImage(
image: AssetImage(bannerImages[index]),
fit: BoxFit.cover,
),
),
);
},
),
),
```
```
const SizedBox(height: 8 ),
```
### /// INDICATOR

```
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: List.generate(bannerImages.length, (index) {
return AnimatedContainer(
duration: const Duration(milliseconds: 300 ),
width: currentIndex == index? 16 : 8 ,
height: 8 ,
margin: const EdgeInsets.symmetric(horizontal: 4 ),
decoration: BoxDecoration(
color: currentIndex == index? Colors.blue :
Colors.grey,
borderRadius: BorderRadius.circular( 4 ),
),
);
}),
```



### ),

### ],

### );

### }

### }

## 4) Nhóm file mã nguồn liên quan đến chức năng xem thông tin sản phẩm

## Trong file libs/common/widgets/product_card.dart, soạn mã nguồn có

## nội dung sau:

```
import 'package:draf_project/controller/cart_controller.dart';
import 'package:draf_project/controller/login_controller.dart';
import 'package:draf_project/controller/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/product_model.dart';
import '../../screens/product/product_detail_screen.dart';
```
```
class ProductCard extends StatelessWidget {
final ProductModel product;
```
```
const ProductCard({super.key, required this.product});
```
```
@override
Widget build(BuildContext context) {
final cartController = Get.find<CartController>();
final wishlistController = Get.find<WishlistController>();
```
```
/// ================= LOGIC TÍNH TOÁN =================
final bool isOutOfStock =
product.isOutOfStock == true ||
product.stock <= 0 ||
product.soldQuantity >= product.stock;
```
```
final bool hasDiscount =
product.salePrice != null && product.salePrice! > 0 ;
final double discountPercent = hasDiscount? product.salePrice! : 0 ;
final double originalPrice = hasDiscount
? product.price / ( 1 - discountPercent / 100 )
: product.price;
```
```
return InkWell(
borderRadius: BorderRadius.circular( 16 ),
onTap: () {
Get.to(() => ProductDetailScreen(productId: product.id));
},
child: Container(
decoration: BoxDecoration(
borderRadius: BorderRadius.circular( 16 ),
```



```
color: Colors.white,
boxShadow: [
BoxShadow(
blurRadius: 10 ,
color: Colors.black.withOpacity(0.05),
offset: const Offset( 0 , 5 ),
),
],
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
/// ================= PHẦN HÌNH ẢNH (Sử dụng LayoutBuilder
để tránh tràn) =================
Stack(
children: [
ClipRRect(
borderRadius: const BorderRadius.vertical(
top: Radius.circular( 16 ),
),
child: AspectRatio(
aspectRatio: 1.1, // Cố định tỉ lệ ảnh để tránh nhảy
layout
child: Image.network(
product.thumbnail,
width: double.infinity,
fit: BoxFit.cover,
errorBuilder: (_, __, ___) => Container(
color: Colors.grey[ 100 ],
child: const Icon(
Icons.image_not_supported,
color: Colors.grey,
),
),
),
),
),
```
### /// OVERLAY HẾT HÀNG

```
if (isOutOfStock)
Positioned.fill(
child: Container(
decoration: BoxDecoration(
color: Colors.black.withOpacity(0.4),
borderRadius: const BorderRadius.vertical(
top: Radius.circular( 16 ),
),
),
child: Center(
child: Container(
```



```
padding: const EdgeInsets.symmetric(
horizontal: 8 ,
vertical: 4 ,
),
decoration: BoxDecoration(
color: Colors.black.withOpacity(0.7),
borderRadius: BorderRadius.circular( 4 ),
),
child: const Text(
"HẾT HÀNG",
style: TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
fontSize: 12 ,
),
),
),
),
),
),
```
### /// BADGE GIẢM GIÁ

```
if (hasDiscount && !isOutOfStock)
Positioned(
top: 8 ,
left: 8 ,
child: Container(
padding: const EdgeInsets.symmetric(
horizontal: 6 ,
vertical: 2 ,
),
decoration: BoxDecoration(
color: Colors.redAccent,
borderRadius: BorderRadius.circular( 6 ),
),
child: Text(
"-${discountPercent.toStringAsFixed( 0 )}%",
style: const TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
fontSize: 10 ,
),
),
),
),
```
```
/// NÚT YÊU THÍCH (Đặt trên ảnh để tiết kiệm diện tích
bên dưới)
Positioned(
top: 4 ,
```



```
right: 4 ,
child: Obx(() {
final isFav =
wishlistController.isInWishlist(product.id);
return IconButton(
constraints: const BoxConstraints(),
padding: const EdgeInsets.all( 4 ),
icon: Icon(
isFav? Icons.favorite : Icons.favorite_border,
size: 20 ,
color: isFav? Colors.red : Colors.grey[ 400 ],
),
onPressed: () async {
final authController =
Get.find<AuthController>();
if (authController.currentUser == null) {
_showLoginDialog();
return;
}
await
wishlistController.toggleWishlist(product);
},
);
}),
),
],
),
```
```
/// ================= PHẦN NỘI DUNG (Sử dụng padding hợp lý)
=================
Expanded(
child: Padding(
padding: const EdgeInsets.fromLTRB( 10 , 8 , 10 , 8 ),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
/// Thương hiệu
Text(
product.brandName?.toUpperCase() ?? 'BRAND',
style: const TextStyle(
fontSize: 9 ,
fontWeight: FontWeight.bold,
color: Colors.blueAccent,
letterSpacing: 0.5,
),
maxLines: 1 ,
overflow: TextOverflow.ellipsis,
),
const SizedBox(height: 2 ),
```



```
/// Tiêu đề sản phẩm
Text(
product.title,
maxLines: 2 ,
overflow: TextOverflow.ellipsis,
style: const TextStyle(
fontWeight: FontWeight.w500,
fontSize: 12 ,
height: 1.2,
),
),
```
```
const Spacer(), // Đẩy phần giá và rating xuống đáy
/// Giá sản phẩm
Wrap(
crossAxisAlignment: WrapCrossAlignment.center,
children: [
Text(
"\$${product.price.toStringAsFixed( 0 )}",
style: const TextStyle(
color: Colors.redAccent,
fontWeight: FontWeight.bold,
fontSize: 14 ,
),
),
if (hasDiscount) ...[
const SizedBox(width: 4 ),
Text(
"\$${originalPrice.toStringAsFixed( 0 )}",
style: TextStyle(
decoration: TextDecoration.lineThrough,
color: Colors.grey[ 400 ],
fontSize: 10 ,
),
),
],
],
),
```
```
const SizedBox(height: 4 ),
```
```
/// Đánh giá và Trạng thái giỏ hàng
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Row(
children: [
const Icon(
Icons.star,
size: 12 ,
```



```
color: Colors.orange,
),
const SizedBox(width: 2 ),
Text(
"${product.rating}",
style: TextStyle(
fontSize: 10 ,
color: Colors.grey[ 600 ],
),
),
],
),
```
```
/// Icon Giỏ hàng nhỏ gọn
Obx(() {
final isAdded = cartController.isInCart(
product.id,
null,
);
return isAdded
? const Icon(
Icons.check_circle,
size: 16 ,
color: Colors.green,
)
: const SizedBox.shrink();
}),
],
),
],
),
),
),
],
),
),
);
}
```
```
void _showLoginDialog() {
Get.defaultDialog(
title: "Yêu cầu đăng nhập",
middleText: "Vui lòng đăng nhập để thực hiện chức năng này",
textConfirm: "Đăng nhập",
textCancel: "Hủy",
confirmTextColor: Colors.white,
buttonColor: Colors.blue,
onConfirm: () {
Get.back();
Get.toNamed('/login');
```



### },

### );

### }

### }

## Trong file libs/data/models/product_model.dart, soạn mã nguồn có nội

## dung sau:

```
import 'package:cloud_firestore/cloud_firestore.dart';
```
```
enum ProductType { simple, variable }
```
```
class ProductAttribute {
final String attributeId;
final String name;
final List<String> values;
```
```
ProductAttribute({
required this.attributeId,
required this.name,
required this.values,
});
```
```
factory ProductAttribute.fromMap(Map<String, dynamic> map) {
return ProductAttribute(
attributeId: map['attributeId'] ?? '',
name: map['name'] ?? '',
values: List<String>.from(map['values'] ?? []),
);
}
}
```
```
class ProductModel {
final String id;
final String title;
final String lowerTitle;
final String? description;
```
```
final double price;
final double? salePrice;
```
```
final String thumbnail;
final List<String> images;
```
```
final String? brandId;
final String? brandName;
```
```
final List<String> categoryIds;
final List<String> tags;
```



```
final List<ProductAttribute> attributes;
```
```
final int stock;
final String? sku;
```
```
final ProductType productType;
```
```
final bool isFeatured;
final bool isActive;
final bool isDraft;
final bool isDeleted;
final bool isRecommended;
```
```
final bool? onSale;
final bool? isOutOfStock;
```
```
final double rating;
final int ratingCount;
final int reviewsCount;
```
```
final int oneStarCount;
final int twoStarCount;
final int threeStarCount;
final int fourStarCount;
final int fiveStarCount;
```
```
final int soldQuantity;
final int views;
final int likes;
```
```
final Timestamp? createdAt;
final Timestamp? updatedAt;
```
```
final Timestamp? saleStartDate;
final Timestamp? saleEndDate;
```
```
ProductModel({
required this.id,
required this.title,
required this.lowerTitle,
this.description,
required this.price,
this.salePrice,
required this.thumbnail,
required this.images,
this.brandId,
this.brandName,
required this.categoryIds,
required this.tags,
required this.attributes,
```



```
required this.stock,
this.sku,
required this.productType,
this.isFeatured = false,
this.isActive = true,
this.isDraft = false,
this.isDeleted = false,
this.isRecommended = false,
this.onSale,
this.isOutOfStock,
this.rating = 0 ,
this.ratingCount = 0 ,
this.reviewsCount = 0 ,
this.oneStarCount = 0 ,
this.twoStarCount = 0 ,
this.threeStarCount = 0 ,
this.fourStarCount = 0 ,
this.fiveStarCount = 0 ,
this.soldQuantity = 0 ,
this.views = 0 ,
this.likes = 0 ,
this.createdAt,
this.updatedAt,
this.saleStartDate,
this.saleEndDate,
});
```
```
factory ProductModel.fromSnapshot(DocumentSnapshot doc, String?
brandName) {
final data = doc.data() as Map<String, dynamic>;
```
```
return ProductModel(
id: doc.id,
title: data['title'] ?? '',
lowerTitle: data['lowerTitle'] ?? '',
description: data['description'],
```
```
price: (data['price'] ?? 0 ).toDouble(),
salePrice: data['salePrice'] != null
? (data['salePrice']).toDouble()
: null,
```
```
thumbnail: data['thumbnail'] ?? '',
images: List<String>.from(data['images'] ?? []),
```
```
brandId: data['brandId'],
brandName: brandName,
```
```
categoryIds: List<String>.from(data['categoryIds'] ?? []),
tags: List<String>.from(data['tags'] ?? []),
```



```
attributes:
(data['attributes'] as List<dynamic>?)
?.map((e) => ProductAttribute.fromMap(e as Map<String,
dynamic>))
.toList() ??
[],
```
```
stock: data['stock'] ?? 0 ,
sku: data['sku'],
```
```
productType: data['productType'] == 'variable'
? ProductType.variable
: ProductType.simple,
```
```
isFeatured: data['isFeatured'] ?? false,
isActive: data['isActive'] ?? true,
isDraft: data['isDraft'] ?? false,
isDeleted: data['isDeleted'] ?? false,
isRecommended: data['isRecommended'] ?? false,
```
```
onSale: data['onSale'],
isOutOfStock: data['isOutOfStock'],
```
```
rating: (data['rating'] ?? 0 ).toDouble(),
ratingCount: data['ratingCount'] ?? 0 ,
reviewsCount: data['reviewsCount'] ?? 0 ,
```
```
oneStarCount: data['oneStarCount'] ?? 0 ,
twoStarCount: data['twoStarCount'] ?? 0 ,
threeStarCount: data['threeStarCount'] ?? 0 ,
fourStarCount: data['fourStarCount'] ?? 0 ,
fiveStarCount: data['fiveStarCount'] ?? 0 ,
```
```
soldQuantity: data['soldQuantity'] ?? 0 ,
views: data['views'] ?? 0 ,
likes: data['likes'] ?? 0 ,
```
```
createdAt: data['createdAt'],
updatedAt: data['updatedAt'],
```
```
saleStartDate: data['saleStartDate'],
saleEndDate: data['saleEndDate'],
);
}
}
```
## Trong file libs/data/services/product_service.dart, soạn mã nguồn

## có nội dung sau:




```
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';
```
```
class ProductService {
final FirebaseFirestore _db = FirebaseFirestore.instance;
```
```
Future<List<ProductModel>> getPopularProducts() async {
final snapshot = await _db
.collection('products')
.where('isActive', isEqualTo: true)
.where('isFeatured', isEqualTo: true)
.limit( 6 )
.get();
```
```
List<ProductModel> products = [];
```
```
for (var doc in snapshot.docs) {
final data = doc.data();
String? brandName;
```
```
if (data['brandId'] != null) {
final brandDoc = await _db
.collection('brands')
.doc(data['brandId'])
.get();
```
```
brandName = brandDoc.data()?['name'];
}
```
```
products.add(ProductModel.fromSnapshot(doc, brandName));
}
```
```
return products;
}
```
```
Future<List<ProductModel>> getAllPopularProducts({
String sortBy = "name",
}) async {
// CHỈ FILTER – KHÔNG orderBy ở Firestore
final snapshot = await _db
.collection('products')
.where('isActive', isEqualTo: true)
.where('isFeatured', isEqualTo: true)
.get();
```
```
List<ProductModel> products = [];
```
```
for (var doc in snapshot.docs) {
final data = doc.data() as Map<String, dynamic>;
```



```
String? brandName;
```
```
if (data['brandId'] != null) {
final brandDoc = await _db
.collection('brands')
.doc(data['brandId'])
.get();
brandName = brandDoc.data()?['name'];
}
```
```
products.add(ProductModel.fromSnapshot(doc, brandName));
}
```
### // SORT LOCAL – AN TOÀN 100%

```
if (sortBy == "low_price") {
products.sort((a, b) => a.price.compareTo(b.price));
} else if (sortBy == "high_price") {
products.sort((a, b) => b.price.compareTo(a.price));
} else if (sortBy == "newest") {
// nếu có createdAt thì mới sort
} else {
products.sort(
(a, b) =>
a.title.toLowerCase().compareTo(b.title.toLowerCase()),
);
}
```
```
return products;
}
```
```
Future<List<ProductModel>> getProductsByCategory({
required String categoryId,
}) async {
final snapshot = await _db
.collection('products')
.where('isActive', isEqualTo: true)
.where('categoryIds', arrayContains: categoryId)
.get();
```
```
List<ProductModel> products = [];
```
```
for (var doc in snapshot.docs) {
final data = doc.data() as Map<String, dynamic>;
String? brandName;
```
```
if (data['brandId'] != null) {
final brandDoc = await _db
.collection('brands')
.doc(data['brandId'])
.get();
```



```
brandName = brandDoc.data()?['name'];
}
```
```
products.add(ProductModel.fromSnapshot(doc, brandName));
}
```
```
return products;
}
```
```
Future<List<ProductModel>> getProductsByBrand({
required String brandId,
}) async {
final snapshot = await _db
.collection('products')
.where('isActive', isEqualTo: true)
.where('brandId', isEqualTo: brandId)
.get();
```
```
List<ProductModel> products = [];
```
```
for (var doc in snapshot.docs) {
final data = doc.data() as Map<String, dynamic>;
String? brandName;
```
```
if (data['brandId'] != null) {
final brandDoc = await _db
.collection('brands')
.doc(data['brandId'])
.get();
brandName = brandDoc.data()?['name'];
}
```
```
products.add(ProductModel.fromSnapshot(doc, brandName));
}
```
```
return products;
}
```
```
Future<ProductModel?> getProductById(String productId) async {
final doc = await _db.collection('products').doc(productId).get();
```
```
if (!doc.exists) return null;
```
```
final data = doc.data() as Map<String, dynamic>;
String? brandName;
```
```
if (data['brandId'] != null) {
final brandDoc = await _db
.collection('brands')
.doc(data['brandId'])
```



```
.get();
brandName = brandDoc.data()?['name'];
}
```
```
return ProductModel.fromSnapshot(doc, brandName);
}
}
```
## Trong file libs/controller/product_controller.dart, soạn mã nguồn

## có nội dung sau:

```
import 'package:get/get.dart';
import '../data/models/product_model.dart';
import '../data/services/product_service.dart';
import 'dart:async';
```
```
class ProductController extends GetxController {
final ProductService _service = ProductService();
var products = <ProductModel>[].obs;
var popularProducts = <ProductModel>[].obs;
List<ProductModel> _originalPopularProducts = [];
var isLoading = false.obs;
@override
void onInit() {
fetchPopularProducts();
super.onInit();
}
```
```
Future<void> fetchPopularProducts() async {
try {
isLoading.value = true;
final result = await _service.getPopularProducts();
products.assignAll(result);
} catch (e) {
print("Error loading products: $e");
} finally {
isLoading.value = false;
}
}
```
```
Future<void> fetchAllPopularProducts() async {
try {
isLoading.value = true;
```
```
final result = await _service.getAllPopularProducts();
```
```
_originalPopularProducts = result;
popularProducts.assignAll(result);
```



```
} catch (e) {
print("Error loading popular products: $e");
} finally {
isLoading.value = false;
}
}
```
```
var categoryProducts = <ProductModel>[].obs;
List<ProductModel> _originalCategoryProducts = [];
Future<void> fetchProductsByCategory({required String categoryId})
async {
if (isLoading.value) return; // tránh double call
```
```
try {
isLoading.value = true;
```
```
final result = await _service.getProductsByCategory(
categoryId: categoryId,
);
```
```
_originalCategoryProducts = result;
categoryProducts.assignAll(result);
} catch (e) {
print("Error loading category products: $e");
} finally {
isLoading.value = false;
}
}
```
```
void sortPopularProducts(String sortType) {
List<ProductModel> sorted = List.from(_originalPopularProducts);
```
```
if (sortType == "low_price") {
sorted.sort((a, b) => a.price.compareTo(b.price));
} else if (sortType == "high_price") {
sorted.sort((a, b) => b.price.compareTo(a.price));
} else {
sorted.sort((a, b) => a.title.compareTo(b.title));
}
```
```
popularProducts.assignAll(sorted);
}
```
```
void sortCategoryProducts(String sortType) {
List<ProductModel> sortedList =
List.from(_originalCategoryProducts);
```
```
if (sortType == "low_price") {
sortedList.sort((a, b) => a.price.compareTo(b.price));
} else if (sortType == "high_price") {
```



```
sortedList.sort((a, b) => b.price.compareTo(a.price));
} else {
sortedList.sort((a, b) => a.title.compareTo(b.title));
}
```
```
categoryProducts.assignAll(sortedList);
}
```
```
var selectedProduct = Rxn<ProductModel>();
```
```
Future<void> fetchProductDetail(String productId) async {
try {
isLoading.value = true;
```
```
final result = await _service.getProductById(productId);
```
```
selectedProduct.value = result;
} catch (e) {
print("Error loading product detail: $e");
} finally {
isLoading.value = false;
}
}
```
```
var searchQuery = ''.obs;
var searchResults = <ProductModel>[].obs;
void searchProducts(String query) {
searchQuery.value = query;
```
```
if (query.trim().isEmpty) {
searchResults.clear();
return;
}
```
```
final lowerQuery = query.toLowerCase().trim();
```
```
final results = products.where((product) {
/// ignore inactive / deleted
if (!product.isActive || product.isDeleted) return false;
```
```
/// match title
final matchTitle = product.lowerTitle.contains(lowerQuery);
```
```
/// match brand
final matchBrand =
product.brandName?.toLowerCase().contains(lowerQuery) ??
false;
```
```
/// match tags
final matchTags = product.tags.any(
```



```
(tag) => tag.toLowerCase().contains(lowerQuery),
);
```
```
return matchTitle || matchBrand || matchTags;
}).toList();
```
### /// ===== SORT (RANKING) =====

```
results.sort((a, b) {
/// ưu tiên match ở đầu title
final aStarts = a.lowerTitle.startsWith(lowerQuery);
final bStarts = b.lowerTitle.startsWith(lowerQuery);
```
```
if (aStarts && !bStarts) return - 1 ;
if (!aStarts && bStarts) return 1 ;
```
```
/// ưu tiên sản phẩm bán nhiều
return b.soldQuantity.compareTo(a.soldQuantity);
});
```
```
searchResults.assignAll(results);
}
```
```
Timer? _debounce;
```
```
void onSearchChanged(String query) {
if (_debounce?.isActive ?? false) _debounce!.cancel();
```
```
_debounce = Timer(const Duration(milliseconds: 300 ), () {
searchProducts(query);
});
}
}
```
## Trong file libs/screens/product/product_detail_screen.dart

## , soạn mã nguồn có nội dung sau:

```
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draf_project/controller/cart_controller.dart';
import 'package:draf_project/controller/login_controller.dart';
import 'package:draf_project/data/models/cart_item_model.dart';
import 'package:draf_project/screens/review/write_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/product_controller.dart';
import '../review/review_rating_screen.dart';
import '../../controller/order_controller.dart';
```
```
class ProductDetailScreen extends StatefulWidget {
final String productId;
```



```
const ProductDetailScreen({super.key, required this.productId});
```
```
@override
State<ProductDetailScreen> createState() =>
_ProductDetailScreenState();
}
```
```
class _ProductDetailScreenState extends State<ProductDetailScreen> {
final ProductController controller = Get.find<ProductController>();
final cartController = Get.find<CartController>();
final OrderController orderController = Get.put(OrderController());
```
```
int selectedImageIndex = 0 ;
int quantity = 1 ;
String? selectedImage;
```
```
Map<String, int> selectedAttributes = {};
```
```
@override
void initState() {
super.initState();
WidgetsBinding.instance.addPostFrameCallback((_) async {
await controller.fetchProductDetail(widget.productId);
final product = controller.selectedProduct.value;
if (product != null) {
setState(() {
selectedImage = product.thumbnail;
});
}
});
}
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.white,
body: Obx(() {
if (controller.isLoading.value ||
controller.selectedProduct.value == null) {
return const Center(child: CircularProgressIndicator());
}
```
```
final product = controller.selectedProduct.value!;
final bool isOutOfStock =
product.isOutOfStock == true ||
product.stock <= 0 ||
product.soldQuantity >= product.stock;
```
```
return Stack(
```



```
children: [
/// 1. NỘI DUNG CHI TIẾT (CUỘN)
CustomScrollView(
physics: const BouncingScrollPhysics(),
slivers: [
/// App Bar với hình ảnh sản phẩm
SliverAppBar(
expandedHeight: 400 ,
pinned: true,
stretch: true,
backgroundColor: Colors.white,
leading: Padding(
padding: const EdgeInsets.all(8.0),
child: CircleAvatar(
backgroundColor: Colors.white.withOpacity(0.9),
child: BackButton(color: Colors.blue.shade800),
),
),
flexibleSpace: FlexibleSpaceBar(
background: Stack(
children: [
Positioned.fill(
child: Image.network(
selectedImage ?? product.thumbnail,
fit: BoxFit.cover,
),
),
if (isOutOfStock)
Container(
color: Colors.black.withOpacity(0.4),
child: const Center(
child: Text(
"TẠM HẾT HÀNG",
style: TextStyle(
color: Colors.white,
fontSize: 24 ,
fontWeight: FontWeight.bold,
),
),
),
),
],
),
),
),
```
```
SliverToBoxAdapter(
child: Padding(
padding: const EdgeInsets.all( 20 ),
child: Column(
```



```
crossAxisAlignment: CrossAxisAlignment.start,
children: [
/// THUMBNAILS LIST
_buildThumbnails(product),
```
```
const SizedBox(height: 24 ),
```
```
/// BRAND & RATING ROW
Row(
mainAxisAlignment:
MainAxisAlignment.spaceBetween,
children: [
Row(
children: [
Container(
padding: const EdgeInsets.all( 8 ),
decoration: BoxDecoration(
color: Colors.blue.shade50,
shape: BoxShape.circle,
),
child: Icon(
Icons.store,
color: Colors.blue.shade700,
size: 20 ,
),
),
const SizedBox(width: 8 ),
Text(
product.brandName ?? '',
style: const TextStyle(
fontWeight: FontWeight.bold,
fontSize: 16 ,
),
),
const SizedBox(width: 4 ),
const Icon(
Icons.verified,
color: Colors.blue,
size: 16 ,
),
],
),
_buildRatingBadge(product),
],
),
```
```
const SizedBox(height: 16 ),
```
```
/// TITLE & PRICE
Text(
```



```
product.title,
style: const TextStyle(
fontSize: 22 ,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 8 ),
Text(
"\$${product.price.toStringAsFixed( 0 )}",
style: TextStyle(
fontSize: 28 ,
fontWeight: FontWeight.w900,
color: Colors.blue.shade800,
),
),
```
```
const SizedBox(height: 12 ),
```
### /// STOCK STATUS

```
_buildStockStatus(isOutOfStock),
```
```
const Divider(height: 40 ),
```
```
/// REVIEW ACTIONS (Đồng bộ nút bấm hiện đại)
_buildReviewActionSection(product),
```
```
const SizedBox(height: 10 ),
```
```
/// ATTRIBUTES SELECTOR
...product.attributes.map(
(attribute) =>
_buildAttributeSection(attribute),
),
```
### /// DESCRIPTION

```
const Text(
'Mô tả sản phẩm',
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 18 ,
),
),
const SizedBox(height: 12 ),
Text(
product.description ??
'Không có mô tả cho sản phẩm này.',
style: TextStyle(
color: Colors.grey.shade700,
height: 1.5,
fontSize: 15 ,
```



### ),

### ),

```
const SizedBox(
height: 120 ,
), // Khoảng trống cho Bottom Bar
],
),
),
),
],
),
```
```
/// 2. BOTTOM ACTION BAR (Cố định phía dưới)
if (!isOutOfStock) _buildBottomAction(product),
],
);
}),
);
}
```
```
/// UI Components con để code sạch hơn
```
```
Widget _buildThumbnails(dynamic product) {
return SizedBox(
height: 70 ,
child: ListView(
scrollDirection: Axis.horizontal,
physics: const BouncingScrollPhysics(),
children: [product.thumbnail, ...product.images].map((imageUrl)
{
final isSelected = selectedImage == imageUrl;
return GestureDetector(
onTap: () => setState(() => selectedImage = imageUrl),
child: Container(
margin: const EdgeInsets.only(right: 12 ),
width: 70 ,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular( 12 ),
border: Border.all(
color: isSelected? Colors.blue :
Colors.grey.shade200,
width: 2 ,
),
image: DecorationImage(
image: NetworkImage(imageUrl),
fit: BoxFit.cover,
),
),
),
```



### );

```
}).toList(),
),
);
}
```
```
Widget _buildRatingBadge(dynamic product) {
return GestureDetector(
onTap: () => Get.to(
() => ReviewRatingScreen(
productId: product.id,
rating: product.rating,
reviewCount: product.ratingCount,
),
),
child: Container(
padding: const EdgeInsets.symmetric(horizontal: 10 , vertical:
6 ),
decoration: BoxDecoration(
color: Colors.amber.shade50,
borderRadius: BorderRadius.circular( 20 ),
),
child: Row(
children: [
const Icon(Icons.star, color: Colors.amber, size: 16 ),
const SizedBox(width: 4 ),
Text(
"${product.rating}",
style: const TextStyle(
fontWeight: FontWeight.bold,
color: Colors.orange,
),
),
Text(
" (${product.ratingCount})",
style: TextStyle(color: Colors.orange.shade300, fontSize:
12 ),
),
],
),
),
);
}
```
```
Widget _buildStockStatus(bool isOutOfStock) {
return Container(
padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 6 ),
decoration: BoxDecoration(
color: isOutOfStock? Colors.red.shade50 : Colors.green.shade50,
borderRadius: BorderRadius.circular( 8 ),
```



### ),

```
child: Text(
isOutOfStock? "Tạm hết hàng" : "Đang còn hàng",
style: TextStyle(
color: isOutOfStock? Colors.red : Colors.green,
fontWeight: FontWeight.w600,
fontSize: 12 ,
),
),
);
}
```
```
Widget _buildAttributeSection(dynamic attribute) {
final name = attribute.name;
final values = attribute.values;
selectedAttributes.putIfAbsent(name, () => 0 );
```
```
return Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
name.toUpperCase(),
style: const TextStyle(
fontWeight: FontWeight.bold,
letterSpacing: 1 ,
fontSize: 13 ,
),
),
const SizedBox(height: 12 ),
Wrap(
spacing: 12 ,
runSpacing: 12 ,
children: List.generate(values.length, (index) {
final isSelected = selectedAttributes[name] == index;
return GestureDetector(
onTap: () => setState(() => selectedAttributes[name] =
index),
child: AnimatedContainer(
duration: const Duration(milliseconds: 200 ),
padding: const EdgeInsets.symmetric(
horizontal: 20 ,
vertical: 10 ,
),
decoration: BoxDecoration(
color: isSelected? Colors.blue.shade700 :
Colors.white,
borderRadius: BorderRadius.circular( 12 ),
border: Border.all(
color: isSelected
? Colors.blue.shade700
```



```
: Colors.grey.shade300,
),
boxShadow: isSelected
? [
BoxShadow(
color: Colors.blue.withOpacity(0.3),
blurRadius: 8 ,
offset: const Offset( 0 , 4 ),
),
]
: [],
),
child: Text(
values[index],
style: TextStyle(
color: isSelected? Colors.white : Colors.black87,
fontWeight: isSelected
? FontWeight.bold
: FontWeight.normal,
),
),
),
);
}),
),
const SizedBox(height: 24 ),
],
);
}
```
```
Widget _buildReviewActionSection(dynamic product) {
return FutureBuilder<Map<String, dynamic>>(
future: getReviewState(product.id),
builder: (context, snapshot) {
if (!snapshot.hasData) return const SizedBox();
final data = snapshot.data!;
final state = data["state"];
```
```
if (state == "not_allowed") return const SizedBox.shrink();
```
```
return Padding(
padding: const EdgeInsets.only(bottom: 20 ),
child: OutlinedButton.icon(
onPressed: () {
Get.to(
() => WriteReviewScreen(
product: product,
reviewId: data["reviewId"],
),
);
```



### },

```
style: OutlinedButton.styleFrom(
padding: const EdgeInsets.symmetric(horizontal: 16 ,
vertical: 12 ),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 12 ),
),
side: BorderSide(color: Colors.blue.shade700),
),
icon: Icon(
state == "can_edit"? Icons.edit : Icons.rate_review,
size: 18 ,
),
label: Text(
state == "can_edit"
? "Chỉnh sửa đánh giá"
: "Viết đánh giá sản phẩm",
),
),
);
},
);
}
```
```
Widget _buildBottomAction(dynamic product) {
return Positioned(
bottom: 0 ,
left: 0 ,
right: 0 ,
child: Container(
padding: const EdgeInsets.fromLTRB( 20 , 16 , 20 , 32 ),
decoration: BoxDecoration(
color: Colors.white,
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.05),
blurRadius: 20 ,
offset: const Offset( 0 , - 5 ),
),
],
borderRadius: const BorderRadius.only(
topLeft: Radius.circular( 30 ),
topRight: Radius.circular( 30 ),
),
),
child: Row(
children: [
/// Số lượng
Container(
decoration: BoxDecoration(
```



```
color: Colors.grey.shade100,
borderRadius: BorderRadius.circular( 15 ),
),
child: Row(
children: [
IconButton(
onPressed: () =>
setState(() => quantity > 1? quantity-- :
null),
icon: const Icon(Icons.remove),
),
Text(
quantity.toString(),
style: const TextStyle(
fontSize: 18 ,
fontWeight: FontWeight.bold,
),
),
IconButton(
onPressed: () => setState(() => quantity++),
icon: const Icon(Icons.add),
),
],
),
),
const SizedBox(width: 16 ),
```
```
/// Nút Add to Cart
Expanded(
child: Obx(() {
final selectedVariation = <String, String>{};
product.attributes.forEach((attr) {
final index = selectedAttributes[attr.name] ?? 0 ;
selectedVariation[attr.name] = attr.values[index];
});
final isAdded = cartController.isInCart(
product.id,
selectedVariation,
);
```
```
return ElevatedButton(
onPressed: isAdded
? null
: () {
cartController.addToCart(
CartItemModel(
productId: product.id,
quantity: quantity,
image: selectedImage,
price: product.price,
```



```
title: product.title,
brandName: product.brandName,
selectedVariation: selectedVariation,
),
);
},
style: ElevatedButton.styleFrom(
backgroundColor: Colors.blue.shade700,
foregroundColor: Colors.white,
disabledBackgroundColor: Colors.grey.shade300,
padding: const EdgeInsets.symmetric(vertical: 18 ),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 15 ),
),
elevation: 5 ,
shadowColor: Colors.blue.withOpacity(0.4),
),
child: Text(
isAdded? "ĐÃ Ở TRONG GIỎ" : "THÊM VÀO GIỎ HÀNG",
style: const TextStyle(
fontWeight: FontWeight.bold,
letterSpacing: 1 ,
),
),
);
}),
),
],
),
),
);
}
```
```
// Các hàm xử lý dữ liệu Review giữ nguyên logic của bạn
Future<Map<String, dynamic>> getReviewState(String productId) async {
final orderController = Get.find<OrderController>();
final userId = Get.find<AuthController>().currentUser!.id;
final purchased = await orderController.orderService
.hasUserPurchasedProduct(userId: userId, productId: productId);
if (!purchased) return {"state": "not_allowed"};
final reviewed = await orderController.hasUserReviewedProduct(
userId: userId,
productId: productId,
);
if (reviewed) {
final snapshot = await FirebaseFirestore.instance
.collection('reviews')
.where('productId', isEqualTo: productId)
.where('userId', isEqualTo: userId)
.where('isDeleted', isEqualTo: false)
```



```
.limit( 1 )
.get();
return {"state": "can_edit", "reviewId": snapshot.docs.first.id};
}
return {"state": "can_write"};
}
}
```
## Trong file libs/screens/product/popular_product_screen.dart

## , soạn mã nguồn có nội dung sau:

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/product_card.dart';
import '../../controller/product_controller.dart';
```
```
class PopularProductScreen extends StatefulWidget {
const PopularProductScreen({super.key});
```
```
@override
State<PopularProductScreen> createState() =>
_PopularProductScreenState();
}
```
```
class _PopularProductScreenState extends State<PopularProductScreen> {
final ProductController productController =
Get.find<ProductController>();
```
```
// Biến lưu trữ filter đang chọn
String _selectedFilterKey = 'Name';
```
```
// Map cấu hình filter: Hiển thị -> Giá trị gửi vào Controller
final Map<String, String> _filterMap = {
'Name': 'name',
'Price: Low to High': 'low_price',
'Price: High to Low': 'high_price',
'Newest': 'newest',
};
```
```
@override
void initState() {
super.initState();
// Gọi API lấy sản phẩm sau khi khung hình đầu tiên được dựng
WidgetsBinding.instance.addPostFrameCallback((_) {
productController.fetchAllPopularProducts();
});
}
```



```
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.grey[ 50 ], // Nền xám nhạt đồng bộ
HomeScreen
appBar: AppBar(
title: const Text(
'Sản phẩm phổ biến',
style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18 ),
),
centerTitle: true,
elevation: 0 ,
foregroundColor: Colors.white,
flexibleSpace: Container(
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [Colors.blue.shade700, Colors.blue.shade400],
),
),
),
),
body: Column(
children: [
/// 1. DẢI FILTER SINH ĐỘNG (SCROLLABLE CHIPS)
Container(
width: double.infinity,
padding: const EdgeInsets.symmetric(vertical: 16 ),
decoration: BoxDecoration(
color: Colors.white,
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.03),
blurRadius: 10 ,
offset: const Offset( 0 , 5 ),
),
],
),
child: SingleChildScrollView(
scrollDirection: Axis.horizontal,
padding: const EdgeInsets.symmetric(horizontal: 16 ),
physics: const BouncingScrollPhysics(),
child: Row(
children: _filterMap.keys.map((filterName) {
final isSelected = _selectedFilterKey == filterName;
return Padding(
padding: const EdgeInsets.only(right: 10 ),
child: ChoiceChip(
label: Text(filterName),
```



```
selected: isSelected,
selectedColor: Colors.blue.shade600,
backgroundColor: Colors.grey.shade100,
labelStyle: TextStyle(
color: isSelected? Colors.white :
Colors.black87,
fontWeight: isSelected
? FontWeight.bold
: FontWeight.normal,
fontSize: 13 ,
),
elevation: isSelected? 4 : 0 ,
pressElevation: 2 ,
padding: const EdgeInsets.symmetric(
horizontal: 12 ,
vertical: 8 ,
),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 20 ),
side: BorderSide(
color: isSelected
? Colors.blue.shade600
: Colors.transparent,
),
),
onSelected: (bool selected) {
if (selected) {
setState(() {
_selectedFilterKey = filterName;
});
// Gọi hàm sắp xếp trong controller
productController.sortPopularProducts(
_filterMap[filterName]!,
);
}
},
),
);
}).toList(),
),
),
),
```
```
/// 2. DANH SÁCH SẢN PHẨM
Expanded(
child: Obx(() {
// Trạng thái đang tải dữ liệu
if (productController.isLoading.value) {
return const Center(
child: CircularProgressIndicator(
```



```
valueColor:
AlwaysStoppedAnimation<Color>(Colors.blue),
),
);
}
```
```
// Trạng thái không có dữ liệu
if (productController.popularProducts.isEmpty) {
return Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
Icons.inventory_2_outlined,
size: 80 ,
color: Colors.grey.shade300,
),
const SizedBox(height: 16 ),
Text(
"Không tìm thấy sản phẩm nào",
style: TextStyle(
color: Colors.grey.shade600,
fontSize: 16 ,
),
),
],
),
);
}
```
```
// Hiển thị Grid sản phẩm
return GridView.builder(
padding: const EdgeInsets.all( 16 ),
itemCount: productController.popularProducts.length,
physics: const BouncingScrollPhysics(),
gridDelegate: const
SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2 ,
crossAxisSpacing: 16 , // Tăng khoảng cách cho thoáng
mainAxisSpacing: 16 ,
childAspectRatio:
0.65, // Điều chỉnh tỉ lệ khớp với HomeScreen mới
),
itemBuilder: (context, index) {
final product =
productController.popularProducts[index];
// Có thể bọc thêm Animation ở đây nếu muốn
return ProductCard(product: product);
},
);
```



### }),

### ),

### ],

### ),

### );

### }

### }

## Trong file libs/screens/product/

## product_by_subcategory_screen.dart, soạn mã nguồn có nội dung sau:

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/product_controller.dart';
import '../../common/widgets/product_card.dart';
```
```
class ProductBySubCategoryScreen extends StatefulWidget {
final String categoryId;
final String categoryName;
```
```
const ProductBySubCategoryScreen({
super.key,
required this.categoryId,
required this.categoryName,
});
```
```
@override
State<ProductBySubCategoryScreen> createState() =>
_ProductBySubCategoryScreenState();
}
```
```
class _ProductBySubCategoryScreenState
extends State<ProductBySubCategoryScreen> {
final ProductController productController =
Get.find<ProductController>();
```
```
// Lưu trữ filter đang chọn
String _selectedFilterKey = 'Name';
```
```
// Map cấu hình filter đồng bộ với hệ thống
final Map<String, String> _filterMap = {
'Name': 'name',
'Price: Low to High': 'low_price',
'Price: High to Low': 'high_price',
};
```
```
@override
void initState() {
super.initState();
```



```
// Gọi API lấy sản phẩm theo danh mục sau khi frame đầu tiên được
dựng
WidgetsBinding.instance.addPostFrameCallback((_) {
productController.fetchProductsByCategory(categoryId:
widget.categoryId);
});
}
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.grey[ 50 ], // Nền đồng bộ toàn app
appBar: AppBar(
title: Text(
widget.categoryName,
style: const TextStyle(fontWeight: FontWeight.bold, fontSize:
18 ),
),
centerTitle: true,
elevation: 0 ,
foregroundColor: Colors.white,
flexibleSpace: Container(
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [Colors.blue.shade700, Colors.blue.shade400],
),
),
),
),
body: Column(
children: [
/// 1. DẢI FILTER CUỘN NGANG (DÙNG CHIPS THAY CHO DROPDOWN)
Container(
width: double.infinity,
padding: const EdgeInsets.symmetric(vertical: 16 ),
decoration: BoxDecoration(
color: Colors.white,
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.03),
blurRadius: 10 ,
offset: const Offset( 0 , 5 ),
),
],
),
child: SingleChildScrollView(
scrollDirection: Axis.horizontal,
padding: const EdgeInsets.symmetric(horizontal: 16 ),
```



```
physics: const BouncingScrollPhysics(),
child: Row(
children: _filterMap.keys.map((filterName) {
final isSelected = _selectedFilterKey == filterName;
return Padding(
padding: const EdgeInsets.only(right: 10 ),
child: ChoiceChip(
label: Text(filterName),
selected: isSelected,
selectedColor: Colors.blue.shade600,
backgroundColor: Colors.grey.shade100,
labelStyle: TextStyle(
color: isSelected? Colors.white :
Colors.black87,
fontWeight: isSelected
? FontWeight.bold
: FontWeight.normal,
fontSize: 13 ,
),
elevation: isSelected? 4 : 0 ,
pressElevation: 2 ,
padding: const EdgeInsets.symmetric(
horizontal: 12 ,
vertical: 8 ,
),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 20 ),
side: BorderSide(
color: isSelected
? Colors.blue.shade600
: Colors.transparent,
),
),
onSelected: (bool selected) {
if (selected) {
setState(() {
_selectedFilterKey = filterName;
});
// Thực hiện sắp xếp sản phẩm trong danh mục
productController.sortCategoryProducts(
_filterMap[filterName]!,
);
}
},
),
);
}).toList(),
),
),
),
```



### /// 2. DANH SÁCH SẢN PHẨM (GRID VIEW)

```
Expanded(
child: Obx(() {
// Trạng thái đang tải
if (productController.isLoading.value) {
return const Center(
child: CircularProgressIndicator(
valueColor:
AlwaysStoppedAnimation<Color>(Colors.blue),
),
);
}
```
```
// Trạng thái danh sách trống
if (productController.categoryProducts.isEmpty) {
return Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
Icons.search_off_rounded,
size: 80 ,
color: Colors.grey.shade300,
),
const SizedBox(height: 16 ),
Text(
"Không có sản phẩm nào trong mục này",
style: TextStyle(
color: Colors.grey.shade600,
fontSize: 16 ,
),
),
],
),
);
}
```
```
// Hiển thị Grid sản phẩm
return GridView.builder(
padding: const EdgeInsets.all( 16 ),
itemCount: productController.categoryProducts.length,
physics: const BouncingScrollPhysics(),
gridDelegate: const
SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2 ,
crossAxisSpacing: 16 , // Nhất quán với HomeScreen
mainAxisSpacing: 16 ,
childAspectRatio: 0.65, // Nhất quán với HomeScreen
),
```



```
itemBuilder: (context, index) {
final product =
productController.categoryProducts[index];
return ProductCard(product: product);
},
);
}),
),
],
),
);
}
}
```
## 5) Nhóm file mã nguồn liên quan đến chức năng xem danh mục sản phẩm

## Trong file libs/common/widgets/category_item.dart, soạn mã nguồn có

## nội dung sau:

```
import 'package:flutter/material.dart';
```
```
class CategoryItem extends StatelessWidget {
final IconData icon;
final String title;
final VoidCallback? onTap;
```
```
const CategoryItem({
super.key,
required this.icon,
required this.title,
this.onTap,
});
```
```
@override
Widget build(BuildContext context) {
return GestureDetector(
onTap: onTap,
child: Container(
width: 72 ,
margin: const EdgeInsets.only(right: 12 ),
child: Column(
children: [
CircleAvatar(
radius: 28 ,
backgroundColor: Colors.white,
child: Icon(icon, color: Colors.blue),
),
const SizedBox(height: 6 ),
Text(
title,
```



```
textAlign: TextAlign.center,
style: const TextStyle(color: Colors.white, fontSize: 12 ),
),
],
),
),
);
}
}
```
## Trong file libs/controller/category_controller.dart, soạn mã nguồn

## có nội dung sau:

```
import 'package:get/get.dart';
import '../data/models/category_model.dart';
import '../data/services/category_service.dart';
```
```
class CategoryController extends GetxController {
final CategoryService _service = CategoryService();
```
```
var categories = <CategoryModel>[].obs;
var isLoading = false.obs;
```
```
@override
void onInit() {
fetchCategories();
super.onInit();
}
```
```
Future<void> fetchCategories() async {
try {
isLoading.value = true;
final result = await _service.getAllCategories();
categories.assignAll(result);
} catch (e) {
print("Error fetching categories: $e");
} finally {
isLoading.value = false;
}
}
}
```
## Trong file libs/data/models/category_model.dart, soạn mã nguồn có nội

## dung sau:

```
import 'package:cloud_firestore/cloud_firestore.dart';
```
```
class CategoryModel {
String id;
```



```
String name;
String imageURL;
bool isActive;
bool isFeatured;
int priority;
DateTime? createdAt;
DateTime? updatedAt;
int numberOfProducts;
int viewCount;
String createdBy;
String updatedBy;
```
```
CategoryModel({
required this.id,
required this.name,
required this.imageURL,
required this.isActive,
required this.isFeatured,
required this.priority,
this.createdAt,
this.updatedAt,
required this.numberOfProducts,
required this.viewCount,
required this.createdBy,
required this.updatedBy,
});
```
```
factory CategoryModel.fromSnapshot(DocumentSnapshot doc) {
final data = doc.data() as Map<String, dynamic>;
```
```
return CategoryModel(
id: doc.id,
name: data['name'] ?? '',
imageURL: data['imageURL'] ?? '',
isActive: data['isActive'] ?? true,
isFeatured: data['isFeatured'] ?? false,
priority: data['priority'] ?? 0 ,
createdAt: (data['createdAt'] as Timestamp?)?.toDate(),
updatedAt: (data['updatedAt'] as Timestamp?)?.toDate(),
numberOfProducts: data['numberOfProducts'] ?? 0 ,
viewCount: data['viewCount'] ?? 0 ,
createdBy: data['createdBy'] ?? '',
updatedBy: data['updatedBy'] ?? '',
);
}
}
```
## Trong file libs/data/services/category_service.dart, soạn mã nguồn

## có nội dung sau:




```
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category_model.dart';
```
```
class CategoryService {
final FirebaseFirestore _db = FirebaseFirestore.instance;
```
```
Future<List<CategoryModel>> getAllCategories() async {
final snapshot = await _db
.collection('categories')
.where('isActive', isEqualTo: true)
.orderBy('priority')
.limit( 10 )
.get();
```
```
return snapshot.docs.map((doc) =>
CategoryModel.fromSnapshot(doc)).toList();
}
}
```
## 6) Nhóm file mã nguồn liên quan đến chức năng xem và đánh giá sản phẩm

## Trong file libs/data/models/product_review_model.dart, soạn mã

## nguồn có nội dung sau:

```
import 'package:cloud_firestore/cloud_firestore.dart';
```
```
class ReviewModel {
final String id;
final String productId;
final String productName;
final String productImage;
final String title;
final String userId;
final String userName;
final String? userProfileImage;
```
```
final double rating;
final String reviewText;
```
```
final List<String> mediaUrls;
```
```
final DateTime createdAt;
final DateTime updatedAt;
```
```
final bool isApproved;
```
```
ReviewModel({
required this.id,
required this.productId,
```



```
required this.productName,
required this.productImage,
required this.userId,
required this.userName,
required this.title,
this.userProfileImage,
required this.rating,
required this.reviewText,
required this.mediaUrls,
required this.createdAt,
required this.updatedAt,
required this.isApproved,
});
```
```
factory ReviewModel.fromSnapshot(DocumentSnapshot doc) {
final data = doc.data() as Map<String, dynamic>;
```
```
return ReviewModel(
id: doc.id,
productId: data['productId'],
productName: data['productName'],
productImage: data['productImage'],
userId: data['userId'],
userName: data['userName'],
title: data['title'],
userProfileImage: data['userProfileImage'],
rating: (data['rating'] ?? 0 ).toDouble(),
reviewText: data['reviewText'] ?? '',
mediaUrls: List<String>.from(data['mediaUrls'] ?? []),
createdAt: (data['createdAt'] as Timestamp).toDate(),
updatedAt: (data['updatedAt'] as Timestamp).toDate(),
isApproved: data['isApproved'] ?? false,
);
}
```
```
Map<String, dynamic> toJson() {
return {
'productId': productId,
'productName': productName,
'productImage': productImage,
'userId': userId,
'userName': userName,
'userProfileImage': userProfileImage,
'rating': rating,
'reviewText': reviewText,
'mediaUrls': mediaUrls,
'createdAt': createdAt,
'updatedAt': updatedAt,
'isApproved': isApproved,
};
```



### }

### }

## Trong terminal, sinh viên chạy lệnh sau: flutter pub add timeago

## Trong file libs/screens/review/write_review_screen.dart, soạn mã

## nguồn có nội dung sau:

```
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/product_model.dart';
import '../../controller/login_controller.dart';
```
```
class WriteReviewScreen extends StatefulWidget {
final ProductModel product;
final String? reviewId;
```
```
const WriteReviewScreen({super.key, required this.product,
this.reviewId});
```
```
@override
State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}
```
```
class _WriteReviewScreenState extends State<WriteReviewScreen> {
double rating = 5 ;
final TextEditingController reviewController =
TextEditingController();
final TextEditingController titleController = TextEditingController();
final auth = Get.find<AuthController>();
List<String> mediaUrls = [];
bool isLoading = false;
```
```
@override
void initState() {
super.initState();
if (widget.reviewId != null) {
loadExistingReview();
}
}
```
```
Future<void> loadExistingReview() async {
setState(() => isLoading = true);
try {
final doc = await FirebaseFirestore.instance
.collection('reviews')
.doc(widget.reviewId)
.get();
```



```
if (doc.exists) {
final data = doc.data()!;
setState(() {
rating = (data['rating'] ?? 5 ).toDouble();
titleController.text = data['title'] ?? "";
reviewController.text = data['reviewText'] ?? '';
mediaUrls = List<String>.from(data['mediaUrls'] ?? []);
});
}
} catch (e) {
Get.snackbar("Error", "Could not load review data");
} finally {
setState(() => isLoading = false);
}
}
```
```
Future<void> submitReview() async {
final user = auth.currentUser;
if (user == null) {
Get.snackbar("Error", "You must be logged in to write a review");
return;
}
```
```
// Validation
if (titleController.text.trim().isEmpty) {
Get.snackbar(
"Required",
"Please enter a headline for your review",
snackPosition: SnackPosition.BOTTOM,
backgroundColor: Colors.redAccent,
colorText: Colors.white,
);
return;
}
```
```
if (reviewController.text.trim().isEmpty) {
Get.snackbar(
"Required",
"Please write some details about your experience",
snackPosition: SnackPosition.BOTTOM,
backgroundColor: Colors.redAccent,
colorText: Colors.white,
);
return;
}
```
```
setState(() => isLoading = true);
```
```
try {
final reviewData = {
```



```
'productId': widget.product.id,
'productName': widget.product.title,
'productImage': widget.product.thumbnail,
'userId': user.id,
'userName': "${user.firstName} ${user.lastName}",
```
```
'rating': rating,
'title': titleController.text.trim(),
'reviewText': reviewController.text.trim(),
'mediaUrls': mediaUrls,
'updatedAt': Timestamp.now(),
'isApproved': false, // Cần admin duyệt lại khi sửa hoặc tạo mới
'isDeleted': false,
};
```
```
if (widget.reviewId == null) {
// Thêm mới
await FirebaseFirestore.instance.collection('reviews').add({
...reviewData,
'createdAt': Timestamp.now(),
});
} else {
// Cập nhật
await FirebaseFirestore.instance
.collection('reviews')
.doc(widget.reviewId)
.update(reviewData);
}
```
```
// Lưu ý: updateProductRating chỉ tính toán dựa trên các review đã
IS_APPROVED = TRUE
await updateProductRating();
```
```
Get.back();
Get.snackbar(
"Success",
"Your review has been submitted for approval",
snackPosition: SnackPosition.BOTTOM,
backgroundColor: Colors.green,
colorText: Colors.white,
);
} catch (e) {
Get.snackbar("Error", e.toString());
} finally {
setState(() => isLoading = false);
}
}
```
```
Future<void> updateProductRating() async {
final snapshot = await FirebaseFirestore.instance
```



```
.collection('reviews')
.where('productId', isEqualTo: widget.product.id)
.where('isApproved', isEqualTo: true)
.where('isDeleted', isEqualTo: false)
.get();
```
```
double total = 0 ;
for (var doc in snapshot.docs) {
total += (doc['rating'] ?? 0 ).toDouble();
}
```
```
final count = snapshot.docs.length;
final avg = count == 0? 0.0 : total / count;
```
```
await FirebaseFirestore.instance
.collection('products')
.doc(widget.product.id)
.update({'rating': avg, 'ratingCount': count});
}
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.white,
appBar: AppBar(
title: Text(
widget.reviewId == null? "Write Review" : "Edit Review",
style: const TextStyle(
color: Colors.black,
fontWeight: FontWeight.bold,
),
),
backgroundColor: Colors.white,
elevation: 0.5,
iconTheme: const IconThemeData(color: Colors.black),
),
body: isLoading
? const Center(child: CircularProgressIndicator())
: SingleChildScrollView(
padding: const EdgeInsets.all( 20 ),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
/// PRODUCT INFO SUMMARY
Row(
children: [
ClipRRect(
borderRadius: BorderRadius.circular( 8 ),
child: Image.network(
widget.product.thumbnail,
```



```
width: 60 ,
height: 60 ,
fit: BoxFit.cover,
),
),
const SizedBox(width: 12 ),
Expanded(
child: Text(
widget.product.title,
style: const TextStyle(
fontSize: 16 ,
fontWeight: FontWeight.w500,
),
maxLines: 2 ,
overflow: TextOverflow.ellipsis,
),
),
],
),
```
```
const Padding(
padding: EdgeInsets.symmetric(vertical: 20 ),
child: Divider(),
),
```
### /// STAR RATING PICKER

```
const Center(
child: Text(
"How would you rate it?",
style: TextStyle(
fontSize: 18 ,
fontWeight: FontWeight.bold,
),
),
),
const SizedBox(height: 8 ),
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: List.generate( 5 , (index) {
return GestureDetector(
onTap: () => setState(() => rating = index +
1.0),
child: Icon(
index < rating
? Icons.star_rounded
: Icons.star_outline_rounded,
size: 48 ,
color: Colors.amber,
),
);
```



### }),

### ),

```
const SizedBox(height: 30 ),
```
### /// INPUT FIELDS

```
const Text(
"Add a headline",
style: TextStyle(fontWeight: FontWeight.bold),
),
const SizedBox(height: 8 ),
TextField(
controller: titleController,
decoration: InputDecoration(
hintText: "What's most important to know?",
filled: true,
fillColor: Colors.grey.shade50,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular( 12 ),
borderSide: BorderSide(color:
Colors.grey.shade300),
),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular( 12 ),
borderSide: BorderSide(color:
Colors.grey.shade200),
),
),
),
```
```
const SizedBox(height: 20 ),
```
```
const Text(
"Write your review",
style: TextStyle(fontWeight: FontWeight.bold),
),
const SizedBox(height: 8 ),
TextField(
controller: reviewController,
maxLines: 5 ,
decoration: InputDecoration(
hintText: "What did you like or dislike?",
filled: true,
fillColor: Colors.grey.shade50,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular( 12 ),
borderSide: BorderSide(color:
Colors.grey.shade300),
),
enabledBorder: OutlineInputBorder(
```



```
borderRadius: BorderRadius.circular( 12 ),
borderSide: BorderSide(color:
Colors.grey.shade200),
),
),
),
```
```
const SizedBox(height: 25 ),
```
### /// MEDIA SECTION

```
const Text(
"Add Photos",
style: TextStyle(fontWeight: FontWeight.bold),
),
const SizedBox(height: 10 ),
SizedBox(
height: 90 ,
child: ListView(
scrollDirection: Axis.horizontal,
children: [
// Button to add
GestureDetector(
onTap: _showAddImageDialog,
child: Container(
width: 90 ,
height: 90 ,
decoration: BoxDecoration(
color: Colors.grey.shade100,
borderRadius: BorderRadius.circular( 12 ),
border: Border.all(
color: Colors.grey.shade300,
style: BorderStyle.solid,
),
),
child: const Icon(
Icons.add_a_photo_outlined,
color: Colors.grey,
),
),
),
const SizedBox(width: 10 ),
// List of images
...mediaUrls.map(
(url) => Padding(
padding: const EdgeInsets.only(right: 10 ),
child: Stack(
children: [
ClipRRect(
borderRadius:
BorderRadius.circular( 12 ),
```



```
child: Image.network(
url,
width: 90 ,
height: 90 ,
fit: BoxFit.cover,
),
),
Positioned(
right: 4 ,
top: 4 ,
child: GestureDetector(
onTap: () =>
setState(() =>
mediaUrls.remove(url)),
child: Container(
decoration: const BoxDecoration(
color: Colors.black54,
shape: BoxShape.circle,
),
child: const Icon(
Icons.close,
color: Colors.white,
size: 18 ,
),
),
),
),
],
),
),
),
],
),
),
```
```
const SizedBox(height: 40 ),
```
### /// SUBMIT BUTTON

```
SizedBox(
width: double.infinity,
height: 55 ,
child: ElevatedButton(
onPressed: submitReview,
style: ElevatedButton.styleFrom(
backgroundColor: Colors.black,
foregroundColor: Colors.white,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 15 ),
),
elevation: 0 ,
```



### ),

```
child: Text(
widget.reviewId == null
? "Submit Review"
: "Update Review",
style: const TextStyle(
fontSize: 16 ,
fontWeight: FontWeight.bold,
),
),
),
),
const SizedBox(height: 20 ),
],
),
),
);
}
```
```
void _showAddImageDialog() {
final urlController = TextEditingController();
showDialog(
context: context,
builder: (_) => AlertDialog(
shape: RoundedRectangleBorder(borderRadius:
BorderRadius.circular( 20 )),
title: const Text("Add Image Link"),
content: TextField(
controller: urlController,
autofocus: true,
decoration: const InputDecoration(
hintText: "Paste image URL here...",
border: UnderlineInputBorder(),
),
),
actions: [
TextButton(
onPressed: () => Navigator.pop(context),
child: const Text("Cancel"),
),
ElevatedButton(
onPressed: () {
if (urlController.text.trim().isNotEmpty) {
setState(() =>
mediaUrls.add(urlController.text.trim()));
}
Navigator.pop(context);
},
child: const Text("Add"),
),
```



### ],

### ),

### );

### }

### }

## Trong file libs/screens/review/review_rating_screen.dart, soạn mã

## nguồn có nội dung sau:

```
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
```
```
class ReviewRatingScreen extends StatelessWidget {
final String productId;
final double rating;
final int reviewCount;
```
```
const ReviewRatingScreen({
super.key,
required this.productId,
required this.rating,
required this.reviewCount,
});
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(
0xFFF8F9FA,
), // Nền xám rất nhạt cực kỳ sang trọng
appBar: AppBar(
title: const Text(
'Đánh giá sản phẩm',
style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18 ),
),
centerTitle: true,
elevation: 0 ,
foregroundColor: Colors.white,
flexibleSpace: Container(
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [Colors.blue.shade700, Colors.blue.shade400],
),
),
),
),
```



```
body: SingleChildScrollView(
physics: const BouncingScrollPhysics(),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
/// 1. TỔNG QUAN RATING (NHẤT QUÁN VỚI CARD CỦA HOME)
Container(
margin: const EdgeInsets.all( 16 ),
padding: const EdgeInsets.all( 24 ),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 20 ),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.04),
blurRadius: 20 ,
offset: const Offset( 0 , 10 ),
),
],
),
child: _buildRatingOverview(),
),
```
```
const Padding(
padding: EdgeInsets.symmetric(horizontal: 20 , vertical:
8 ),
child: Text(
"Nhận xét từ khách hàng",
style: TextStyle(
fontSize: 18 ,
fontWeight: FontWeight.bold,
color: Color(0xFF2D2D2D),
),
),
),
```
```
/// 2. DANH SÁCH REVIEW
Padding(
padding: const EdgeInsets.symmetric(horizontal: 16 ),
child: _buildReviewList(),
),
```
```
const SizedBox(height: 30 ),
],
),
),
);
}
```
### // ================= OVERVIEW SECTION =================




```
Widget _buildRatingOverview() {
return Row(
children: [
// Cột trái: Điểm trung bình
Expanded(
flex: 2 ,
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text(
rating.toStringAsFixed( 1 ),
style: const TextStyle(
fontSize: 52 ,
fontWeight: FontWeight.w800,
color: Color(0xFF2D3436),
letterSpacing: - 1 ,
),
),
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: List.generate(
5 ,
(index) => Icon(
index < rating.round()
? Icons.star_rounded
: Icons.star_outline_rounded,
size: 20 ,
color: Colors.amber,
),
),
),
const SizedBox(height: 8 ),
Text(
'$reviewCount đánh giá',
style: TextStyle(
color: Colors.grey.shade500,
fontSize: 13 ,
fontWeight: FontWeight.w500,
),
),
],
),
),
```
```
// Đường kẻ dọc
Container(
height: 80 ,
width: 1 ,
color: Colors.grey.shade100,
margin: const EdgeInsets.symmetric(horizontal: 15 ),
```



### ),

```
// Cột phải: Tiến trình sao
Expanded(
flex: 3 ,
child: StreamBuilder<QuerySnapshot>(
stream: FirebaseFirestore.instance
.collection('reviews')
.where('productId', isEqualTo: productId)
.where('isDeleted', isEqualTo: false)
.snapshots(),
builder: (context, snapshot) {
if (!snapshot.hasData) return const SizedBox();
```
```
final docs = snapshot.data!.docs;
final total = docs.length;
Map<int, int> counts = { 5 : 0 , 4 : 0 , 3 : 0 , 2 : 0 , 1 : 0 };
```
```
for (var doc in docs) {
int r = (doc['rating'] ?? 0 ).toInt();
if (r >= 1 && r <= 5 ) counts[r] = (counts[r] ?? 0 ) + 1 ;
}
```
```
return Column(
children: [ 5 , 4 , 3 , 2 , 1 ].map((star) {
return Padding(
padding: const EdgeInsets.symmetric(vertical: 2 ),
child: _StarProgressRow(
star: star,
value: total == 0? 0 : (counts[star]! / total),
),
);
}).toList(),
);
},
),
),
],
);
}
```
### // ================= REVIEW LIST SECTION =================

```
Widget _buildReviewList() {
final currentUserId = FirebaseAuth.instance.currentUser?.uid;
```
```
return StreamBuilder<QuerySnapshot>(
stream: FirebaseFirestore.instance
.collection('reviews')
.where('productId', isEqualTo: productId)
.where('isDeleted', isEqualTo: false)
```



```
.orderBy('createdAt', descending: true)
.snapshots(),
builder: (context, snapshot) {
if (snapshot.connectionState == ConnectionState.waiting) {
return const Center(
child: Padding(
padding: EdgeInsets.all( 40 ),
child: CircularProgressIndicator(),
),
);
}
```
```
final docs = snapshot.data?.docs ?? [];
```
```
if (docs.isEmpty) {
return Center(
child: Column(
children: [
const SizedBox(height: 60 ),
Container(
padding: const EdgeInsets.all( 20 ),
decoration: BoxDecoration(
color: Colors.white,
shape: BoxShape.circle,
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.03),
blurRadius: 10 ,
),
],
),
child: Icon(
Icons.rate_review_outlined,
size: 50 ,
color: Colors.grey.shade300,
),
),
const SizedBox(height: 16 ),
Text(
"Chưa có đánh giá nào.\nHãy là người đầu tiên nhận
xét!",
textAlign: TextAlign.center,
style: TextStyle(color: Colors.grey.shade500, height:
1.5),
),
],
),
);
}
```



```
return ListView.separated(
shrinkWrap: true,
padding: const EdgeInsets.only(top: 10 ),
physics: const NeverScrollableScrollPhysics(),
itemCount: docs.length,
separatorBuilder: (context, index) => const SizedBox(height:
16 ),
itemBuilder: (context, index) {
final data = docs[index].data() as Map<String, dynamic>;
final isApproved = data['isApproved'] ?? false;
final userId = data['userId'];
final isOwner = userId == currentUserId;
```
```
if (!isApproved && !isOwner) {
return const SizedBox.shrink();
}
```
```
return _ReviewItem(
reviewId: docs[index].id,
isOwner: isOwner,
isApproved: isApproved,
userName: data['userName'] ?? 'Người dùng',
title: data['title'] ?? '',
rating: (data['rating'] ?? 0 ).toDouble(),
reviewText: data['reviewText'] ?? '',
mediaUrls: List<String>.from(data['mediaUrls'] ?? []),
createdAt: (data['createdAt'] as Timestamp).toDate(),
userImage: data['userProfileImage'],
);
},
);
},
);
}
}
```
```
// ================= COMPONENT: STAR PROGRESS ROW =================
class _StarProgressRow extends StatelessWidget {
final int star;
final double value;
```
```
const _StarProgressRow({required this.star, required this.value});
```
```
@override
Widget build(BuildContext context) {
return Row(
children: [
SizedBox(
width: 10 ,
child: Text(
```



```
'$star',
style: const TextStyle(
fontSize: 11 ,
fontWeight: FontWeight.bold,
color: Colors.black54,
),
),
),
const SizedBox(width: 4 ),
const Icon(Icons.star_rounded, size: 14 , color: Colors.amber),
const SizedBox(width: 8 ),
Expanded(
child: Container(
height: 6 ,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular( 10 ),
color: Colors.grey.shade100,
),
child: FractionallySizedBox(
alignment: Alignment.centerLeft,
widthFactor: value,
child: Container(
decoration: BoxDecoration(
borderRadius: BorderRadius.circular( 10 ),
gradient: LinearGradient(
colors: [Colors.amber, Colors.amber.shade300],
),
),
),
),
),
),
],
);
}
}
```
### // ================= COMPONENT: REVIEW ITEM =================

```
class _ReviewItem extends StatelessWidget {
final String reviewId;
final bool isOwner;
final bool isApproved;
final String userName;
final String title;
final double rating;
final String reviewText;
final List<String> mediaUrls;
final DateTime createdAt;
final String? userImage;
```



```
const _ReviewItem({
required this.reviewId,
required this.isOwner,
required this.isApproved,
required this.title,
required this.userName,
required this.rating,
required this.reviewText,
required this.createdAt,
required this.mediaUrls,
this.userImage,
});
```
```
@override
Widget build(BuildContext context) {
return Container(
padding: const EdgeInsets.all( 20 ),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 20 ),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.03),
blurRadius: 15 ,
offset: const Offset( 0 , 5 ),
),
],
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
/// HEADER
Row(
children: [
Container(
decoration: BoxDecoration(
shape: BoxShape.circle,
border: Border.all(color: Colors.blue.shade50, width:
2 ),
),
child: CircleAvatar(
radius: 22 ,
backgroundColor: Colors.blue.shade50,
backgroundImage: userImage != null
? NetworkImage(userImage!)
: null,
child: userImage == null
? Icon(Icons.person, color: Colors.blue.shade200)
: null,
),
```



### ),

```
const SizedBox(width: 12 ),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
userName,
style: const TextStyle(
fontWeight: FontWeight.bold,
fontSize: 16 ,
),
),
Text(
timeago.format(createdAt),
style: TextStyle(
fontSize: 12 ,
color: Colors.grey.shade400,
),
),
],
),
),
if (isOwner)
IconButton(
onPressed: () => _confirmDelete(context),
icon: Icon(
Icons.delete_outline_rounded,
color: Colors.red.shade300,
size: 22 ,
),
),
],
),
```
```
const SizedBox(height: 16 ),
```
### /// RATING

```
Row(
children: List.generate(
5 ,
(index) => Icon(
index < rating
? Icons.star_rounded
: Icons.star_outline_rounded,
size: 18 ,
color: Colors.amber,
),
),
),
```



```
const SizedBox(height: 12 ),
```
```
/// CONTENT
if (title.isNotEmpty)
Padding(
padding: const EdgeInsets.only(bottom: 6 ),
child: Text(
title,
style: const TextStyle(
fontWeight: FontWeight.w700,
fontSize: 16 ,
color: Color(0xFF2D3436),
),
),
),
Text(
reviewText,
style: TextStyle(
height: 1.6,
color: Colors.grey.shade700,
fontSize: 14 ,
),
),
```
```
const SizedBox(height: 16 ),
```
```
/// MEDIA GRID
if (mediaUrls.isNotEmpty)
SizedBox(
height: 100 ,
child: ListView.separated(
scrollDirection: Axis.horizontal,
physics: const BouncingScrollPhysics(),
itemCount: mediaUrls.length,
separatorBuilder: (_, __) => const SizedBox(width: 12 ),
itemBuilder: (context, index) {
return ClipRRect(
borderRadius: BorderRadius.circular( 12 ),
child: Image.network(
mediaUrls[index],
width: 100 ,
height: 100 ,
fit: BoxFit.cover,
),
);
},
),
),
```



### /// FOOTER

```
const SizedBox(height: 16 ),
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
if (isOwner && !isApproved)
Container(
padding: const EdgeInsets.symmetric(
horizontal: 12 ,
vertical: 6 ,
),
decoration: BoxDecoration(
color: Colors.orange.shade50,
borderRadius: BorderRadius.circular( 12 ),
),
child: const Text(
"⏳ Đang chờ duyệt",
style: TextStyle(
color: Colors.orange,
fontSize: 11 ,
fontWeight: FontWeight.bold,
),
),
)
else
const SizedBox(),
```
```
Material(
color: Colors.transparent,
child: InkWell(
onTap: () {},
borderRadius: BorderRadius.circular( 8 ),
child: Padding(
padding: const EdgeInsets.symmetric(
horizontal: 8 ,
vertical: 4 ,
),
child: Row(
children: [
Icon(
Icons.thumb_up_alt_outlined,
size: 16 ,
color: Colors.grey.shade500,
),
const SizedBox(width: 6 ),
Text(
"Hữu ích",
style: TextStyle(
color: Colors.grey.shade500,
fontSize: 13 ,
```



```
fontWeight: FontWeight.w500,
),
),
],
),
),
),
),
],
),
],
),
);
}
```
```
void _confirmDelete(BuildContext context) {
showDialog(
context: context,
builder: (context) => AlertDialog(
shape: RoundedRectangleBorder(borderRadius:
BorderRadius.circular( 20 )),
title: const Text("Xóa đánh giá?"),
content: const Text("Bạn có chắc chắn muốn xóa phản hồi này
không?"),
actions: [
TextButton(
onPressed: () => Navigator.pop(context),
child: const Text("Hủy", style: TextStyle(color:
Colors.grey)),
),
ElevatedButton(
onPressed: () async {
await FirebaseFirestore.instance
.collection('reviews')
.doc(reviewId)
.update({'isDeleted': true, 'updatedAt':
Timestamp.now()});
Navigator.pop(context);
},
style: ElevatedButton.styleFrom(
backgroundColor: Colors.redAccent,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 10 ),
),
elevation: 0 ,
),
child: const Text("Xác nhận xóa"),
),
],
),
```



### );

### }

### }

## 7) Nhóm file mã nguồn liên quan đến giao diện và chức năng ở trang chủ

## Trong file libs/screens/home/home_screen.dart, soạn mã nguồn có nội

## dung sau:

```
import 'package:draf_project/controller/cart_controller.dart';
import 'package:draf_project/controller/notification_controller.dart';
import
'package:draf_project/screens/notifications/my_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Đảm bảo đã thêm GetX
import '../../common/widgets/home_banner_slider.dart';
```
```
import '../../common/widgets/product_card.dart';
```
```
import '/screens/product/product_by_subcategory_screen.dart';
import '../cart/cart_overview_screen.dart';
import '../product/popular_product_screen.dart';
import 'package:draf_project/controller/login_controller.dart';
import 'package:draf_project/controller/category_controller.dart';
import 'package:draf_project/controller/product_controller.dart';
```
```
class HomeScreen extends StatelessWidget {
HomeScreen({super.key});
final CategoryController categoryController =
Get.put(CategoryController());
final ProductController productController =
Get.put(ProductController());
```
```
final cartController = Get.find<CartController>();
@override
Widget build(BuildContext context) {
// Sử dụng GetBuilder để bọc bên ngoài Scaffold
return GetBuilder<AuthController>(
builder: (authController) {
// Logic lấy tên user từ controller
final user = authController.currentUser;
String fullName = 'Guest User';
```
```
if (user != null) {
fullName = '${user.firstName} ${user.lastName}';
}
```
```
return Scaffold(
```



```
body: Column(
children: [
/// TOP BLUE HEADER
Container(
padding: const EdgeInsets.all( 24 ),
decoration: const BoxDecoration(
color: Colors.blue,
borderRadius: BorderRadius.only(
bottomLeft: Radius.circular( 24 ),
bottomRight: Radius.circular( 24 ),
),
),
child: SafeArea(
bottom: false,
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
children: [
Column(
crossAxisAlignment:
CrossAxisAlignment.start,
children: [
const Text(
'Good day for shopping',
style: TextStyle(color: Colors.white70),
),
const SizedBox(height: 4 ),
Text(
fullName, //Đã thay bằng tên động
style: const TextStyle(
color: Colors.white,
fontSize: 20 ,
fontWeight: FontWeight.bold,
),
),
],
),
const Spacer(),
```
```
/// Notification Icon
/// Chỉ hiện chuông khi đã login
if (authController.currentUser != null)
Obx(() {
final notificationController =
Get.find<NotificationController>();
```
```
return Stack(
children: [
IconButton(
```



```
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) =>
MyNotificationScreen(),
),
);
},
icon: const Icon(
Icons.notifications,
color: Colors.white,
),
),
```
```
if
(notificationController.unreadCount.value >
0 )
Positioned(
right: 6 ,
top: 6 ,
child: Container(
padding: const
EdgeInsets.all( 4 ),
decoration: const BoxDecoration(
color: Colors.red,
shape: BoxShape.circle,
),
child: Text(
notificationController
.unreadCount
.value
.toString(),
style: const TextStyle(
color: Colors.white,
fontSize: 10 ,
),
),
),
),
],
);
}),
Obx(
() => Stack(
children: [
IconButton(
onPressed: () {
Navigator.push(
context,
```



```
MaterialPageRoute(
builder: (_) =>
const CartOverviewScreen(),
),
);
},
icon: const Icon(
Icons.shopping_cart,
color: Colors.white,
),
),
```
```
if (cartController.totalItems > 0 )
Positioned(
right: 6 ,
top: 6 ,
child: Container(
padding: const EdgeInsets.all( 4 ),
decoration: const BoxDecoration(
color: Colors.red,
shape: BoxShape.circle,
),
child: Text(
cartController.totalItems.toStri
ng(),
style: const TextStyle(
color: Colors.white,
fontSize: 10 ,
),
),
),
),
],
),
),
],
),
const SizedBox(height: 16 ),
TextField(
onChanged: (value) {
productController.onSearchChanged(value);
},
decoration: InputDecoration(
hintText: 'Tìm kiếm trong cửa hàng',
prefixIcon: const Icon(Icons.search),
filled: true,
fillColor: Colors.white,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular( 12 ),
borderSide: BorderSide.none,
```



### ),

### ),

### ),

```
const SizedBox(height: 16 ),
const Text(
'Danh mục phổ biến',
style: TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 12 ),
SizedBox(
height: 90 ,
child: Obx(() {
if (categoryController.isLoading.value) {
return const Center(
child: CircularProgressIndicator(),
);
}
```
```
return ListView.builder(
scrollDirection: Axis.horizontal,
itemCount:
categoryController.categories.length,
itemBuilder: (context, index) {
final category =
categoryController.categories[index];
```
```
return Padding(
padding: const EdgeInsets.only(right:
12 ),
child: GestureDetector(
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) =>
ProductBySubCategoryScreen(
categoryId: category.id,
categoryName:
category.name,
),
),
);
},
child: Column(
children: [
CircleAvatar(
radius: 30 ,
```



```
backgroundImage: NetworkImage(
category.imageURL,
),
),
const SizedBox(height: 6 ),
Text(
category.name,
style: const TextStyle(
color: Colors.white,
fontSize: 12 ,
),
),
],
),
),
);
},
);
}),
),
],
),
),
),
```
### /// CONTENT

```
Expanded(
child: Obx(() {
/// ================= SEARCH MODE =================
if (productController.searchQuery.isNotEmpty) {
if (productController.searchResults.isEmpty) {
return const Center(
child: Text("Không tìm thấy sản phẩm"),
);
}
```
```
return GridView.builder(
padding: const EdgeInsets.all( 16 ),
itemCount: productController.searchResults.length,
gridDelegate:
const
SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2 ,
crossAxisSpacing: 12 ,
mainAxisSpacing: 12 ,
childAspectRatio: 0.58,
),
itemBuilder: (context, index) {
final product =
productController.searchResults[index];
```



```
return ProductCard(product: product);
},
);
}
```
### /// ================= NORMAL MODE =================

```
return SingleChildScrollView(
padding: const EdgeInsets.all( 16 ),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const HomeBannerSlider(),
const SizedBox(height: 24 ),
Row(
children: [
const Text(
'Sản phẩm phổ biến',
style: TextStyle(
fontSize: 18 ,
fontWeight: FontWeight.bold,
),
),
const Spacer(),
TextButton(
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (_) =>
const PopularProductScreen(),
),
);
},
child: const Text('Xem tất cả'),
),
],
),
const SizedBox(height: 16 ),
```
```
/// PRODUCTS
Obx(() {
if (productController.isLoading.value) {
return const Center(
child: CircularProgressIndicator(),
);
}
```
```
return GridView.builder(
itemCount:
productController.products.length,
```



```
shrinkWrap: true,
physics: const
NeverScrollableScrollPhysics(),
gridDelegate:
const
SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2 ,
crossAxisSpacing: 12 ,
mainAxisSpacing: 12 ,
childAspectRatio: 0.58,
),
itemBuilder: (context, index) {
final product =
productController.products[index];
```
```
return ProductCard(product: product);
},
);
}),
],
),
);
}),
),
],
),
);
},
);
}
}
```
## 12. Thiết kế và phát triển nhóm chức năng quản lý đơn hàng của người dùng

## Trong file libs/controller/order_controller.dart, cập nhật mã nguồn có nội

## dung sau:

```
import 'dart:math';
```
```
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draf_project/controller/cart_controller.dart';
import 'package:draf_project/controller/login_controller.dart';
import 'package:draf_project/data/models/address_model.dart';
import 'package:draf_project/data/models/cart_item_model.dart';
import 'package:draf_project/data/models/coupon_model.dart';
import 'package:draf_project/data/models/order_model.dart';
import 'package:draf_project/data/services/order_service.dart';
import 'package:draf_project/screens/order/order_success_screen.dart';
import 'package:get/get.dart';
```



```
class OrderController extends GetxController {
/// ================= CONTROLLER =================
final cart = Get.find<CartController>();
final auth = Get.find<AuthController>();
```
### /// ================= STATE =================

```
RxList<CartItemModel> items = <CartItemModel>[].obs;
```
```
RxDouble subTotal = 0.0.obs;
RxDouble tax = 0.0.obs;
RxDouble shippingFee = 0.0.obs;
RxDouble discountAmount = 0.0.obs;
```
```
Rxn<CouponModel> coupon = Rxn<CouponModel>();
```
```
Rxn<AddressModel> selectedAddress = Rxn<AddressModel>();
```
```
RxList<AddressModel> addresses = <AddressModel>[].obs;
```
```
RxString phone = "".obs;
```
```
RxString paymentMethod = "cash".obs; // cash | bank
```
```
/// ================= INIT =================
void loadFromCart() {
items.assignAll(cart.cartItems);
```
```
subTotal.value = items.fold( 0 , (sum, e) => sum + (e.price * e.quantity));
```
```
_calculateTax();
}
```
```
void _calculateTax() {
tax.value = subTotal.value * 0.1;
}
```
### /// ================= SHIPPING =================

```
Future<void> calculateShipping(double distanceKm) async {
shippingFee.value = distanceKm * 5000 ; // 5k/km
}
```
### /// ================= COUPON =================

```
Future<void> applyCoupon(String code) async {
try {
final snapshot = await FirebaseFirestore.instance
.collection('coupons')
.where('code', isEqualTo: code.trim())
.get();
```



```
if (snapshot.docs.isEmpty) {
Get.snackbar("Error", "Coupon không tồn tại");
return;
}
```
```
final doc = snapshot.docs.first;
final data = doc.data();
```
```
final c = CouponModel.fromJson({
...data,
'id': doc.id, // 🔥 FIX
});
final now = DateTime.now();
```
### /// ===== VALIDATE =====

```
if (!c.isActive) {
Get.snackbar("Error", "Coupon chưa active");
return;
}
```
```
if (c.startDate != null && now.isBefore(c.startDate!)) {
Get.snackbar("Error", "Chưa tới ngày sử dụng");
return;
}
```
```
if (c.endDate != null && now.isAfter(c.endDate!)) {
Get.snackbar("Error", "Coupon đã hết hạn");
return;
}
```
```
if (c.usageLimit != - 1 && c.usageCount >= c.usageLimit) {
Get.snackbar("Error", "Coupon đã hết lượt");
return;
}
```
```
/// ===== CALCULATE DISCOUNT =====
double discount = 0 ;
```
```
if (c.discountType == DiscountType.percentage) {
discount = subTotal.value * c.discountValue / 100 ;
} else {
discount = c.discountValue;
}
```
```
/// 🔥 QUAN TRỌNG: set coupon
coupon.value = c;
discountAmount.value = discount;
```
```
Get.snackbar("Success", "Áp dụng coupon thành công");
} catch (e) {
```



```
Get.snackbar("Error", "Lỗi coupon: $e");
}
}
```
```
/// ================= TOTAL =================
double get total {
return subTotal.value +
tax.value +
shippingFee.value -
discountAmount.value;
}
```
```
/// ================= ADDRESS =================
Future<void> fetchAddresses() async {
phone.value = auth.currentUser?.phone ?? "";
```
```
final snapshot = await FirebaseFirestore.instance
.collection('users')
.doc(auth.currentUser!.id)
.collection('addresses')
.get();
```
```
addresses.value = snapshot.docs
.map((e) => AddressModel.fromMap(e.id, e.data()))
.toList();
}
```
```
void selectAddress(AddressModel address) {
selectedAddress.value = address;
}
```
```
/// ================= CREATE ORDER =================
Future<void> createOrder() async {
final int shipping = cart.cartItems.length;
if (selectedAddress.value == null) {
Get.snackbar("Error", "Vui lòng chọn địa chỉ");
return;
}
```
```
try {
final totalAmount = total;
```
```
final order = OrderModel(
docId: '',
id: DateTime.now().millisecondsSinceEpoch.toString(),
userId: auth.currentUser!.id,
userDeviceToken: '',
```
```
products: items,
```



```
subTotal: subTotal.value,
shippingAmount: shipping,
```
```
taxRate: 0.1,
taxAmount: tax.value,
```
### /// 🔥 FIX COUPON

```
coupon: coupon.value,
couponDiscountAmount: discountAmount.value,
```
```
pointsUsed: 0 ,
pointsDiscountAmount: 0 ,
totalDiscountAmount: discountAmount.value,
```
```
totalAmount: totalAmount,
```
```
paymentStatus: "pending",
orderStatus: "created",
orderDate: DateTime.now(),
```
```
shippingAddress: selectedAddress.value!.toMap(),
```
```
activities: [],
itemCount: items.length,
```
```
createdAt: DateTime.now(),
updatedAt: DateTime.now(),
```
```
/// 🔥 FIX PAYMENT
paymentMethod: paymentMethod.value,
paymentMethodType: paymentMethod.value == "bank"
? PaymentMethods.bank
: PaymentMethods.cash,
);
```
```
await
FirebaseFirestore.instance.collection('orders').add(order.toJson());
```
### /// 🔥 UPDATE SOLD QUANTITY

```
await updateSoldQuantityAfterOrder();
```
```
/// 🔥 TĂNG usage coupon
await increaseCouponUsage();
```
```
/// CLEAR CART
cart.cartItems.clear();
```
```
Get.offAll(() => const OrderSuccessScreen());
} catch (e) {
Get.snackbar("Error", "Tạo đơn thất bại: $e");
```



### }

### }

### /// ================= COUPON USAGE =================

```
Future<void> increaseCouponUsage() async {
if (coupon.value == null) return;
```
```
final snapshot = await FirebaseFirestore.instance
.collection('coupons')
.where('code', isEqualTo: coupon.value!.code)
.get();
```
```
if (snapshot.docs.isEmpty) return;
```
```
final docId = snapshot.docs.first.id;
```
```
await
FirebaseFirestore.instance.collection('coupons').doc(docId).update({
'usageCount': FieldValue.increment( 1 ),
});
}
```
### /// ================= DISTANCE =================

```
double calculateDistanceKm(
double lat1,
double lon1,
double lat2,
double lon2,
) {
const R = 6371 ;
```
```
final dLat = _deg2rad(lat2 - lat1);
final dLon = _deg2rad(lon2 - lon1);
```
```
final a =
sin(dLat / 2 ) * sin(dLat / 2 ) +
cos(_deg2rad(lat1)) *
cos(_deg2rad(lat2)) *
sin(dLon / 2 ) *
sin(dLon / 2 );
```
```
final c = 2 * atan2(sqrt(a), sqrt( 1 - a));
```
```
return R * c;
}
```
```
double _deg2rad(double deg) => deg * (pi / 180 );
///////==================
```
```
RxList<OrderModel> myOrders = <OrderModel>[].obs;
```



```
RxBool isLoadingOrders = false.obs;
final orderService = OrderService();
Future<void> fetchMyOrders() async {
try {
isLoadingOrders.value = true;
```
```
final userId = auth.currentUser!.id;
```
```
final orders = await orderService.getOrdersByUser(userId);
```
```
myOrders.assignAll(orders);
} catch (e) {
Get.snackbar("Error", "Không load được orders: $e");
} finally {
isLoadingOrders.value = false;
}
}
```
```
Future<void> cancelOrder(String orderId) async {
await
FirebaseFirestore.instance.collection("orders").doc(orderId).update({
"orderStatus": "cancelled",
"updatedAt": DateTime.now(),
});
}
```
```
Future<bool> canReviewProduct(String productId) async {
final userId = auth.currentUser!.id;
```
```
// 1. đã mua + delivered
final purchased = await orderService.hasUserPurchasedProduct(
userId: userId,
productId: productId,
);
```
```
if (!purchased) return false;
```
```
// 2. đã review chưa
final alreadyReviewed = await hasUserReviewedProduct(
userId: userId,
productId: productId,
);
```
```
return !alreadyReviewed;
}
```
```
Future<bool> hasUserReviewedProduct({
required String userId,
required String productId,
}) async {
```



```
final snapshot = await FirebaseFirestore.instance
.collection('reviews')
.where('userId', isEqualTo: userId)
.where('productId', isEqualTo: productId)
.where('isDeleted', isEqualTo: false)
.get();
```
```
return snapshot.docs.isNotEmpty;
}
```
```
Future<void> updateSoldQuantityAfterOrder() async {
final firestore = FirebaseFirestore.instance;
```
```
for (var item in items) {
final docRef = firestore.collection('products').doc(item.productId);
```
```
await firestore.runTransaction((transaction) async {
final snapshot = await transaction.get(docRef);
```
```
if (!snapshot.exists) return;
```
```
final data = snapshot.data()!;
```
```
final int currentSold = data['soldQuantity'] ?? 0 ;
final int stock = data['stock'] ?? 0 ;
```
```
final int newSold = currentSold + item.quantity;
```
```
final bool isOutOfStock = newSold >= stock;
```
```
transaction.update(docRef, {
'soldQuantity': newSold,
'isOutOfStock': isOutOfStock,
});
});
}
}
```
```
Future<void> revertSoldQuantity(OrderModel order) async {
for (var item in order.products) {
await FirebaseFirestore.instance
.collection('products')
.doc(item.productId)
.update({'soldQuantity': FieldValue.increment(-item.quantity)});
}}}
```
## Trong file libs/data/models/order_model.dart, cập nhật mã nguồn có nội dung

## sau:

```
import 'cart_item_model.dart';
```



```
import 'coupon_model.dart';
import 'shipping_model.dart';
```
```
enum PaymentMethods { cash, bank }
```
```
class OrderModel {
String docId;
String id;
String userId;
```
```
String userName;
String userEmail;
```
```
String userDeviceToken;
```
```
List<CartItemModel> products;
```
```
double subTotal;
int shippingAmount;
```
```
double taxRate;
double taxAmount;
```
```
CouponModel? coupon;
```
```
double couponDiscountAmount;
```
```
int pointsUsed;
double pointsDiscountAmount;
```
```
double totalDiscountAmount;
double totalAmount;
```
```
String paymentStatus;
String orderStatus;
```
```
DateTime orderDate;
DateTime? shippingDate;
```
```
Map<String, dynamic> shippingAddress;
Map<String, dynamic>? billingAddress;
```
```
ShippingInfo? shippingInfo;
```
```
List<dynamic> activities;
```
```
int itemCount;
```
```
DateTime createdAt;
DateTime updatedAt;
```



```
String adminNote;
```
```
bool billingAddressSameAsShipping;
```
```
String currency;
```
```
String? paymentIntentId;
String? paymentMethodId;
```
```
String paymentMethod;
PaymentMethods paymentMethodType;
```
```
double amountCaptured;
```
```
OrderModel({
required this.docId,
required this.id,
required this.userId,
this.userName = '',
this.userEmail = '',
required this.userDeviceToken,
required this.products,
required this.subTotal,
required this.shippingAmount,
required this.taxRate,
required this.taxAmount,
this.coupon,
required this.couponDiscountAmount,
required this.pointsUsed,
required this.pointsDiscountAmount,
required this.totalDiscountAmount,
required this.totalAmount,
required this.paymentStatus,
required this.orderStatus,
required this.orderDate,
this.shippingDate,
required this.shippingAddress,
this.billingAddress,
this.shippingInfo,
required this.activities,
required this.itemCount,
required this.createdAt,
required this.updatedAt,
this.adminNote = '',
this.billingAddressSameAsShipping = true,
this.currency = 'usd',
this.paymentIntentId,
this.paymentMethodId,
this.paymentMethod = '',
```



```
this.paymentMethodType = PaymentMethods.cash,
this.amountCaptured = 0.0,
});
```
```
Map<String, dynamic> toJson() {
return {
'id': id,
'userId': userId,
```
```
'products': products.map((e) => e.toJson()).toList(),
```
```
'subTotal': subTotal,
'shippingAmount': shippingAmount,
```
```
'taxRate': taxRate,
'taxAmount': taxAmount,
```
### /// FIX COUPON

```
'coupon': coupon != null? coupon!.toJson() : null,
'couponDiscountAmount': couponDiscountAmount,
```
```
'totalDiscountAmount': totalDiscountAmount,
```
```
'totalAmount': totalAmount,
```
```
'paymentStatus': paymentStatus,
'orderStatus': orderStatus,
```
```
'orderDate': orderDate,
'shippingDate': shippingDate,
```
```
'shippingAddress': shippingAddress,
```
```
'itemCount': itemCount,
```
```
'createdAt': createdAt,
'updatedAt': updatedAt,
```
### ///FIX PAYMENT

```
'paymentMethod': paymentMethod,
'paymentMethodType': paymentMethodType.name,
};
}
```
```
factory OrderModel.fromJson(Map<String, dynamic> json) {
return OrderModel(
docId: json['docId'] ?? '',
id: json['id'],
userId: json['userId'],
userDeviceToken: '',
```



```
products: (json['products'] as List)
.map((e) => CartItemModel.fromJson(e))
.toList(),
```
```
subTotal: (json['subTotal'] ?? 0 ).toDouble(),
shippingAmount: json['shippingAmount'] ?? 0 ,
```
```
taxRate: (json['taxRate'] ?? 0 ).toDouble(),
taxAmount: (json['taxAmount'] ?? 0 ).toDouble(),
```
```
coupon: json['coupon'] != null
? CouponModel.fromJson(json['coupon'])
: null,
```
```
couponDiscountAmount: (json['couponDiscountAmount'] ?? 0 ).toDouble(),
```
```
pointsUsed: 0 ,
pointsDiscountAmount: 0 ,
```
```
totalDiscountAmount: (json['totalDiscountAmount'] ?? 0 ).toDouble(),
```
```
totalAmount: (json['totalAmount'] ?? 0 ).toDouble(),
```
```
paymentStatus: json['paymentStatus'],
orderStatus: json['orderStatus'],
```
```
orderDate: json['orderDate'].toDate(),
```
### /// 🔥 FIX QUAN TRỌNG

```
shippingDate: json['shippingDate'] != null
? json['shippingDate'].toDate()
: null,
```
```
shippingAddress: json['shippingAddress'],
```
```
activities: [],
```
```
itemCount: json['itemCount'] ?? 0 ,
```
```
createdAt: json['createdAt'].toDate(),
updatedAt: json['updatedAt'].toDate(),
```
```
paymentMethod: json['paymentMethod'] ?? '',
paymentMethodType: json['paymentMethodType'] == 'bank'
? PaymentMethods.bank
: PaymentMethods.cash,
);
}
```



### }

## Trong file libs/data/models/coupon_model.dart, cập nhật mã nguồn có nội dung

## sau:

```
import 'package:cloud_firestore/cloud_firestore.dart';
```
```
enum DiscountType { percentage, fixed }
```
```
class CouponModel {
String id;
String code;
String description;
```
```
DiscountType discountType;
double discountValue;
```
```
DateTime? startDate;
DateTime? endDate;
```
```
int usageLimit;
int usageCount;
```
```
bool isActive;
```
```
DateTime? createdAt;
DateTime? updateAt;
```
```
CouponModel({
required this.id,
required this.code,
this.description = '',
this.discountType = DiscountType.percentage,
required this.discountValue,
this.startDate,
this.endDate,
this.usageLimit = - 1 ,
this.usageCount = 0 ,
this.isActive = true,
this.createdAt,
this.updateAt,
});
```
```
Map<String, dynamic> toJson() {
return {
'id': id,
'code': code,
'description': description,
'discountType': discountType.name,
```



```
'discountValue': discountValue,
'startDate': startDate != null? Timestamp.fromDate(startDate!) : null,
'endDate': endDate != null? Timestamp.fromDate(endDate!) : null,
'usageLimit': usageLimit,
'usageCount': usageCount,
'isActive': isActive,
'createdAt': createdAt != null? Timestamp.fromDate(createdAt!) : null,
'updateAt': updateAt != null? Timestamp.fromDate(updateAt!) : null,
};
}
```
```
factory CouponModel.fromJson(Map<String, dynamic> json) {
return CouponModel(
id: json['id'],
code: json['code'],
description: json['description'] ?? '',
discountType: json['discountType'] == 'percentage'
? DiscountType.percentage
: DiscountType.fixed,
discountValue: (json['discountValue'] ?? 0 ).toDouble(),
startDate: json['startDate']?.toDate(),
endDate: json['endDate']?.toDate(),
usageLimit: json['usageLimit'] ?? - 1 ,
usageCount: json['usageCount'] ?? 0 ,
isActive: json['isActive'] ?? true,
createdAt: json['createdAt']?.toDate(),
updateAt: json['updateAt']?.toDate(),
);
}
}
```
## Trong file libs/data/models/shipping_model.dart, cập nhật mã nguồn có nội

## dung sau:

```
class ShippingInfo {
String carrier;
String trackingNumber;
String shippingStatus;
String shippingMethod;
```
```
DateTime? estimatedDelivery;
DateTime? deliveredAt;
```
```
ShippingInfo({
required this.carrier,
required this.trackingNumber,
required this.shippingStatus,
required this.shippingMethod,
this.estimatedDelivery,
```



```
this.deliveredAt,
});
```
```
Map<String, dynamic> toJson() {
return {
'carrier': carrier,
'trackingNumber': trackingNumber,
'shippingStatus': shippingStatus,
'shippingMethod': shippingMethod,
'estimatedDelivery': estimatedDelivery,
'deliveredAt': deliveredAt,
};
}
```
```
factory ShippingInfo.fromJson(Map<String, dynamic> json) {
return ShippingInfo(
carrier: json['carrier'],
trackingNumber: json['trackingNumber'],
shippingStatus: json['shippingStatus'],
shippingMethod: json['shippingMethod'],
estimatedDelivery: json['estimatedDelivery']?.toDate(),
deliveredAt: json['deliveredAt']?.toDate(),
);
}
}
```
## Trong file libs/data/services/order_service.dart, cập nhật mã nguồn có nội

## dung sau:

```
import 'package:cloud_firestore/cloud_firestore.dart';
```
```
import '../models/order_model.dart';
```
```
class OrderService {
final _db = FirebaseFirestore.instance;
```
```
Future<void> createOrder(OrderModel order) async {
await _db.collection('orders').add({
'id': order.id,
'userId': order.userId,
'total': order.totalAmount,
'status': order.orderStatus,
'createdAt': DateTime.now(),
});
}
```
```
Future<List<OrderModel>> getOrdersByUser(String userId) async {
final snapshot = await _db
.collection('orders')
```



```
.where('userId', isEqualTo: userId)
.orderBy('createdAt', descending: true)
.get();
```
```
return snapshot.docs.map((doc) {
final data = doc.data();
return OrderModel.fromJson({...data, 'docId': doc.id});
}).toList();
}
```
```
Future<bool> hasUserPurchasedProduct({
required String userId,
required String productId,
}) async {
final snapshot = await _db
.collection('orders')
.where('userId', isEqualTo: userId)
.where('orderStatus', isEqualTo: 'delivered') // 🔥 ONLY delivered
.get();
```
```
for (var doc in snapshot.docs) {
final data = doc.data();
```
```
if (data['products'] == null) continue;
```
```
final List products = data['products'];
```
```
for (var item in products) {
if (item['productId'] == productId) {
return true;
}
}
}
```
```
return false;
}
}
```
## Trong file libs/screens/order/my_order_screen.dart, cập nhật mã nguồn có

## nội dung sau:

```
import 'package:draf_project/screens/order/ordered_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/order_controller.dart';
```
```
class MyOrderScreen extends StatefulWidget {
const MyOrderScreen({super.key});
```



```
@override
State<MyOrderScreen> createState() => _MyOrderScreenState();
}
```
```
class _MyOrderScreenState extends State<MyOrderScreen> {
final controller = Get.put(OrderController());
final TextEditingController searchController = TextEditingController();
final RxString selectedFilter = "all".obs;
```
```
@override
void initState() {
super.initState();
controller.fetchMyOrders();
}
```
```
// Logic lọc đơn hàng
List get filteredOrders {
var orders = controller.myOrders;
```
```
/// LỌC THEO TRẠNG THÁI
if (selectedFilter.value != "all") {
orders = orders
.where(
(o) =>
o.orderStatus.toLowerCase() ==
selectedFilter.value.toLowerCase(),
)
.toList()
.obs;
}
```
```
/// TÌM KIẾM THEO MÃ ĐƠN HÀNG
if (searchController.text.isNotEmpty) {
orders = orders
.where(
(o) => o.id.toString().toLowerCase().contains(
searchController.text.toLowerCase(),
),
)
.toList()
.obs;
}
```
```
return orders;
}
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.grey[ 50 ], // Đồng bộ màu nền ứng dụng
```



```
body: Column(
children: [
/// 1. CUSTOM HEADER VỚI GRADIENT (NHẤT QUÁN VỚI HOME)
Container(
width: double.infinity,
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [Colors.blue.shade700, Colors.blue.shade400],
),
borderRadius: const BorderRadius.only(
bottomLeft: Radius.circular( 30 ),
bottomRight: Radius.circular( 30 ),
),
),
child: SafeArea(
child: Column(
children: [
AppBar(
title: const Text(
'Đơn hàng của tôi',
style: TextStyle(
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
centerTitle: true,
backgroundColor: Colors.transparent,
elevation: 0 ,
iconTheme: const IconThemeData(color: Colors.white),
),
_buildSearchBar(),
const SizedBox(height: 20 ),
],
),
),
),
```
```
/// 2. HỆ THỐNG FILTER CHIPS
_buildFilterBar(),
```
### /// 3. DANH SÁCH ĐƠN HÀNG

```
Expanded(
child: Obx(() {
if (controller.isLoadingOrders.value) {
return const Center(child: CircularProgressIndicator());
}
```
```
return filteredOrders.isEmpty
```



```
? _buildEmpty()
: ListView.builder(
padding: const EdgeInsets.fromLTRB( 16 , 10 , 16 , 20 ),
physics: const BouncingScrollPhysics(),
itemCount: filteredOrders.length,
itemBuilder: (context, index) {
final order = filteredOrders[index];
return _OrderHistoryCard(
orderCode: "#${order.id.toString().toUpperCase()}",
status: order.orderStatus,
orderDate: _formatDate(order.orderDate),
deliveryDate: order.shippingDate != null
? _formatDate(order.shippingDate!)
: "Đang xử lý",
total: order.totalAmount,
onTap: () {
Get.to(() => OrderDetailScreen(order: order));
},
);
},
);
}),
),
],
),
);
}
```
```
/// THANH TÌM KIẾM MODERN
Widget _buildSearchBar() {
return Padding(
padding: const EdgeInsets.symmetric(horizontal: 20 ),
child: Container(
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 15 ),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.1),
blurRadius: 10 ,
offset: const Offset( 0 , 5 ),
),
],
),
child: TextField(
controller: searchController,
onChanged: (_) => setState(() {}),
decoration: InputDecoration(
hintText: "Tìm mã đơn hàng (ví dụ: 123...)",
hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14 ),
```



```
prefixIcon: const Icon(Icons.search, color: Colors.blue),
border: InputBorder.none,
contentPadding: const EdgeInsets.symmetric(vertical: 15 ),
),
),
),
);
}
```
### /// THANH LỌC TRẠNG THÁI (SCROLLABLE CHIPS)

```
Widget _buildFilterBar() {
final filters = {
"all": "Tất cả",
"created": "Chờ xem xét",
"processing": "Đang xử lý",
"shipped": "Vận chuyển",
"delivered": "Đã giao",
"cancelled": "Đã hủy",
"returned": "Hoàn trả",
};
```
```
return Container(
height: 60 ,
padding: const EdgeInsets.symmetric(vertical: 12 ),
child: ListView(
scrollDirection: Axis.horizontal,
padding: const EdgeInsets.symmetric(horizontal: 16 ),
physics: const BouncingScrollPhysics(),
children: filters.entries.map((entry) {
return Obx(() {
final isSelected = selectedFilter.value == entry.key;
return Padding(
padding: const EdgeInsets.only(right: 8 ),
child: ChoiceChip(
label: Text(entry.value),
selected: isSelected,
onSelected: (val) => selectedFilter.value = entry.key,
selectedColor: Colors.blue.shade600,
backgroundColor: Colors.white,
labelStyle: TextStyle(
color: isSelected? Colors.white : Colors.blue.shade700,
fontWeight: FontWeight.w600,
fontSize: 13 ,
),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 20 ),
side: BorderSide(color: Colors.blue.shade100),
),
elevation: isSelected? 3 : 0 ,
),
```



### );

### });

```
}).toList(),
),
);
}
```
```
Widget _buildEmpty() {
return Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
Icons.assignment_outlined,
size: 80 ,
color: Colors.grey.shade300,
),
const SizedBox(height: 16 ),
Text(
"Không tìm thấy đơn hàng nào",
style: TextStyle(fontSize: 16 , color: Colors.grey.shade600),
),
],
),
);
}
```
```
String _formatDate(DateTime date) {
return "${date.day.toString().padLeft( 2 ,
'0')}/${date.month.toString().padLeft( 2 , '0')}/${date.year}";
}
}
```
### /// ================= HIỂN THỊ CARD ĐƠN HÀNG =================

```
class _OrderHistoryCard extends StatelessWidget {
final String orderCode;
final String status;
final String orderDate;
final String deliveryDate;
final double total;
final VoidCallback onTap;
```
```
const _OrderHistoryCard({
required this.orderCode,
required this.status,
required this.orderDate,
required this.deliveryDate,
required this.total,
required this.onTap,
```



### });

```
@override
Widget build(BuildContext context) {
Color statusColor;
IconData statusIcon;
String statusText;
```
```
switch (status.toLowerCase()) {
case 'delivered':
statusColor = Colors.green;
statusIcon = Icons.check_circle_outline;
statusText = "Đã giao";
break;
case 'processing':
statusColor = Colors.blue;
statusIcon = Icons.hourglass_empty;
statusText = "Đang xử lý";
break;
case 'shipped':
statusColor = Colors.orange;
statusIcon = Icons.local_shipping_outlined;
statusText = "Đang giao";
break;
case 'created':
statusColor = Colors.amber.shade700;
statusIcon = Icons.pending_actions;
statusText = "Chờ duyệt";
break;
case 'cancelled':
statusColor = Colors.red;
statusIcon = Icons.cancel_outlined;
statusText = "Đã hủy";
break;
case 'returned':
statusColor = Colors.purple;
statusIcon = Icons.assignment_return_outlined;
statusText = "Hoàn trả";
break;
default:
statusColor = Colors.grey;
statusIcon = Icons.help_outline;
statusText = status;
}
```
```
return GestureDetector(
onTap: onTap,
child: Container(
margin: const EdgeInsets.only(bottom: 16 ),
decoration: BoxDecoration(
```



```
color: Colors.white,
borderRadius: BorderRadius.circular( 20 ),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.04),
blurRadius: 15 ,
offset: const Offset( 0 , 6 ),
),
],
),
child: Column(
children: [
/// Phần Header của Card
Container(
padding: const EdgeInsets.symmetric(horizontal: 16 , vertical:
12 ),
decoration: BoxDecoration(
color: statusColor.withOpacity(0.08),
borderRadius: const BorderRadius.only(
topLeft: Radius.circular( 20 ),
topRight: Radius.circular( 20 ),
),
),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(
orderCode,
style: const TextStyle(
fontWeight: FontWeight.bold,
fontSize: 16 ,
),
),
Container(
padding: const EdgeInsets.symmetric(
horizontal: 10 ,
vertical: 4 ,
),
decoration: BoxDecoration(
color: statusColor,
borderRadius: BorderRadius.circular( 12 ),
),
child: Row(
children: [
Icon(statusIcon, size: 14 , color: Colors.white),
const SizedBox(width: 4 ),
Text(
statusText,
style: const TextStyle(
color: Colors.white,
```



```
fontSize: 11 ,
fontWeight: FontWeight.bold,
),
),
],
),
),
],
),
),
```
```
/// Phần Body của Card
Padding(
padding: const EdgeInsets.all( 16 ),
child: Column(
children: [
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
_buildInfoTile(
"Ngày đặt",
orderDate,
Icons.calendar_month,
),
_buildInfoTile(
"Ngày giao",
deliveryDate,
Icons.local_shipping,
),
],
),
const Padding(
padding: EdgeInsets.symmetric(vertical: 12 ),
child: Divider(height: 1 , thickness: 0.5),
),
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
const Text(
"Tổng cộng",
style: TextStyle(
color: Colors.grey,
fontWeight: FontWeight.w500,
),
),
Text(
'\$${total.toStringAsFixed( 0 )}',
style: TextStyle(
fontSize: 20 ,
fontWeight: FontWeight.w900,
```



```
color: statusColor == Colors.red
? Colors.red
: Colors.blue.shade900,
),
),
],
),
],
),
),
],
),
),
);
}
```
```
Widget _buildInfoTile(String label, String value, IconData icon) {
return Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
children: [
Icon(icon, size: 14 , color: Colors.grey),
const SizedBox(width: 4 ),
Text(
label,
style: const TextStyle(fontSize: 12 , color: Colors.grey),
),
],
),
const SizedBox(height: 4 ),
Text(
value,
style: const TextStyle(fontSize: 14 , fontWeight: FontWeight.bold),
),
],
);
}
}
```
## Trong file libs/screens/order/order_overview_screen.dart, cập nhật mã

## nguồn có nội dung sau:

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
```
```
import '../../controller/order_controller.dart';
import '../../controller/cart_controller.dart';
```
```
class OrderReviewScreen extends StatefulWidget {
```



```
const OrderReviewScreen({super.key});
```
```
@override
State<OrderReviewScreen> createState() => _OrderReviewScreenState();
}
```
```
class _OrderReviewScreenState extends State<OrderReviewScreen> {
// Khởi tạo controller
final OrderController controller = Get.put(OrderController());
final CartController cart = Get.find<CartController>();
final TextEditingController couponController = TextEditingController();
```
```
@override
void initState() {
super.initState();
// Gọi dữ liệu một lần duy nhất khi vào màn hình
WidgetsBinding.instance.addPostFrameCallback((_) {
controller.loadFromCart();
controller.fetchAddresses();
});
}
```
```
@override
void dispose() {
couponController.dispose();
super.dispose();
}
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.grey[ 50 ], // Nền xám nhạt đồng bộ toàn app
appBar: AppBar(
title: const Text(
"Kiểm tra đơn hàng",
style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18 ),
),
centerTitle: true,
elevation: 0 ,
foregroundColor: Colors.white,
flexibleSpace: Container(
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [Colors.blue.shade700, Colors.blue.shade400],
),
),
),
leading: const BackButton(),
```



### ),

```
body: Obx(
() => Column(
children: [
Expanded(
child: ListView(
padding: const EdgeInsets.all( 16 ),
physics: const BouncingScrollPhysics(),
children: [
/// 1. DANH SÁCH SẢN PHẨM
_buildSectionTitle("Sản phẩm trong đơn"),
Container(
margin: const EdgeInsets.only(top: 8 , bottom: 20 ),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 16 ),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.03),
blurRadius: 10 ,
offset: const Offset( 0 , 5 ),
),
],
),
child: Column(
children: controller.items.asMap().entries.map((entry)
{
final index = entry.key;
final item = entry.value;
return Column(
children: [
ListTile(
contentPadding: const EdgeInsets.symmetric(
horizontal: 16 ,
vertical: 8 ,
),
leading: Container(
decoration: BoxDecoration(
borderRadius: BorderRadius.circular( 12 ),
border: Border.all(
color: Colors.grey.shade100,
),
),
child: ClipRRect(
borderRadius: BorderRadius.circular( 12 ),
child: Image.network(
item.image ?? "",
width: 60 ,
height: 60 ,
fit: BoxFit.cover,
```



```
errorBuilder:
(context, error, stackTrace) =>
const Icon(
Icons.image_not_supported,
size: 30 ,
),
),
),
),
title: Row(
children: [
Expanded(
child: Text(
item.brandName ?? "Thương hiệu",
style: TextStyle(
fontWeight: FontWeight.bold,
color: Colors.blue.shade700,
fontSize: 13 ,
),
),
),
const Icon(
Icons.verified,
size: 14 ,
color: Colors.blue,
),
],
),
subtitle: Padding(
padding: const EdgeInsets.only(top: 4 ),
child: Text(
item.title ?? "Tên sản phẩm",
style: const TextStyle(
color: Colors.black87,
fontWeight: FontWeight.w500,
),
maxLines: 1 ,
overflow: TextOverflow.ellipsis,
),
),
trailing: const Icon(
Icons.check_circle,
color: Colors.green,
size: 20 ,
),
),
if (index != controller.items.length - 1 )
Divider(
height: 1 ,
indent: 16 ,
```



```
endIndent: 16 ,
color: Colors.grey.shade100,
),
],
);
}).toList(),
),
),
```
### /// 2. NHẬP MÃ GIẢM GIÁ

```
_buildSectionTitle("Mã khuyến mãi"),
const SizedBox(height: 8 ),
Container(
padding: const EdgeInsets.all( 8 ),
margin: const EdgeInsets.only(bottom: 24 ),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 12 ),
border: Border.all(color:
Colors.blue.withOpacity(0.1)),
),
child: Row(
children: [
const SizedBox(width: 8 ),
const Icon(
Icons.confirmation_number_outlined,
color: Colors.blue,
),
const SizedBox(width: 12 ),
Expanded(
child: TextField(
controller: couponController,
decoration: const InputDecoration(
hintText: "Nhập mã giảm giá",
border: InputBorder.none,
hintStyle: TextStyle(fontSize: 14 ),
),
),
),
ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor: Colors.blue.shade700,
foregroundColor: Colors.white,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 8 ),
),
elevation: 0 ,
),
onPressed: () {
if (couponController.text.isNotEmpty) {
```



```
controller.applyCoupon(
couponController.text.trim(),
);
} else {
Get.snackbar("Thông báo", "Vui lòng nhập mã");
}
},
child: const Text("Áp dụng"),
),
],
),
),
```
### /// 3. PHƯƠNG THỨC THANH TOÁN

```
_buildSectionTitle("Phương thức thanh toán"),
const SizedBox(height: 8 ),
Container(
margin: const EdgeInsets.only(bottom: 24 ),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 16 ),
),
child: Column(
children: [
_buildPaymentOption(
title: "Tiền mặt khi nhận hàng (COD)",
value: "cash",
icon: Icons.payments_outlined,
),
Divider(height: 1 , color: Colors.grey.shade100),
_buildPaymentOption(
title: "Chuyển khoản ngân hàng",
value: "bank",
icon: Icons.account_balance_outlined,
),
if (controller.paymentMethod.value == "bank")
Container(
padding: const EdgeInsets.all( 20 ),
child: Column(
children: [
const Text(
"Quét mã để thanh toán",
style: TextStyle(
fontWeight: FontWeight.w500,
color: Colors.grey,
),
),
const SizedBox(height: 12 ),
Container(
padding: const EdgeInsets.all( 12 ),
```



```
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 16 ),
border: Border.all(
color: Colors.grey.shade200,
),
),
child: Image.network(
"https://api.qrserver.com/v1/create-qr-
code/?size=150x150&data=payment",
height: 150 ,
width: 150 ,
),
),
],
),
),
],
),
),
```
### /// 4. ĐỊA CHỈ GIAO HÀNG

```
_buildSectionTitle("Địa chỉ giao hàng"),
Container(
margin: const EdgeInsets.only(top: 8 , bottom: 30 ),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 16 ),
),
child: ListTile(
contentPadding: const EdgeInsets.all( 16 ),
leading: Container(
padding: const EdgeInsets.all( 10 ),
decoration: BoxDecoration(
color: Colors.blue.withOpacity(0.1),
shape: BoxShape.circle,
),
child: const Icon(
Icons.location_on,
color: Colors.blue,
),
),
title: Text(
controller.selectedAddress.value?.fullAddress ??
"Chưa chọn địa chỉ",
style: const TextStyle(fontWeight: FontWeight.w600),
),
subtitle: Padding(
padding: const EdgeInsets.only(top: 4 ),
```



```
child: Text("Số điện thoại:
${controller.phone.value}"),
),
trailing: TextButton(
onPressed: () => _showAddressDialog(controller),
child: const Text(
"Thay đổi",
style: TextStyle(fontWeight: FontWeight.bold),
),
),
),
),
],
),
),
```
```
/// 5. TỔNG KẾT VÀ THANH TOÁN (BOTTOM PANEL)
Container(
padding: const EdgeInsets.fromLTRB( 24 , 20 , 24 , 20 ),
decoration: BoxDecoration(
color: Colors.white,
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.08),
blurRadius: 15 ,
offset: const Offset( 0 , - 5 ),
),
],
borderRadius: const BorderRadius.only(
topLeft: Radius.circular( 30 ),
topRight: Radius.circular( 30 ),
),
),
child: SafeArea(
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
_row("Tạm tính", controller.subTotal.value),
const SizedBox(height: 8 ),
_row("Phí vận chuyển", controller.shippingFee.value),
const SizedBox(height: 8 ),
_row(
"Giảm giá",
```
- controller.discountAmount.value,
color: Colors.red,
),
const Padding(
padding: EdgeInsets.symmetric(vertical: 12 ),
child: Divider(),
),




```
_row(
"Tổng thanh toán",
controller.total,
bold: true,
fontSize: 18 ,
color: Colors.blue.shade800,
),
const SizedBox(height: 20 ),
```
### /// NÚT CHECKOUT

```
SizedBox(
width: double.infinity,
height: 55 ,
child: ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor: Colors.blue.shade700,
foregroundColor: Colors.white,
elevation: 2 ,
shadowColor: Colors.blue.withOpacity(0.5),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 16 ),
),
),
onPressed: () async {
if (controller.selectedAddress.value == null) {
Get.snackbar(
"Lỗi",
"Vui lòng chọn địa chỉ giao hàng",
backgroundColor: Colors.red.shade400,
colorText: Colors.white,
);
return;
}
await controller.createOrder();
},
child: const Text(
"XÁC NHẬN ĐẶT HÀNG",
style: TextStyle(
fontSize: 16 ,
fontWeight: FontWeight.bold,
letterSpacing: 1 ,
),
),
),
),
],
),
),
),
],
```



### ),

### ),

### );

### }

```
/// Widget tiêu đề từng phần
Widget _buildSectionTitle(String title) {
return Text(
title,
style: const TextStyle(
fontSize: 16 ,
fontWeight: FontWeight.bold,
color: Color(0xFF2D2D2D),
),
);
}
```
```
/// Widget lựa chọn thanh toán
Widget _buildPaymentOption({
required String title,
required String value,
required IconData icon,
}) {
final isSelected = controller.paymentMethod.value == value;
return InkWell(
onTap: () => controller.paymentMethod.value = value,
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 4 , vertical: 4 ),
child: RadioListTile<String>(
value: value,
groupValue: controller.paymentMethod.value,
onChanged: (v) => controller.paymentMethod.value = v!,
activeColor: Colors.blue,
secondary: Icon(icon, color: isSelected? Colors.blue :
Colors.grey),
title: Text(
title,
style: TextStyle(
fontSize: 14 ,
fontWeight: isSelected? FontWeight.bold : FontWeight.normal,
color: isSelected? Colors.black : Colors.black87,
),
),
),
),
);
}
```
```
/// HỘI THOẠI CHỌN ĐỊA CHỈ
void _showAddressDialog(OrderController controller) {
```



```
Get.dialog(
AlertDialog(
shape: RoundedRectangleBorder(borderRadius:
BorderRadius.circular( 20 )),
title: const Text(
"Địa chỉ nhận hàng",
style: TextStyle(fontWeight: FontWeight.bold),
),
content: SizedBox(
width: double.maxFinite,
child: Obx(() {
if (controller.addresses.isEmpty) {
return const Padding(
padding: EdgeInsets.symmetric(vertical: 20 ),
child: Text("Bạn chưa có địa chỉ nào được lưu."),
);
}
return ListView.separated(
shrinkWrap: true,
itemCount: controller.addresses.length,
separatorBuilder: (context, index) => const Divider(),
itemBuilder: (context, index) {
final addr = controller.addresses[index];
return ListTile(
contentPadding: EdgeInsets.zero,
leading: const Icon(Icons.location_on, color: Colors.blue),
title: Text(
addr.fullAddress,
style: const TextStyle(fontSize: 14 ),
),
onTap: () {
controller.selectAddress(addr);
Get.back();
},
);
},
);
}),
),
actions: [
TextButton(onPressed: () => Get.back(), child: const Text("Đóng")),
],
),
);
}
```
### /// HIỂN THỊ DÒNG GIÁ TIỀN

```
Widget _row(
String title,
double value, {
```



```
bool bold = false,
double fontSize = 14 ,
Color? color,
}) {
return Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(
title,
style: TextStyle(
fontSize: fontSize,
color: bold? Colors.black : Colors.grey.shade600,
fontWeight: bold? FontWeight.bold : FontWeight.normal,
),
),
Text(
value < 0
? "- \$${(value.abs()).toStringAsFixed( 0 )}"
: "\$${value.toStringAsFixed( 0 )}",
style: TextStyle(
fontSize: fontSize,
color: color ?? (bold? Colors.black : Colors.black),
fontWeight: bold? FontWeight.bold : FontWeight.normal,
),
),
],
);
}
}
```
## Trong file libs/screens/order/order_success_screen.dart, cập nhật mã

## nguồn có nội dung sau:

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
```
```
import '../../controller/cart_controller.dart';
```
```
class OrderSuccessScreen extends StatelessWidget {
const OrderSuccessScreen({super.key});
```
```
@override
Widget build(BuildContext context) {
final cart = Get.find<CartController>();
```
```
return Scaffold(
body: Center(
child: Padding(
```



```
padding: const EdgeInsets.all( 24 ),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Icon(Icons.check_circle, color: Colors.green, size: 100 ),
```
```
const SizedBox(height: 20 ),
```
```
const Text(
"Đặt hàng thành công!",
style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),
),
```
```
const SizedBox(height: 10 ),
```
```
const Text("Cảm ơn bạn đã mua hàng"),
```
```
const SizedBox(height: 30 ),
```
```
ElevatedButton(
onPressed: () {
cart.cartItems.clear();
Get.offAllNamed("/home"); // hoặc HomeScreen
},
child: const Text("Tiếp tục mua sắm"),
),
],
),
),
),
);}}
```
## Trong file libs/screens/order/ordered_detail_screen.dart, cập nhật mã

## nguồn có nội dung sau:

```
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draf_project/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/order_model.dart';
```
```
class OrderDetailScreen extends StatefulWidget {
final OrderModel order;
```
```
const OrderDetailScreen({super.key, required this.order});
```
```
@override
State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}
```



```
class _OrderDetailScreenState extends State<OrderDetailScreen> {
String phone = "";
bool isLoadingPhone = true;
```
```
@override
void initState() {
super.initState();
_fetchUserPhone();
}
```
### /// ================= FETCH PHONE =================

```
Future<void> _fetchUserPhone() async {
try {
final snapshot = await FirebaseFirestore.instance
.collection('users')
.doc(widget.order.userId)
.get();
```
```
if (snapshot.exists && mounted) {
setState(() {
phone = snapshot.data()?['phone'] ?? "Chưa cập nhật";
isLoadingPhone = false;
});
}
} catch (e) {
if (mounted) setState(() => isLoadingPhone = false);
}
}
```
### /// ================= LOGIC TRẠNG THÁI =================

```
int _getStepIndex(String status) {
switch (status.toLowerCase()) {
case "created":
case "pending":
return 0 ;
case "processing":
return 1 ;
case "shipped":
return 2 ;
case "delivered":
return 3 ;
default:
return - 1 ;
}
}
```
```
String _getStatusText(String status) {
switch (status.toLowerCase()) {
case "created":
return "Mới tạo";
```



```
case "pending":
return "Chờ xử lý";
case "processing":
return "Đang đóng gói";
case "shipped":
return "Đang giao hàng";
case "delivered":
return "Đã giao thành công";
case "cancelled":
return "Đã hủy";
case "returned":
return "Đã trả hàng";
case "refunded":
return "Đã hoàn tiền";
default:
return status;
}
}
```
```
bool _isSpecialStatus(String status) {
final s = status.toLowerCase();
return s == "cancelled" || s == "returned" || s == "refunded";
}
```
```
String _getPaymentMethodText(String method) {
switch (method.toLowerCase()) {
case "cash":
return "Thanh toán khi nhận hàng (COD)";
case "bank":
return "Chuyển khoản ngân hàng";
default:
return method;
}
}
```
```
String _formatDate(DateTime? date) {
if (date == null) return "Đang xử lý";
return "${date.day}/${date.month}/${date.year}";
}
```
```
String _buildAddress(Map<String, dynamic> addr) {
return "${addr['number'] ?? ''} ${addr['street'] ?? ''}, ${addr['ward']
?? ''}, ${addr['city'] ?? ''}";
}
```
```
@override
Widget build(BuildContext context) {
final order = widget.order;
final currentStep = _getStepIndex(order.orderStatus);
```



```
return Scaffold(
backgroundColor: const Color(0xFFF8F9FB), // Nền xám rất nhẹ đồng bộ
App
appBar: AppBar(
title: const Text(
"Chi tiết đơn hàng",
style: TextStyle(fontWeight: FontWeight.bold),
),
centerTitle: true,
elevation: 0 ,
foregroundColor: Colors.white,
flexibleSpace: Container(
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [Colors.blue.shade700, Colors.blue.shade400],
),
),
),
),
body: SingleChildScrollView(
physics: const BouncingScrollPhysics(),
padding: const EdgeInsets.all( 16 ),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
/// 1. MÃ ĐƠN HÀNG & TRẠNG THÁI CHUNG
Container(
padding: const EdgeInsets.all( 20 ),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 20 ),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.05),
blurRadius: 10 ,
offset: const Offset( 0 , 4 ),
),
],
),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text(
"Mã đơn hàng",
style: TextStyle(color: Colors.grey, fontSize: 12 ),
```



### ),

```
const SizedBox(height: 4 ),
Text(
"#${order.id.toUpperCase()}",
style: const TextStyle(
fontSize: 18 ,
fontWeight: FontWeight.bold,
color: Colors.blue,
),
),
],
),
Container(
padding: const EdgeInsets.symmetric(
horizontal: 12 ,
vertical: 6 ,
),
decoration: BoxDecoration(
color: _isSpecialStatus(order.orderStatus)
? Colors.red.shade50
: Colors.blue.shade50,
borderRadius: BorderRadius.circular( 12 ),
),
child: Text(
_getStatusText(order.orderStatus),
style: TextStyle(
color: _isSpecialStatus(order.orderStatus)
? Colors.red
: Colors.blue.shade700,
fontWeight: FontWeight.bold,
fontSize: 13 ,
),
),
),
],
),
),
```
```
const SizedBox(height: 20 ),
```
```
/// 2. STEPPER TRẠNG THÁI ĐƠN HÀNG
const Text(
"Hành trình đơn hàng",
style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),
),
const SizedBox(height: 12 ),
Container(
padding: const EdgeInsets.symmetric(vertical: 24 , horizontal:
16 ),
decoration: BoxDecoration(
```



```
color: Colors.white,
borderRadius: BorderRadius.circular( 20 ),
),
child: _isSpecialStatus(order.orderStatus)
? _buildSpecialStatusUI(order.orderStatus)
: _buildHorizontalStepper(currentStep),
),
```
```
const SizedBox(height: 20 ),
```
### /// 3. DANH SÁCH SẢN PHẨM

```
const Text(
"Sản phẩm",
style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),
),
const SizedBox(height: 12 ),
...order.products.map((item) => _buildProductCard(item)),
```
```
const SizedBox(height: 20 ),
```
```
/// 4. THÔNG TIN GIAO HÀNG & LIÊN HỆ
const Text(
"Thông tin nhận hàng",
style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),
),
const SizedBox(height: 12 ),
Container(
padding: const EdgeInsets.all( 16 ),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 20 ),
),
child: Column(
children: [
_buildInfoRow(
Icons.location_on_outlined,
"Địa chỉ",
_buildAddress(order.shippingAddress),
),
const Divider(height: 24 ),
_buildInfoRow(
Icons.phone_android_outlined,
"Số điện thoại",
isLoadingPhone? "Đang tải..." : phone,
),
const Divider(height: 24 ),
_buildInfoRow(
Icons.calendar_today_outlined,
"Ngày giao dự kiến",
_formatDate(order.shippingDate),
```



### ),

### ],

### ),

### ),

```
const SizedBox(height: 20 ),
```
```
/// 5. TỔNG KẾT THANH TOÁN
Container(
padding: const EdgeInsets.all( 20 ),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 20 ),
),
child: Column(
children: [
_priceSummaryRow("Tạm tính", order.subTotal),
_priceSummaryRow(
"Phí vận chuyển",
order.shippingAmount.toDouble(),
),
_priceSummaryRow("Thuế", order.taxAmount),
if (order.couponDiscountAmount > 0 )
_priceSummaryRow(
"Giảm giá",
```
- order.couponDiscountAmount,
isDiscount: true,
),
const Padding(
padding: EdgeInsets.symmetric(vertical: 12 ),
child: Divider(thickness: 1 ),
),
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
const Text(
"Tổng thanh toán",
style: TextStyle(
fontSize: 16 ,
fontWeight: FontWeight.bold,
),
),
Text(
"\$${order.totalAmount.toStringAsFixed( 0 )}",
style: const TextStyle(
fontSize: 20 ,
fontWeight: FontWeight.bold,
color: Colors.blue,
),
),




### ],

### ),

```
const SizedBox(height: 16 ),
Container(
padding: const EdgeInsets.all( 12 ),
decoration: BoxDecoration(
color: Colors.grey.shade50,
borderRadius: BorderRadius.circular( 12 ),
),
child: Row(
children: [
const Icon(
Icons.account_balance_wallet_outlined,
size: 20 ,
color: Colors.blue,
),
const SizedBox(width: 10 ),
Text(
_getPaymentMethodText(order.paymentMethod),
style: const TextStyle(fontSize: 13 ),
),
],
),
),
],
),
),
```
```
const SizedBox(height: 30 ),
```
### /// 6. NÚT HỦY ĐƠN

```
if (order.orderStatus.toLowerCase() == "created")
SizedBox(
width: double.infinity,
height: 55 ,
child: ElevatedButton(
onPressed: () => _confirmCancel(order),
style: ElevatedButton.styleFrom(
backgroundColor: Colors.white,
foregroundColor: Colors.red,
side: const BorderSide(color: Colors.red),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 16 ),
),
elevation: 0 ,
),
child: const Text(
"Hủy đơn hàng",
style: TextStyle(fontWeight: FontWeight.bold, fontSize:
16 ),
```



### ),

### ),

### ),

```
const SizedBox(height: 20 ),
],
),
),
);
}
```
### /// ================= UI WIDGETS =================

```
Widget _buildHorizontalStepper(int current) {
return Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
_buildStepCircle(Icons.receipt_long, "Đặt hàng", current >= 0 ),
_buildStepLine(current >= 1 ),
_buildStepCircle(Icons.inventory_2, "Đóng gói", current >= 1 ),
_buildStepLine(current >= 2 ),
_buildStepCircle(Icons.local_shipping, "Giao hàng", current >= 2 ),
_buildStepLine(current >= 3 ),
_buildStepCircle(Icons.check_circle, "Hoàn tất", current >= 3 ),
],
);
}
```
```
Widget _buildStepCircle(IconData icon, String label, bool isDone) {
return Column(
children: [
AnimatedContainer(
duration: const Duration(milliseconds: 500 ),
padding: const EdgeInsets.all( 8 ),
decoration: BoxDecoration(
color: isDone? Colors.blue : Colors.grey.shade200,
shape: BoxShape.circle,
),
child: Icon(
icon,
size: 20 ,
color: isDone? Colors.white : Colors.grey,
),
),
const SizedBox(height: 6 ),
Text(
label,
style: TextStyle(
fontSize: 10 ,
color: isDone? Colors.blue.shade700 : Colors.grey,
fontWeight: isDone? FontWeight.bold : FontWeight.normal,
```



### ),

### ),

### ],

### );

### }

```
Widget _buildStepLine(bool isActive) {
return Expanded(
child: Container(
height: 2 ,
margin: const EdgeInsets.only(bottom: 20 ),
color: isActive? Colors.blue : Colors.grey.shade200,
),
);
}
```
```
Widget _buildSpecialStatusUI(String status) {
IconData icon = Icons.info;
Color color = Colors.grey;
if (status.toLowerCase() == "cancelled") {
icon = Icons.cancel;
color = Colors.red;
} else if (status.toLowerCase() == "returned") {
icon = Icons.assignment_return;
color = Colors.orange;
}
```
```
return Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(icon, color: color, size: 30 ),
const SizedBox(width: 12 ),
Text(
_getStatusText(status),
style: TextStyle(
color: color,
fontSize: 18 ,
fontWeight: FontWeight.bold,
),
),
],
);
}
```
```
Widget _buildProductCard(dynamic item) {
return Container(
margin: const EdgeInsets.only(bottom: 12 ),
padding: const EdgeInsets.all( 12 ),
decoration: BoxDecoration(
color: Colors.white,
```



```
borderRadius: BorderRadius.circular( 16 ),
),
child: Row(
children: [
ClipRRect(
borderRadius: BorderRadius.circular( 12 ),
child: Image.network(
item.image,
width: 70 ,
height: 70 ,
fit: BoxFit.cover,
),
),
const SizedBox(width: 12 ),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
item.title,
style: const TextStyle(
fontWeight: FontWeight.bold,
fontSize: 15 ,
),
maxLines: 1 ,
overflow: TextOverflow.ellipsis,
),
const SizedBox(height: 4 ),
Text(
"Số lượng: x${item.quantity}",
style: const TextStyle(color: Colors.grey, fontSize: 13 ),
),
],
),
),
Text(
"\$${item.price}",
style: const TextStyle(
fontWeight: FontWeight.bold,
fontSize: 16 ,
color: Colors.blue,
),
),
],
),
);
}
```
```
Widget _buildInfoRow(IconData icon, String title, String value) {
return Row(
```



```
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Icon(icon, size: 20 , color: Colors.blue.shade300),
const SizedBox(width: 12 ),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
title,
style: const TextStyle(color: Colors.grey, fontSize: 12 ),
),
const SizedBox(height: 2 ),
Text(
value,
style: const TextStyle(
fontSize: 14 ,
fontWeight: FontWeight.w500,
),
),
],
),
),
],
);
}
```
```
Widget _priceSummaryRow(
String label,
double value, {
bool isDiscount = false,
}) {
return Padding(
padding: const EdgeInsets.symmetric(vertical: 4 ),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(label, style: const TextStyle(color: Colors.grey)),
Text(
"${isDiscount? '-' : ''}\$${value.abs().toStringAsFixed( 0 )}",
style: TextStyle(
color: isDiscount? Colors.red : Colors.black87,
fontWeight: isDiscount? FontWeight.bold : FontWeight.normal,
),
),
],
),
);
}
```



### /// ================= LOGIC HỦY ĐƠN =================

```
void _confirmCancel(OrderModel order) {
Get.dialog(
AlertDialog(
shape: RoundedRectangleBorder(borderRadius:
BorderRadius.circular( 20 )),
title: const Text("Xác nhận hủy đơn"),
content: const Text(
"Bạn có chắc chắn muốn hủy đơn hàng này không? Hành động này không
thể hoàn tác.",
),
actions: [
TextButton(
onPressed: () => Get.back(),
child: const Text("Đóng", style: TextStyle(color: Colors.grey)),
),
ElevatedButton(
onPressed: () async {
final orderController = Get.find<OrderController>();
await FirebaseFirestore.instance
.collection('orders')
.doc(order.docId)
.update({
"orderStatus": "cancelled",
"updatedAt": DateTime.now(),
});
await orderController.revertSoldQuantity(order);
Get.back();
Get.back();
Get.snackbar(
"Thành công",
"Đơn hàng của bạn đã được hủy",
backgroundColor: Colors.green,
colorText: Colors.white,
snackPosition: SnackPosition.BOTTOM,
);
},
style: ElevatedButton.styleFrom(
backgroundColor: Colors.red,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 10 ),
),
),
child: const Text(
"Xác nhận hủy",
style: TextStyle(color: Colors.white),
),
),
],
),
```



### );

### }

### }

## Trong file libs/screens/profile/profile_screen.dart, cập nhật lại mã nguồn

## có nội dung sau:

```
import
'package:draf_project/screens/shipping_address/my_shipping_address_screen.dar
t';
import 'package:flutter/material.dart';
import '../../common/styles/app_colors.dart';
import '../../common/styles/app_text_styles.dart';
import '../../common/widgets/profile_menu_item.dart';
import '../../routes/app_routes.dart';
import '../order/my_order_screen.dart';
import '../bank_account/my_bank_account_screen.dart';
import '../notifications/my_notifications.dart';
import 'package:get/get.dart';
import 'package:draf_project/controller/login_controller.dart';
```
```
class ProfileScreen extends StatelessWidget {
const ProfileScreen({super.key});
```
```
@override
Widget build(BuildContext context) {
return GetBuilder<AuthController>(
builder: (authController) {
bool loggedIn = authController.currentUser != null;
```
```
if (!loggedIn) {
return _buildGuestProfile(context);
}
```
```
return _buildUserProfile(context, authController);
},
);
}
```
```
/// ===== Header xanh =====
Widget _buildHeader(BuildContext context, AuthController authController) {
final user = authController.currentUser;
```
```
String fullName = '';
String email = '';
```
```
if (user != null) {
fullName = '${user.firstName} ${user.lastName}';
```



```
email = user.email;
}
```
```
return Container(
width: double.infinity,
padding: const EdgeInsets.fromLTRB( 20 , 60 , 20 , 30 ),
color: AppColors.primaryBlue,
child: Row(
children: [
const CircleAvatar(
radius: 32 ,
backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
),
const SizedBox(width: 16 ),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
fullName,
style: const TextStyle(
fontSize: 20 ,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
const SizedBox(height: 4 ),
Text(
email,
style: const TextStyle(fontSize: 14 , color:
Colors.white70),
),
],
),
),
IconButton(
onPressed: () {
Navigator.pushNamed(context, AppRoutes.updateAccount);
},
icon: const Icon(Icons.edit, color: Colors.white),
),
],
),
);
}
```
```
Widget _buildUserProfile(
BuildContext context,
AuthController authController,
) {
```



```
final AuthController authController = Get.find<AuthController>();
```
```
return Scaffold(
backgroundColor: AppColors.background,
body: Column(
children: [
_buildHeader(context, authController),
Expanded(
child: SingleChildScrollView(
child: Container(
padding: const EdgeInsets.all( 20 ),
decoration: const BoxDecoration(
color: AppColors.white,
borderRadius: BorderRadius.only(
topLeft: Radius.circular( 24 ),
topRight: Radius.circular( 24 ),
),
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
_buildAccountSetting(context),
const SizedBox(height: 24 ),
_buildAppSettingLabel(),
_buildLogoutButton(context),
],
),
),
),
),
],
),
);
}
```
```
/// ===== Account Setting =====
Widget _buildAccountSetting(BuildContext context) {
return Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('Cài đặt tài khoản', style: AppTextStyle.title),
const SizedBox(height: 16 ),
```
```
ProfileMenuItem(
icon: Icons.location_on,
title: 'Địa chỉ của tôi',
subtitle: 'Quản lý địa chỉ giao hàng',
onTap: () {
Navigator.push(
context,
```



```
MaterialPageRoute(builder: (_) => MyShippingAddressScreen()),
);
},
),
```
```
ProfileMenuItem(
icon: Icons.shopping_cart,
title: 'Giỏ hàng của tôi',
subtitle: 'Xem các mặt hàng trong giỏ hàng',
onTap: () {
Navigator.pushNamed(context, AppRoutes.cartOverview);
},
),
```
```
ProfileMenuItem(
icon: Icons.receipt_long,
title: 'Đơn hàng của tôi',
subtitle: 'Theo dõi đơn hàng của bạn',
onTap: () {
Navigator.push(
context,
MaterialPageRoute(builder: (_) => const MyOrderScreen()),
);
},
),
```
```
ProfileMenuItem(
icon: Icons.account_balance,
title: 'Tài khoản ngân hàng',
subtitle: 'Quản lý phương thức thanh toán',
onTap: () {
Navigator.push(
context,
MaterialPageRoute(builder: (_) => MyBankAccountScreen()),
);
},
),
```
```
ProfileMenuItem(
icon: Icons.discount,
title: 'Mã giảm giá',
subtitle: 'Xem các mã giảm giá có sẵn',
onTap: () {},
),
```
```
ProfileMenuItem(
icon: Icons.notifications,
title: 'Thông báo',
subtitle: 'Cài đặt thông báo',
onTap: () {
```



```
Navigator.push(
context,
MaterialPageRoute(builder: (_) => MyNotificationScreen()),
);
},
),
```
```
ProfileMenuItem(
icon: Icons.lock,
title: 'Bảo mật tài khoản',
subtitle: 'Cài đặt bảo mật và quyền riêng tư',
onTap: () {},
),
],
);
}
```
```
/// ===== App Setting label =====
Widget _buildAppSettingLabel() {
return Text('Cài đặt ứng dụng', style: AppTextStyle.title);
}
```
```
Widget _buildLogoutButton(BuildContext context) {
final AuthController authController = Get.find<AuthController>();
```
```
return Padding(
padding: const EdgeInsets.only(top: 16 ),
child: GestureDetector(
onTap: () async {
bool? confirm = await showDialog<bool>(
context: context,
builder: (BuildContext dialogContext) {
return AlertDialog(
title: const Text('Đang xuất'),
content: const Text('Bann có chắc muốn đăng xuất không?'),
actions: [
TextButton(
onPressed: () {
Navigator.of(dialogContext).pop(false);
},
child: const Text('Hủy'),
),
TextButton(
onPressed: () {
Navigator.of(dialogContext).pop(true);
},
child: const Text(
'Đăng xuất',
style: TextStyle(color: Colors.red),
),
```



### ),

### ],

### );

### },

### );

```
if (confirm == true) {
await authController.logout();
```
```
Navigator.pushNamedAndRemoveUntil(
context,
AppRoutes.home,
(route) => false,
);
}
},
child: Container(
width: double.infinity,
padding: const EdgeInsets.symmetric(vertical: 16 ),
decoration: BoxDecoration(
border: Border.all(color: Colors.red),
borderRadius: BorderRadius.circular( 12 ),
),
child: const Center(
child: Text(
'Đăng xuất',
style: TextStyle(
color: Colors.red,
fontSize: 16 ,
fontWeight: FontWeight.bold,
),
),
),
),
),
);
}
}
```
```
Widget _buildGuestProfile(BuildContext context) {
return Scaffold(
backgroundColor: AppColors.background,
body: Column(
children: [
Container(
width: double.infinity,
padding: const EdgeInsets.fromLTRB( 20 , 60 , 20 , 30 ),
color: AppColors.primaryBlue,
child: Column(
children: [
```



```
const CircleAvatar(
radius: 40 ,
child: Icon(Icons.person, size: 40 ),
),
const SizedBox(height: 16 ),
const Text(
'Guest User',
style: TextStyle(
fontSize: 20 ,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
const SizedBox(height: 16 ),
ElevatedButton(
onPressed: () {
Navigator.pushNamed(context, AppRoutes.login);
},
child: const Text('Đăng nhập ngay'),
),
],
),
),
],
),
);
}
```
## 13. Thiết kế và phát triển nhóm chức năng quản lý danh mục sản phẩm yêu thích của người

## dùng

## Trong file libs/common/state/wishlist_manager.dart, soạn mã nguồn có nội

## dung sau:

```
import 'package:get/get.dart';
import 'package:draf_project/controller/login_controller.dart';
```
```
class WishlistManager {
static final WishlistManager _instance = WishlistManager._internal();
```
```
factory WishlistManager() {
return _instance;
}
```
```
WishlistManager._internal();
```
```
// Map<userId, List<Product>>
final Map<String, List<Map<String, dynamic>>> _userWishlists = {};
```



```
List<Map<String, dynamic>> get items {
final AuthController authController = Get.find<AuthController>();
```
```
final user = authController.currentUser;
```
```
if (user == null) {
return [];
}
```
```
if (_userWishlists[user.id] == null) {
_userWishlists[user.id] = [];
}
```
```
return _userWishlists[user.id]!;
}
```
```
bool isFavorite(String id) {
final currentItems = items;
```
```
return currentItems.any((element) => element['id'] == id);
}
```
```
void toggle(Map<String, dynamic> product) {
final AuthController authController = Get.find<AuthController>();
```
```
final user = authController.currentUser;
```
```
if (user == null) {
return;
}
```
```
if (_userWishlists[user.id] == null) {
_userWishlists[user.id] = [];
}
```
```
final List<Map<String, dynamic>> userItems = _userWishlists[user.id]!;
```
```
final index = userItems.indexWhere(
(element) => element['id'] == product['id'],
);
```
```
if (index >= 0 ) {
userItems.removeAt(index);
} else {
userItems.add(product);
}
}
}
```



## Trong file libs/controller/wishlist_controller.dart, soạn mã nguồn có nội

## dung sau:

```
import 'package:draf_project/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/models/product_model.dart';
```
```
class WishlistController extends GetxController {
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final AuthController _authController = Get.find<AuthController>();
```
```
String? get uid => _authController.currentUser?.id;
```
```
RxSet<String> wishlistIds = <String>{}.obs;
RxList<ProductModel> items = <ProductModel>[].obs;
```
```
/// LOAD wishlist
Future<void> loadWishlist() async {
if (uid == null) return;
```
```
final snapshot = await _firestore
.collection('users')
.doc(uid)
.collection('wishlist')
.get();
```
```
wishlistIds.clear();
items.clear();
```
```
for (var doc in snapshot.docs) {
final productId = doc.id;
wishlistIds.add(productId);
```
```
final productDoc = await _firestore
.collection('products')
.doc(productId)
.get();
```
```
if (productDoc.exists) {
items.add(ProductModel.fromSnapshot(productDoc, null));
}
}
```
```
update();
```



### }

### /// CHECK

```
bool isInWishlist(String productId) {
return wishlistIds.contains(productId);
}
```
```
/// TOGGLE
Future<void> toggleWishlist(ProductModel product) async {
if (uid == null) return;
```
```
final docRef = _firestore
.collection('users')
.doc(uid)
.collection('wishlist')
.doc(product.id);
```
```
if (wishlistIds.contains(product.id)) {
await docRef.delete();
wishlistIds.remove(product.id);
} else {
await docRef.set({'productId': product.id});
wishlistIds.add(product.id);
}
```
```
update();
}
```
```
/// REMOVE riêng
Future<void> removeItem(String productId) async {
if (uid == null) return;
```
```
await _firestore
.collection('users')
.doc(uid)
.collection('wishlist')
.doc(productId)
.delete();
```
```
wishlistIds.remove(productId);
items.removeWhere((e) => e.id == productId);
```
```
update();
}
}
```
## Trong file libs/services/wishlist_service.dart, soạn mã nguồn có nội dung

## sau:




```
import 'package:cloud_firestore/cloud_firestore.dart';
```
```
class WishlistService {
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
```
```
Future<List<Map<String, dynamic>>> getWishlist(String userId) async {
QuerySnapshot snapshot = await _firestore
.collection('users')
.doc(userId)
.collection('wishlist')
.get();
```
```
List<Map<String, dynamic>> items = [];
```
```
for (var doc in snapshot.docs) {
Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
items.add(data);
}
```
```
return items;
}
```
```
Future<void> removeFromWishlist(String userId, String productId) async {
await _firestore
.collection('users')
.doc(userId)
.collection('wishlist')
.doc(productId)
.delete();
}
}
```
## Trong file libs/screens/wishlist/wishlist_screen.dart, cập nhật lại mã

## nguồn có nội dung sau:

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:draf_project/routes/app_routes.dart';
import 'package:draf_project/controller/login_controller.dart';
import 'package:draf_project/controller/wishlist_controller.dart';
import 'package:draf_project/data/models/product_model.dart';
```
```
class WishlistScreen extends StatefulWidget {
const WishlistScreen({super.key});
```
```
@override
State<WishlistScreen> createState() => _WishlistScreenState();
}
```



```
class _WishlistScreenState extends State<WishlistScreen> {
final WishlistController wishlistController =
Get.find<WishlistController>();
```
```
@override
void initState() {
super.initState();
// Tải dữ liệu wishlist khi vào màn hình
wishlistController.loadWishlist();
}
```
```
@override
Widget build(BuildContext context) {
final AuthController authController = Get.find<AuthController>();
bool loggedIn = authController.currentUser != null;
```
```
// Nếu chưa đăng nhập, hiển thị màn hình yêu cầu login
if (!loggedIn) {
return _buildLoginRequired(context);
}
```
```
return Scaffold(
backgroundColor: Colors.grey[ 50 ], // Nền xám nhạt nhất quán
appBar: AppBar(
title: const Text(
'Danh sách yêu thích',
style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18 ),
),
centerTitle: true,
elevation: 0 ,
foregroundColor: Colors.white,
flexibleSpace: Container(
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [Colors.blue.shade700, Colors.blue.shade400],
),
),
),
),
body: GetBuilder<WishlistController>(
builder: (controller) {
final items = controller.items;
```
```
if (items.isEmpty) {
return _buildEmpty();
}
```
```
return GridView.builder(
```



```
padding: const EdgeInsets.all( 16 ),
itemCount: items.length,
physics: const BouncingScrollPhysics(),
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2 ,
crossAxisSpacing: 16 ,
mainAxisSpacing: 16 ,
childAspectRatio:
0.65, // Nhất quán với HomeScreen và Popular Screen
),
itemBuilder: (context, index) {
final product = items[index];
```
```
return _WishlistProductCard(
product: product,
onRemove: () async {
await controller.removeItem(product.id);
// Hiển thị snackbar hiện đại hơn
Get.rawSnackbar(
message: "Đã xóa khỏi danh sách yêu thích",
backgroundColor: Colors.black87,
snackPosition: SnackPosition.BOTTOM,
margin: const EdgeInsets.all( 16 ),
borderRadius: 12 ,
duration: const Duration(seconds: 2 ),
);
},
);
},
);
},
),
);
}
```
```
/// Trình bày khi danh sách trống
Widget _buildEmpty() {
return Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Container(
padding: const EdgeInsets.all( 40 ),
decoration: BoxDecoration(
color: Colors.red.withOpacity(0.05),
shape: BoxShape.circle,
),
child: Icon(
Icons.favorite_outline_rounded,
size: 80 ,
```



```
color: Colors.red.withOpacity(0.2),
),
),
const SizedBox(height: 24 ),
const Text(
'Danh sách đang trống',
style: TextStyle(
fontSize: 20 ,
fontWeight: FontWeight.bold,
color: Color(0xFF2D2D2D),
),
),
const SizedBox(height: 10 ),
const Text(
'Hãy thêm những sản phẩm bạn yêu thích vào đây!',
textAlign: TextAlign.center,
style: TextStyle(color: Colors.grey),
),
const SizedBox(height: 32 ),
SizedBox(
width: 200 ,
child: ElevatedButton(
onPressed: () => Get.back(),
style: ElevatedButton.styleFrom(
backgroundColor: Colors.blue.shade700,
foregroundColor: Colors.white,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 12 ),
),
padding: const EdgeInsets.symmetric(vertical: 14 ),
elevation: 0 ,
),
child: const Text(
'Mua sắm ngay',
style: TextStyle(fontWeight: FontWeight.bold),
),
),
),
],
),
);
}
```
```
/// Trình bày khi chưa đăng nhập
Widget _buildLoginRequired(BuildContext context) {
return Scaffold(
body: Container(
width: double.infinity,
padding: const EdgeInsets.all( 30 ),
child: Column(
```



```
mainAxisAlignment: MainAxisAlignment.center,
children: [
Container(
padding: const EdgeInsets.all( 30 ),
decoration: BoxDecoration(
color: Colors.blue.withOpacity(0.05),
shape: BoxShape.circle,
),
child: Icon(
Icons.lock_outline_rounded,
size: 80 ,
color: Colors.blue.shade700,
),
),
const SizedBox(height: 32 ),
const Text(
'Yêu cầu đăng nhập',
style: TextStyle(
fontSize: 24 ,
fontWeight: FontWeight.bold,
color: Color(0xFF2D2D2D),
),
),
const SizedBox(height: 12 ),
const Text(
'Vui lòng đăng nhập để xem và quản lý\ndanh sách yêu thích của
bạn.',
textAlign: TextAlign.center,
style: TextStyle(color: Colors.grey, height: 1.5),
),
const SizedBox(height: 48 ),
SizedBox(
width: double.infinity,
child: ElevatedButton(
onPressed: () => Navigator.pushNamed(context,
AppRoutes.login),
style: ElevatedButton.styleFrom(
backgroundColor: Colors.blue.shade700,
foregroundColor: Colors.white,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular( 12 ),
),
padding: const EdgeInsets.symmetric(vertical: 16 ),
),
child: const Text(
'Đăng nhập ngay',
style: TextStyle(fontWeight: FontWeight.bold),
),
),
),
```



```
TextButton(
onPressed: () => Get.back(),
child: const Text(
'Quay lại',
style: TextStyle(color: Colors.grey),
),
),
],
),
),
);
}
}
```
```
class _WishlistProductCard extends StatelessWidget {
final ProductModel product;
final VoidCallback onRemove;
```
```
const _WishlistProductCard({required this.product, required
this.onRemove});
```
```
@override
Widget build(BuildContext context) {
final bool hasDiscount =
product.salePrice != null && product.salePrice! > 0 ;
```
```
return Container(
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 16 ),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.04),
blurRadius: 10 ,
offset: const Offset( 0 , 4 ),
),
],
),
child: ClipRRect(
borderRadius: BorderRadius.circular( 16 ),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
/// ẢNH SẢN PHẨM
Expanded(
flex: 5 ,
child: Stack(
children: [
Positioned.fill(
child: Image.network(
```



```
product.thumbnail,
fit: BoxFit.cover,
errorBuilder: (_, __, ___) => Container(
color: Colors.grey.shade100,
child: const Icon(
Icons.broken_image,
color: Colors.grey,
),
),
),
),
```
```
/// NHÃN GIẢM GIÁ
if (hasDiscount)
Positioned(
top: 10 ,
left: 10 ,
child: Container(
padding: const EdgeInsets.symmetric(
horizontal: 8 ,
vertical: 4 ,
),
decoration: BoxDecoration(
color: Colors.orangeAccent,
borderRadius: BorderRadius.circular( 6 ),
),
child: Text(
"-${product.salePrice!.toStringAsFixed( 0 )}%",
style: const TextStyle(
color: Colors.white,
fontSize: 10 ,
fontWeight: FontWeight.bold,
),
),
),
),
```
```
/// NÚT XÓA (Yêu thích)
Positioned(
top: 8 ,
right: 8 ,
child: GestureDetector(
onTap: onRemove,
child: Container(
padding: const EdgeInsets.all( 6 ),
decoration: BoxDecoration(
color: Colors.white.withOpacity(0.9),
shape: BoxShape.circle,
boxShadow: [
BoxShadow(
```



```
color: Colors.black.withOpacity(0.1),
blurRadius: 4 ,
),
],
),
child: const Icon(
Icons.favorite,
color: Colors.red,
size: 18 ,
),
),
),
),
],
),
),
```
### /// THÔNG TIN SẢN PHẨM

```
Expanded(
flex: 4 ,
child: Padding(
padding: const EdgeInsets.all( 12 ),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
product.title,
maxLines: 2 ,
overflow: TextOverflow.ellipsis,
style: const TextStyle(
fontWeight: FontWeight.bold,
fontSize: 13 ,
color: Color(0xFF2D2D2D),
),
),
const SizedBox(height: 4 ),
Row(
children: [
Text(
product.brandName ?? 'Generic',
style: TextStyle(
fontSize: 10 ,
color: Colors.blue.shade700,
fontWeight: FontWeight.w500,
),
),
```



```
const SizedBox(width: 4 ),
Icon(
Icons.verified,
size: 10 ,
color: Colors.blue.shade700,
),
],
),
],
),
Text(
"\$${product.price.toStringAsFixed( 0 )}",
style: const TextStyle(
fontWeight: FontWeight.w900,
fontSize: 16 ,
color: Colors.black,
),
),
],
),
),
),
],
),
),
);
}
}
```
## Trong file libs/routes/wishlist/app_routes.dart, cập nhật lại mã nguồn có

## nội dung sau:

```
import 'package:draf_project/screens/auth/forget_password_screen.dart';
import 'package:draf_project/screens/auth/login_screen.dart';
import 'package:draf_project/screens/auth/register_screen.dart';
import 'package:draf_project/screens/auth/register_success_screen.dart';
import 'package:draf_project/screens/auth/reset_email_sent_screen.dart';
import 'package:draf_project/screens/auth/verify_email_screen.dart';
import
'package:draf_project/screens/bank_account/my_bank_account_screen.dart';
import 'package:draf_project/screens/cart/cart_overview_screen.dart';
import 'package:draf_project/screens/onboarding/onboarding_screen.dart';
import 'package:draf_project/screens/order/my_order_screen.dart';
import 'package:draf_project/screens/order/order_overview_screen.dart';
import 'package:draf_project/screens/profile/change_dateofbirth_screen.dart';
import 'package:draf_project/screens/profile/change_email_screen.dart';
import 'package:draf_project/screens/profile/change_gender_screen.dart';
import 'package:draf_project/screens/profile/change_name_screen.dart';
```



```
import 'package:draf_project/screens/profile/change_password_screen.dart';
import 'package:draf_project/screens/profile/change_phonenumber_screen.dart';
import 'package:draf_project/screens/profile/change_username_screen.dart';
import 'package:draf_project/screens/profile/update_account_screen.dart';
import
'package:draf_project/screens/shipping_address/my_shipping_address_screen.dar
t';
import 'package:flutter/material.dart';
import '../screens/home/main_navigation_screen.dart';
import '../screens/spalsh/splash_screen.dart';
```
```
class AppRoutes {
static const String splash = '/';
static const String onboarding = '/onboarding';
static const String login = '/login';
static const String forgetPassword = '/forget-password';
static const String resetEmailSent = '/reset-email-sent';
static const String register = '/register';
static const String verifyEmail = '/verify-email';
static const String registerSuccess = '/register-success';
static const String home = '/home';
static const String profile = '/profile';
static const String publisher = '/publisher';
static const String updateAccount = '/update-account';
```
```
static const String changeName = '/change-name';
static const String changeUsername = '/change-username';
static const String changePassword = '/change-password';
static const String changeEmail = '/change-email';
static const String changePhoneNumber = '/change-phonenumber';
static const String changeGender = '/change-gender';
static const String changeDateofBirth = '/change-datebirth';
static const String cartOverview = '/cart-overview';
static const String orderOverview = '/order-overview';
static const String myOrderview = '/my-order';
static const String myShippingAddressview = '/my_shipping_address';
static const String myBankAccountview = '/my_bank_account';
```
```
static Map<String, WidgetBuilder> routes = {
splash: (context) => const SplashScreen(),
onboarding: (context) => const OnboardingScreen(),
register: (context) => const RegisterScreen(),
login: (context) => const LoginScreen(),
forgetPassword: (context) => ForgetPasswordScreen(),
home: (context) => const MainNavigationScreen(),
updateAccount: (context) => const UpdateAccountScreen(),
changeName: (context) => const ChangeNameScreen(),
changeUsername: (context) => const ChangeUsernameScreen(),
changePassword: (context) => const ChangePasswordScreen(),
changeEmail: (context) => const ChangeEmailScreen(),
```



```
changePhoneNumber: (context) => const ChangePhoneNumberScreen(),
changeGender: (context) => const ChangeGenderScreen(),
changeDateofBirth: (context) => const ChangeDateOfBirthScreen(),
cartOverview: (context) => const CartOverviewScreen(),
orderOverview: (context) => const OrderReviewScreen(),
myOrderview: (context) => const MyOrderScreen(),
myShippingAddressview: (context) => MyShippingAddressScreen(),
myBankAccountview: (context) => MyBankAccountScreen(),
verifyEmail: (context) {
final String email = ModalRoute.of(context)!.settings.arguments as
String;
return VerifyEmailScreen(email: email);
},
```
```
registerSuccess: (context) => const RegisterSuccessScreen(),
```
```
resetEmailSent: (context) {
final email = ModalRoute.of(context)!.settings.arguments as String;
return ResetEmailSentScreen(email: email);
},
};
}
```
## Trong file libs/main.dart, cập nhật lại mã nguồn có nội dung sau:

```
import 'package:draf_project/controller/cart_controller.dart';
import 'package:draf_project/controller/notification_controller.dart';
```
```
import 'package:draf_project/controller/order_controller.dart';
import 'package:draf_project/controller/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'package:firebase_core/firebase_core.dart';
```
```
import 'package:get/get.dart';
import 'controller/login_controller.dart';
```
```
void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
```
```
Get.put(AuthController());
```
```
Get.put(CartController());
Get.put(OrderController());
Get.put(WishlistController());
Get.put(NotificationController());
```
```
runApp(MyApp());
}
```



## 14. Thiết kế và phát triển nhóm chức năng cho phép người dùng tìm kiếm và xem thông

## tin sản phẩm theo nhãn hàng

## Trong file libs/common/widgets/brand_cart.dart, soạn mã nguồn có nội dung

## như sau:

```
import 'package:flutter/material.dart';
```
```
class BrandCard extends StatelessWidget {
final String imageUrl;
final String brandName;
final int productCount;
final VoidCallback? onTap;
```
```
const BrandCard({
Key? key,
required this.imageUrl,
required this.brandName,
required this.productCount,
this.onTap,
}) : super(key: key);
```
```
@override
Widget build(BuildContext context) {
return GestureDetector(
onTap: onTap,
child: Container(
padding: const EdgeInsets.all( 12 ),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 16 ),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.05),
blurRadius: 8 ,
offset: const Offset( 0 , 4 ),
),
],
),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
/// Brand Image
ClipRRect(
borderRadius: BorderRadius.circular( 12 ),
child: Image.network(
imageUrl,
height: 60 ,
```



```
width: 60 ,
fit: BoxFit.cover,
),
),
```
```
const SizedBox(height: 12 ),
```
```
/// Brand Name + Verified Icon
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Flexible(
child: Text(
brandName,
style: const TextStyle(
fontSize: 16 ,
fontWeight: FontWeight.bold,
color: Colors.black,
),
overflow: TextOverflow.ellipsis,
),
),
const SizedBox(width: 4 ),
const Icon(Icons.verified, color: Colors.blue, size: 18 ),
],
),
```
```
const SizedBox(height: 6 ),
```
```
/// Product Count
Text(
'$productCount products',
style: TextStyle(fontSize: 13 , color: Colors.grey.shade600),
),
],
),
),
);
}
}
```
## Trong file libs/controller/brand_controller.dart, soạn mã nguồn có nội

## dung như sau:

```
import 'package:get/get.dart';
import '../data/models/brand_model.dart';
import '../data/models/product_model.dart';
import '../data/services/brand_service.dart';
import '../data/services/product_service.dart';
```



```
class AllBrandController extends GetxController {
final BrandService _brandService = BrandService();
final ProductService _productService = ProductService();
```
```
var isLoading = false.obs;
```
```
/// ================= BRAND LIST =================
var brands = <BrandModel>[].obs;
```
### /// ================= BRAND DETAIL PRODUCTS =================

```
var brandProducts = <ProductModel>[].obs;
List<ProductModel> _originalBrandProducts = [];
```
```
@override
void onInit() {
super.onInit();
fetchBrands();
}
```
```
/// ================= FETCH BRANDS =================
Future<void> fetchBrands() async {
try {
isLoading.value = true;
final result = await _brandService.getAllFeaturedBrands();
brands.assignAll(result);
} catch (e) {
print("Error loading brands: $e");
} finally {
isLoading.value = false;
}
}
```
### /// ================= FETCH PRODUCTS BY BRAND =================

```
Future<void> fetchProductsByBrand(String brandId) async {
try {
isLoading.value = true;
```
```
final result = await _productService.getProductsByBrand(brandId:
brandId);
```
```
_originalBrandProducts = result;
brandProducts.assignAll(result);
} catch (e) {
print("Error loading brand products: $e");
} finally {
isLoading.value = false;
}
}
```



### /// ================= SORT =================

```
var selectedSort = "name".obs;
void sortBrandProducts(String sortType) {
selectedSort.value = sortType;
```
```
List<ProductModel> sorted = List.from(_originalBrandProducts);
```
```
if (sortType == "low_price") {
sorted.sort((a, b) => a.price.compareTo(b.price));
} else if (sortType == "high_price") {
sorted.sort((a, b) => b.price.compareTo(a.price));
} else {
sorted.sort(
(a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()),
);
}
```
```
brandProducts.assignAll(sorted);
}
}
```
## Trong file libs/controller/mystore_controller.dart, soạn mã nguồn có nội

## dung như sau:

```
import 'package:get/get.dart';
import '../data/models/brand_model.dart';
import '../data/models/category_model.dart';
import '../data/models/product_model.dart';
import '../data/services/mystore_service.dart';
```
```
class MyStoreController extends GetxController {
final MyStoreService _service = MyStoreService();
```
```
var isLoading = false.obs;
```
```
var featuredBrands = <BrandModel>[].obs;
var categories = <CategoryModel>[].obs;
var categoryBrands = <BrandModel>[].obs;
var products = <ProductModel>[].obs;
```
```
var selectedCategoryIndex = 0.obs;
```
```
@override
void onInit() {
super.onInit();
initData();
}
```
```
Future<void> initData() async {
```



```
isLoading.value = true;
```
```
featuredBrands.value = await _service.getFeaturedBrands();
categories.value = await _service.getCategories();
```
```
if (categories.isNotEmpty) {
await selectCategory( 0 );
}
```
```
isLoading.value = false;
}
```
```
Future<void> selectCategory(int index) async {
selectedCategoryIndex.value = index;
```
```
final categoryId = categories[index].id;
```
```
final brandIds = await _service.getBrandIdsByCategory(categoryId);
```
```
categoryBrands.value = featuredBrands
.where((brand) => brandIds.contains(brand.id))
.toList();
```
```
products.value = await _service.getProductsByCategoryAndBrands(
categoryId,
brandIds,
);
}
}
```
## Trong file libs/data/models/brand_model.dart, soạn mã nguồn có nội dung như

## sau:

```
import 'package:cloud_firestore/cloud_firestore.dart';
```
```
class BrandModel {
final String id;
final String name;
final String imageUrl;
final bool isFeatured;
final bool isActive;
final int productsCount;
```
```
BrandModel({
required this.id,
required this.name,
required this.imageUrl,
required this.isFeatured,
required this.isActive,
```



```
required this.productsCount,
});
```
```
factory BrandModel.fromSnapshot(DocumentSnapshot doc) {
final data = doc.data() as Map<String, dynamic>;
```
```
return BrandModel(
id: doc.id,
name: data['name'] ?? '',
imageUrl: data['imageURL'] ?? '',
isFeatured: data['isFeatured'] ?? false,
isActive: data['isActive'] ?? false,
productsCount: data['productsCount'] ?? 0 ,
);
}
```
```
BrandModel copyWith({int? productsCount}) {
return BrandModel(
id: id,
name: name,
imageUrl: imageUrl,
isFeatured: isFeatured,
isActive: isActive,
productsCount: productsCount ?? this.productsCount,);}}
```
## Trong file libs/data/services/brand_service.dart, soạn mã nguồn có nội

## dung như sau:

```
import 'package:flutter/material.dart';
```
```
class BrandCard extends StatelessWidget {
final String imageUrl;
final String brandName;
final int productCount;
final VoidCallback? onTap;
```
```
const BrandCard({
Key? key,
required this.imageUrl,
required this.brandName,
required this.productCount,
this.onTap,
}) : super(key: key);
```
```
@override
Widget build(BuildContext context) {
return GestureDetector(
onTap: onTap,
child: Container(
padding: const EdgeInsets.all( 12 ),
```



```
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 16 ),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.05),
blurRadius: 8 ,
offset: const Offset( 0 , 4 ),
),
],
),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
/// Brand Image
ClipRRect(
borderRadius: BorderRadius.circular( 12 ),
child: Image.network(
imageUrl,
height: 60 ,
width: 60 ,
fit: BoxFit.cover,
),
),
```
```
const SizedBox(height: 12 ),
```
```
/// Brand Name + Verified Icon
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Flexible(
child: Text(
brandName,
style: const TextStyle(
fontSize: 16 ,
fontWeight: FontWeight.bold,
color: Colors.black,
),
overflow: TextOverflow.ellipsis,
),
),
const SizedBox(width: 4 ),
const Icon(Icons.verified, color: Colors.blue, size: 18 ),
],
),
```
```
const SizedBox(height: 6 ),
```
```
/// Product Count
```



```
Text(
'$productCount products',
style: TextStyle(fontSize: 13 , color: Colors.grey.shade600),
),
],
),
),
);
}
}
```
## Trong file libs/data/services/mystore_service.dart, soạn mã nguồn có nội

## dung như sau:

```
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/brand_model.dart';
import '../models/category_model.dart';
import '../models/product_model.dart';
```
```
class MyStoreService {
final _db = FirebaseFirestore.instance;
```
```
/// 1. Featured Brands
Future<List<BrandModel>> getFeaturedBrands() async {
final snapshot = await _db
.collection('brands')
.where('isActive', isEqualTo: true)
.where('isFeatured', isEqualTo: true)
.get();
```
```
return snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
}
```
```
/// 2. Categories
Future<List<CategoryModel>> getCategories() async {
final snapshot = await _db
.collection('categories')
.where('isActive', isEqualTo: true)
.orderBy('priority')
.get();
```
```
return snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
}
```
```
/// 3. Brand by Category (N-N table)
Future<List<String>> getBrandIdsByCategory(String categoryId) async {
final snapshot = await _db
.collection('brand_categories')
.where('categoryId', isEqualTo: categoryId)
```



```
.get();
```
```
return snapshot.docs.map((e) => e['brandId'] as String).toList();
}
```
```
/// 4. Products by category + brand list
Future<List<ProductModel>> getProductsByCategoryAndBrands(
String categoryId,
List<String> brandIds,
) async {
if (brandIds.isEmpty) return [];
```
```
final snapshot = await _db
.collection('products')
.where('categoryIds', arrayContains: categoryId)
.where('brandId', whereIn: brandIds)
.get();
```
```
return snapshot.docs.map((e) {
return ProductModel.fromSnapshot(e, null);
}).toList();
}
}
```
## Trong file libs/screens/mystore/mystore_screen.dart, cập nhật lại mã nguồn

## có nội dung như sau:

```
import 'package:draf_project/controller/mystore_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/product_card.dart';
```
```
import 'all_brand_screen.dart';
import 'brand_detail_screen.dart';
import '/controller/brand_controller.dart';
import '/screens/product/product_by_subcategory_screen.dart';
```
```
class MystoreScreen extends StatelessWidget {
MystoreScreen({super.key});
```
```
final MyStoreController controller = Get.put(MyStoreController());
final AllBrandController brandController = Get.put(AllBrandController());
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.grey[ 50 ], // Đồng bộ màu nền xám nhẹ
body: Obx(() {
if (controller.isLoading.value) {
return const Center(
```



```
child: CircularProgressIndicator(color: Colors.blueAccent),
);
}
```
```
return CustomScrollView(
physics: const BouncingScrollPhysics(),
slivers: [
/// 1. APP BAR GRADIENT (NHẤT QUÁN VỚI HOME)
SliverAppBar(
expandedHeight: 120 ,
pinned: true,
floating: true,
elevation: 0 ,
automaticallyImplyLeading: false,
backgroundColor: Colors.transparent,
flexibleSpace: FlexibleSpaceBar(
background: Container(
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [Colors.blue.shade700, Colors.blue.shade400],
),
borderRadius: const BorderRadius.only(
bottomLeft: Radius.circular( 32 ),
bottomRight: Radius.circular( 32 ),
),
),
child: SafeArea(
child: Padding(
padding: const EdgeInsets.symmetric(horizontal: 24 ),
child: Row(
children: [
const Text(
"Cửa hàng",
style: TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
fontSize: 26 ,
),
),
const Spacer(),
_buildHeaderIcon(Icons.search_rounded, () {}),
const SizedBox(width: 10 ),
_buildHeaderIcon(
Icons.notifications_none_rounded,
() {},
),
],
),
```



### ),

### ),

### ),

### ),

### ),

### /// 2. FEATURED BRANDS

```
_buildSectionTitle(
context,
"Các thương hiệu nổi bật",
onSeeAll: () {
Get.to(() => AllBrandScreen());
},
),
_buildFeaturedBrands(),
```
```
/// 3. CATEGORY TABS (STICKY)
_buildCategoryTabs(),
```
```
/// 4. BRAND BANNERS
_buildSectionTitle(context, "Thương hiệu trong danh mục"),
_buildBrandBanner(),
```
```
/// 5. PRODUCTS
_buildSectionTitle(
context,
"Bạn có thể quan tâm",
onSeeAll: () {
final selectedIndex = controller.selectedCategoryIndex.value;
final selectedCategory =
controller.categories[selectedIndex];
```
```
Get.to(
() => ProductBySubCategoryScreen(
categoryId: selectedCategory.id,
categoryName: selectedCategory.name,
),
);
},
),
_buildProductGrid(),
```
```
// Padding phía dưới cùng
const SliverToBoxAdapter(child: SizedBox(height: 30 )),
],
);
}),
);
}
```



```
/// Nút bấm trên Header mờ mờ đồng bộ
Widget _buildHeaderIcon(IconData icon, VoidCallback onTap) {
return GestureDetector(
onTap: onTap,
child: Container(
padding: const EdgeInsets.all( 8 ),
decoration: BoxDecoration(
color: Colors.white.withOpacity(0.2),
borderRadius: BorderRadius.circular( 12 ),
),
child: Icon(icon, color: Colors.white, size: 24 ),
),
);
}
```
```
Widget _buildSectionTitle(
BuildContext context,
String title, {
VoidCallback? onSeeAll,
}) {
return SliverToBoxAdapter(
child: Padding(
padding: const EdgeInsets.fromLTRB( 24 , 25 , 24 , 10 ),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(
title,
style: const TextStyle(
fontSize: 18 ,
fontWeight: FontWeight.bold,
color: Color(0xFF2D3142),
),
),
if (onSeeAll != null)
TextButton(
onPressed: onSeeAll,
child: const Text(
"Xem tất cả",
style: TextStyle(color: Colors.blue),
),
),
],
),
),
);
}
```
```
/// FEATURED BRANDS
Widget _buildFeaturedBrands() {
```



```
return SliverToBoxAdapter(
child: SizedBox(
height: 120 ,
child: ListView.builder(
padding: const EdgeInsets.symmetric(horizontal: 16 ),
scrollDirection: Axis.horizontal,
physics: const BouncingScrollPhysics(),
itemCount: controller.featuredBrands.length,
itemBuilder: (_, index) {
final brand = controller.featuredBrands[index];
```
```
return GestureDetector(
onTap: () {
Get.to(
() => BrandDetailScreen(
brandId: brand.id,
brandName: brand.name,
),
);
},
child: AnimatedContainer(
duration: const Duration(milliseconds: 300 ),
width: 100 ,
margin: const EdgeInsets.symmetric(horizontal: 8 , vertical:
10 ),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 24 ),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.04),
blurRadius: 10 ,
offset: const Offset( 0 , 4 ),
),
],
),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
CircleAvatar(
radius: 25 ,
backgroundColor: Colors.blue.shade50,
backgroundImage: brand.imageUrl != null
? NetworkImage(brand.imageUrl!)
: null,
),
const SizedBox(height: 8 ),
Text(
brand.name,
style: const TextStyle(
```



```
fontSize: 12 ,
fontWeight: FontWeight.bold,
),
textAlign: TextAlign.center,
maxLines: 1 ,
),
],
),
),
);
},
),
),
);
}
```
```
/// CATEGORY TAB (Sử dụng Blue Theme nhã nhặn hơn)
Widget _buildCategoryTabs() {
return SliverPersistentHeader(
pinned: true,
delegate: _SliverAppBarDelegate(
minHeight: 65 ,
maxHeight: 65 ,
child: Container(
color: Colors.grey[ 50 ],
child: Obx(
() => ListView.builder(
padding: const EdgeInsets.symmetric(vertical: 10 , horizontal:
16 ),
scrollDirection: Axis.horizontal,
physics: const BouncingScrollPhysics(),
itemCount: controller.categories.length,
itemBuilder: (_, index) {
final isSelected =
controller.selectedCategoryIndex.value == index;
return GestureDetector(
onTap: () => controller.selectCategory(index),
child: AnimatedContainer(
duration: const Duration(milliseconds: 250 ),
margin: const EdgeInsets.only(right: 12 ),
padding: const EdgeInsets.symmetric(horizontal: 20 ),
decoration: BoxDecoration(
color: isSelected? Colors.blue.shade600 :
Colors.white,
borderRadius: BorderRadius.circular( 16 ),
boxShadow: isSelected
? [
BoxShadow(
color: Colors.blue.withOpacity(0.3),
blurRadius: 8 ,
```



```
offset: const Offset( 0 , 4 ),
),
]
: [
BoxShadow(
color: Colors.black.withOpacity(0.03),
blurRadius: 4 ,
offset: const Offset( 0 , 2 ),
),
],
),
child: Center(
child: Text(
controller.categories[index].name,
style: TextStyle(
fontWeight: isSelected
? FontWeight.bold
: FontWeight.w500,
color: isSelected
? Colors.white
: Colors.blueGrey.shade600,
),
),
),
),
);
},
),
),
),
),
);
}
```
```
/// BRAND BANNER (Modern Dark Card)
Widget _buildBrandBanner() {
return SliverToBoxAdapter(
child: Column(
children: controller.categoryBrands.map((brand) {
return Container(
margin: const EdgeInsets.symmetric(horizontal: 24 , vertical: 8 ),
padding: const EdgeInsets.all( 20 ),
decoration: BoxDecoration(
gradient: LinearGradient(
colors: [const Color(0xFF232526), const Color(0xFF414345)],
begin: Alignment.topLeft,
end: Alignment.bottomRight,
),
borderRadius: BorderRadius.circular( 24 ),
boxShadow: [
```



```
BoxShadow(
color: Colors.black.withOpacity(0.12),
blurRadius: 15 ,
offset: const Offset( 0 , 8 ),
),
],
),
child: Row(
children: [
Container(
padding: const EdgeInsets.all( 10 ),
decoration: BoxDecoration(
color: Colors.white.withOpacity(0.15),
borderRadius: BorderRadius.circular( 15 ),
),
child: const Icon(
Icons.verified_rounded,
color: Colors.blueAccent,
size: 28 ,
),
),
const SizedBox(width: 16 ),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
brand.name,
style: const TextStyle(
color: Colors.white,
fontSize: 18 ,
fontWeight: FontWeight.bold,
),
),
const Text(
"Cửa hàng chính hãng",
style: TextStyle(color: Colors.white60, fontSize:
12 ),
),
],
),
),
Material(
color: Colors.white,
borderRadius: BorderRadius.circular( 12 ),
child: InkWell(
onTap: () {},
borderRadius: BorderRadius.circular( 12 ),
child: const Padding(
padding: EdgeInsets.symmetric(
```



```
horizontal: 16 ,
vertical: 8 ,
),
child: Text(
"Theo dõi",
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 13 ,
),
),
),
),
),
],
),
);
}).toList(),
),
);
}
```
```
/// PRODUCT GRID (Đồng bộ tỉ lệ 0.65)
Widget _buildProductGrid() {
return SliverPadding(
padding: const EdgeInsets.symmetric(horizontal: 24 , vertical: 10 ),
sliver: SliverGrid(
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2 ,
mainAxisSpacing: 16 ,
crossAxisSpacing: 16 ,
childAspectRatio: 0.65, // Tỉ lệ giống trang chủ và trang Popular
),
delegate: SliverChildBuilderDelegate(
(_, index) => ProductCard(product: controller.products[index]),
childCount: controller.products.length,
),
),
);
}
}
```
```
/// Helper class for Sticky Headers
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
_SliverAppBarDelegate({
required this.minHeight,
required this.maxHeight,
required this.child,
});
final double minHeight;
final double maxHeight;
```



```
final Widget child;
```
```
@override
double get minExtent => minHeight;
@override
double get maxExtent => maxHeight;
```
```
@override
Widget build(
BuildContext context,
double shrinkOffset,
bool overlapsContent,
) {
return SizedBox.expand(child: child);
}
```
```
@override
bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
return maxHeight != oldDelegate.maxHeight ||
minHeight != oldDelegate.minHeight ||
child != oldDelegate.child;
}
}
```
## Trong file libs/screens/mystore/brand_detail_screen.dart, cập nhật lại

## mã nguồn có nội dung như sau:

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/product_card.dart';
import '../../controller/brand_controller.dart';
```
```
class BrandDetailScreen extends StatefulWidget {
final String brandId;
final String brandName;
```
```
const BrandDetailScreen({
super.key,
required this.brandId,
required this.brandName,
});
```
```
@override
State<BrandDetailScreen> createState() => _BrandDetailScreenState();
}
```
```
class _BrandDetailScreenState extends State<BrandDetailScreen> {
late AllBrandController controller;
```



```
// Cấu hình filter để đồng bộ với các màn hình trước
final Map<String, String> _filterMap = {
'Tên A-Z': 'name',
'Giá thấp → cao': 'low_price',
'Giá cao → thấp': 'high_price',
};
```
```
@override
void initState() {
super.initState();
controller = Get.find<AllBrandController>();
```
```
WidgetsBinding.instance.addPostFrameCallback((_) {
controller.fetchProductsByBrand(widget.brandId);
});
}
```
```
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.grey[ 50 ],
body: Obx(() {
if (controller.isLoading.value) {
return const Center(
child: CircularProgressIndicator(
valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
),
);
}
```
```
return CustomScrollView(
physics: const BouncingScrollPhysics(),
slivers: [
/// 1. APPBAR GRADIENT NHẤT QUÁN
SliverAppBar(
pinned: true,
expandedHeight: 100 ,
backgroundColor: Colors.blue.shade700,
elevation: 0 ,
iconTheme: const IconThemeData(color: Colors.white),
centerTitle: true,
title: Text(
widget.brandName,
style: const TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
fontSize: 18 ,
),
),
flexibleSpace: Container(
```



```
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [Colors.blue.shade700, Colors.blue.shade400],
),
),
),
),
```
### /// 2. BRAND PROFILE CARD (LÀM MỚI SINH ĐỘNG)

```
SliverToBoxAdapter(
child: Obx(() {
final brand = controller.brands.firstWhereOrNull(
(b) => b.id == widget.brandId,
);
```
```
if (brand == null) return const SizedBox();
```
```
return Container(
margin: const EdgeInsets.fromLTRB( 16 , 20 , 16 , 10 ),
padding: const EdgeInsets.all( 20 ),
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular( 20 ),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.06),
blurRadius: 15 ,
offset: const Offset( 0 , 8 ),
),
],
),
child: Row(
children: [
/// Logo với hiệu ứng viền
Container(
padding: const EdgeInsets.all( 3 ),
decoration: BoxDecoration(
shape: BoxShape.circle,
border: Border.all(
color: Colors.blue.shade100,
width: 2 ,
),
),
child: CircleAvatar(
radius: 35 ,
backgroundColor: Colors.blue[ 50 ],
backgroundImage: brand.imageUrl != null
? NetworkImage(brand.imageUrl!)
```



```
: null,
child: brand.imageUrl == null
? Icon(
Icons.store,
size: 35 ,
color: Colors.blue.shade300,
)
: null,
),
),
const SizedBox(width: 20 ),
```
```
/// Thông tin Brand
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
children: [
Flexible(
child: Text(
brand.name,
style: const TextStyle(
fontSize: 22 ,
fontWeight: FontWeight.bold,
color: Color(0xFF2D2D2D),
),
overflow: TextOverflow.ellipsis,
),
),
const SizedBox(width: 8 ),
const Icon(
Icons.verified,
color: Colors.blue,
size: 20 ,
),
],
),
const SizedBox(height: 8 ),
Container(
padding: const EdgeInsets.symmetric(
horizontal: 10 ,
vertical: 4 ,
),
decoration: BoxDecoration(
color: Colors.blue.shade50,
borderRadius: BorderRadius.circular( 12 ),
),
child: Text(
```



```
"${controller.brandProducts.length} sản
phẩm",
style: TextStyle(
color: Colors.blue.shade700,
fontSize: 12 ,
fontWeight: FontWeight.w600,
),
),
),
],
),
),
],
),
);
}),
),
```
### /// 3. FILTER CHIPS (THAY THẾ DROPDOWN)

```
SliverToBoxAdapter(
child: Container(
padding: const EdgeInsets.symmetric(vertical: 12 ),
child: SingleChildScrollView(
scrollDirection: Axis.horizontal,
padding: const EdgeInsets.symmetric(horizontal: 16 ),
physics: const BouncingScrollPhysics(),
child: Row(
children: _filterMap.keys.map((filterName) {
final isSelected =
controller.selectedSort.value ==
_filterMap[filterName];
return Padding(
padding: const EdgeInsets.only(right: 10 ),
child: ChoiceChip(
label: Text(filterName),
selected: isSelected,
selectedColor: Colors.blue.shade600,
backgroundColor: Colors.white,
labelStyle: TextStyle(
color: isSelected
? Colors.white
: Colors.grey.shade700,
fontWeight: isSelected
? FontWeight.bold
: FontWeight.normal,
fontSize: 13 ,
),
elevation: isSelected? 4 : 0 ,
pressElevation: 2 ,
shape: RoundedRectangleBorder(
```



```
borderRadius: BorderRadius.circular( 20 ),
side: BorderSide(
color: isSelected
? Colors.blue.shade600
: Colors.grey.shade200,
),
),
onSelected: (bool selected) {
if (selected) {
controller.sortBrandProducts(
_filterMap[filterName]!,
);
}
},
),
);
}).toList(),
),
),
),
),
```
### /// 4. GRID PRODUCT NHẤT QUÁN

```
SliverPadding(
padding: const EdgeInsets.symmetric(horizontal: 16 , vertical:
8 ),
sliver: SliverGrid(
gridDelegate: const
SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2 ,
crossAxisSpacing: 16 ,
mainAxisSpacing: 16 ,
childAspectRatio:
0.65, // Khớp hoàn toàn với HomeScreen & PopularScreen
),
delegate: SliverChildBuilderDelegate((context, index) {
final product = controller.brandProducts[index];
return ProductCard(product: product);
}, childCount: controller.brandProducts.length),
),
),
```
```
/// Khoảng trống cuối trang
const SliverToBoxAdapter(child: SizedBox(height: 40 )),
],
);
}),
);
}
```



### }

## Trong file libs/screens/mystore/all_brand_screen.dart, cập nhật lại mã

## nguồn có nội dung như sau:

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/brand_card.dart';
import '../../controller/brand_controller.dart';
import '../../data/models/brand_model.dart';
import 'brand_detail_screen.dart';
```
```
class AllBrandScreen extends StatelessWidget {
AllBrandScreen({super.key});
```
```
final AllBrandController controller = Get.put(AllBrandController());
```
```
@override
Widget build(BuildContext context) {
// Kiểm tra chế độ sáng/tối để điều chỉnh màu nền bổ trợ
final isDark = Theme.of(context).brightness == Brightness.dark;
```
```
return Scaffold(
// Màu nền xám nhạt đồng bộ với các màn hình trước đó
backgroundColor: isDark? Colors.black : Colors.grey[ 50 ],
```
```
body: CustomScrollView(
physics: const BouncingScrollPhysics(),
slivers: [
/// 1. APP BAR VỚI GRADIENT ĐỒNG NHẤT
SliverAppBar(
pinned: true,
expandedHeight: 100 ,
stretch: true,
backgroundColor: Colors.blue.shade700,
elevation: 0 ,
centerTitle: true,
iconTheme: const IconThemeData(color: Colors.white),
flexibleSpace: FlexibleSpaceBar(
centerTitle: true,
title: const Text(
'Thương hiệu phổ biến',
style: TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
fontSize: 18 ,
),
),
background: Container(
```



```
decoration: BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [Colors.blue.shade700, Colors.blue.shade400],
),
),
),
),
),
```
```
/// 2. NỘI DUNG CHÍNH
SliverPadding(
padding: const EdgeInsets.fromLTRB( 16 , 20 , 16 , 20 ),
sliver: Obx(() {
// Trạng thái đang tải dữ liệu
if (controller.isLoading.value) {
return const SliverFillRemaining(
child: Center(
child: CircularProgressIndicator(
valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
),
),
);
}
```
```
// Trạng thái không có thương hiệu nào
if (controller.brands.isEmpty) {
return SliverFillRemaining(
child: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
Icons.verified_outlined,
size: 80 ,
color: Colors.grey.shade300,
),
const SizedBox(height: 16 ),
Text(
"Không tìm thấy thương hiệu nào",
style: TextStyle(
color: Colors.grey.shade600,
fontSize: 16 ,
),
),
],
),
),
);
```



### }

```
// Hiển thị danh sách thương hiệu
return SliverList(
delegate: SliverChildListDelegate([
/// Thông tin số lượng thương hiệu
Row(
children: [
Container(
width: 4 ,
height: 16 ,
decoration: BoxDecoration(
color: Colors.blue.shade700,
borderRadius: BorderRadius.circular( 2 ),
),
),
const SizedBox(width: 8 ),
Text(
"Tìm thấy ${controller.brands.length} thương hiệu",
style: TextStyle(
color: isDark? Colors.grey[ 400 ] :
Colors.grey[ 700 ],
fontWeight: FontWeight.bold,
fontSize: 15 ,
),
),
],
),
const SizedBox(height: 20 ),
```
```
/// Grid Thương hiệu
GridView.builder(
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
itemCount: controller.brands.length,
gridDelegate: const
SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2 ,
crossAxisSpacing: 16 ,
mainAxisSpacing: 16 ,
childAspectRatio:
1.1, // Điều chỉnh lại tỉ lệ để BrandCard cân đối
hơn
),
itemBuilder: (context, index) {
final brand = controller.brands[index];
```
```
return Container(
decoration: BoxDecoration(
color: isDark? Colors.grey[ 900 ] : Colors.white,
```



```
borderRadius: BorderRadius.circular( 20 ),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.04),
blurRadius: 15 ,
offset: const Offset( 0 , 8 ),
),
],
),
child: ClipRRect(
borderRadius: BorderRadius.circular( 20 ),
child: Material(
color: Colors.transparent,
child: InkWell(
onTap: () {
Get.to(
() => BrandDetailScreen(
brandId: brand.id,
brandName: brand.name,
),
);
},
child: BrandCard(
imageUrl: brand.imageUrl,
brandName: brand.name,
productCount: brand.productsCount,
// Chú ý: Nếu BrandCard của bạn đã có onTap
bên trong,
// hãy đảm bảo không bị xung đột với InkWell
ở đây.
),
),
),
),
);
},
),
]),
);
}),
),
],
),
);
}
}
```



## 15. Thiết kế và phát triển nhóm chức năng cho phép người dùng cài đặt ứng dụng tùy ý

## Trong file libs/utils/preferences_helper.dart, cập nhật lại mã nguồn có nội

## dung như sau:

```
import 'package:shared_preferences/shared_preferences.dart';
```
```
class PreferencesHelper {
static const String rememberMeKey = 'remember_me';
static const String emailKey = 'saved_email';
```
### // NEW KEYS

```
static const String themeKey = 'app_theme';
static const String fontSizeKey = 'font_size';
static const String languageKey = 'language';
```
### /// ===== REMEMBER ME =====

```
static Future<void> saveRememberMe(bool rememberMe, String email) async {
final SharedPreferences prefs = await SharedPreferences.getInstance();
```
```
await prefs.setBool(rememberMeKey, rememberMe);
```
```
if (rememberMe) {
await prefs.setString(emailKey, email);
} else {
await prefs.remove(emailKey);
}
}
```
```
static Future<bool> getRememberMe() async {
final SharedPreferences prefs = await SharedPreferences.getInstance();
return prefs.getBool(rememberMeKey) ?? false;
}
```
```
static Future<String?> getSavedEmail() async {
final SharedPreferences prefs = await SharedPreferences.getInstance();
return prefs.getString(emailKey);
}
```
### /// ===== THEME =====

```
static Future<void> setTheme(String value) async {
final prefs = await SharedPreferences.getInstance();
await prefs.setString(themeKey, value);
}
```
```
static Future<String> getTheme() async {
final prefs = await SharedPreferences.getInstance();
return prefs.getString(themeKey) ?? 'system';
```



### }

### /// ===== FONT SIZE =====

```
static Future<void> setFontSize(String value) async {
final prefs = await SharedPreferences.getInstance();
await prefs.setString(fontSizeKey, value);
}
```
```
static Future<String> getFontSize() async {
final prefs = await SharedPreferences.getInstance();
return prefs.getString(fontSizeKey) ?? 'medium';
}
```
### /// ===== LANGUAGE =====

```
static Future<void> setLanguage(String value) async {
final prefs = await SharedPreferences.getInstance();
await prefs.setString(languageKey, value);
}
```
```
static Future<String> getLanguage() async {
final prefs = await SharedPreferences.getInstance();
return prefs.getString(languageKey) ?? 'vi';
}
}
```
## Trong file libs/controller/settings_controller.dart, soạn mã nguồn có nội

## dung như sau:

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/preferences_helper.dart';
```
```
class SettingsController extends GetxController {
var themeMode = ThemeMode.system.obs;
var fontSize = 'medium'.obs;
var locale = const Locale('vi').obs;
```
```
@override
void onInit() {
super.onInit();
loadSettings();
}
```
```
Future<void> loadSettings() async {
// THEME
String theme = await PreferencesHelper.getTheme();
if (theme == 'light') {
themeMode.value = ThemeMode.light;
} else if (theme == 'dark') {
```



```
themeMode.value = ThemeMode.dark;
} else {
themeMode.value = ThemeMode.system;
}
```
### // FONT

```
fontSize.value = await PreferencesHelper.getFontSize();
```
```
// LANGUAGE
String lang = await PreferencesHelper.getLanguage();
locale.value = Locale(lang);
Get.updateLocale(locale.value);
}
```
```
void changeTheme(String value) async {
await PreferencesHelper.setTheme(value);
```
```
if (value == 'light') {
themeMode.value = ThemeMode.light;
} else if (value == 'dark') {
themeMode.value = ThemeMode.dark;
} else {
themeMode.value = ThemeMode.system;
}
}
```
```
void changeFontSize(String value) async {
await PreferencesHelper.setFontSize(value);
fontSize.value = value;
}
```
```
void changeLanguage(String value) async {
await PreferencesHelper.setLanguage(value);
locale.value = Locale(value);
Get.updateLocale(locale.value);}}
```
## Trong file libs/app/app.dart, cập nhật lại mã nguồn có nội dung như sau:

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../controller/settings_controller.dart';
```
```
class MyApp extends StatelessWidget {
MyApp({super.key});
```
```
final SettingsController settingsController =
Get.put(SettingsController());
```
```
@override
Widget build(BuildContext context) {
```



```
return Obx(() {
return GetMaterialApp(
title: 'Flutter E-Commerce',
debugShowCheckedModeBanner: false,
```
### // LANGUAGE

```
locale: settingsController.locale.value,
```
```
// THEME
themeMode: settingsController.themeMode.value,
```
```
theme: ThemeData(
scaffoldBackgroundColor: Colors.white,
canvasColor: Colors.white,
appBarTheme: const AppBarTheme(
backgroundColor: Colors.white,
elevation: 0 ,
foregroundColor: Colors.black,
),
),
```
```
darkTheme: ThemeData.dark(),
```
```
initialRoute: AppRoutes.splash,
routes: AppRoutes.routes,
);
});
}
}
```
## Trong file libs/common/styles/app_text_styles.dart, cập nhật lại mã nguồn

## có nội dung như sau:

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/settings_controller.dart';
import 'app_colors.dart';
```
```
class AppTextStyle {
static double get scale {
final controller = Get.find<SettingsController>();
```
```
switch (controller.fontSize.value) {
case 'small':
return 0.9;
case 'large':
return 1.2;
default:
return 1.0;
}
```



### }

```
static TextStyle title = TextStyle(
fontSize: 22 * scale,
fontWeight: FontWeight.bold,
color: AppColors.dark,
);
```
```
static TextStyle subtitle = TextStyle(
fontSize: 14 * scale,
color: AppColors.grey,
);
```
```
static TextStyle whiteTitle = TextStyle(
fontSize: 20 * scale,
fontWeight: FontWeight.bold,
color: Colors.white,
);
```
```
static TextStyle whiteSubtitle = TextStyle(
fontSize: 14 * scale,
color: Colors.white70,
);
}
```
## Trong file libs/main.dart, cập nhật lại mã nguồn có nội dung như sau:

```
import 'package:draf_project/controller/cart_controller.dart';
import 'package:draf_project/controller/notification_controller.dart';
import 'package:draf_project/controller/order_controller.dart';
import 'package:draf_project/controller/wishlist_controller.dart';
import 'package:draf_project/controller/settings_controller.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'controller/login_controller.dart';
```
```
void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
```
```
Get.put(AuthController());
Get.put(NotificationController());
Get.put(CartController());
Get.put(OrderController());
Get.put(WishlistController());
```
```
Get.put(SettingsController());
```
```
runApp(MyApp());
```



### }

## Trong file libs/screens/profile/profile_screen.dart, cập nhật lại mã nguồn

## có nội dung như sau:

```
import
'package:draf_project/screens/shipping_address/my_shipping_address_screen.dar
t';
import 'package:flutter/material.dart';
import '../../common/styles/app_colors.dart';
import '../../common/styles/app_text_styles.dart';
import '../../common/widgets/profile_menu_item.dart';
import '../../routes/app_routes.dart';
import '../order/my_order_screen.dart';
import '../bank_account/my_bank_account_screen.dart';
import '../notifications/my_notifications.dart';
import 'package:get/get.dart';
import 'package:draf_project/controller/login_controller.dart';
import 'package:draf_project/controller/settings_controller.dart';
```
```
class ProfileScreen extends StatelessWidget {
const ProfileScreen({super.key});
```
```
@override
Widget build(BuildContext context) {
return GetBuilder<AuthController>(
builder: (authController) {
bool loggedIn = authController.currentUser != null;
```
```
if (!loggedIn) {
return _buildGuestProfile(context);
}
```
```
return _buildUserProfile(context, authController);
},
);
}
```
```
/// ===== Header =====
Widget _buildHeader(BuildContext context, AuthController authController) {
final user = authController.currentUser;
```
```
String fullName = '';
String email = '';
```
```
if (user != null) {
fullName = '${user.firstName} ${user.lastName}';
email = user.email;
}
```



```
return Container(
width: double.infinity,
padding: const EdgeInsets.fromLTRB( 20 , 60 , 20 , 30 ),
color: AppColors.primaryBlue,
child: Row(
children: [
const CircleAvatar(
radius: 32 ,
backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
),
const SizedBox(width: 16 ),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(fullName, style: AppTextStyle.whiteTitle),
const SizedBox(height: 4 ),
Text(email, style: AppTextStyle.whiteSubtitle),
],
),
),
IconButton(
onPressed: () {
Navigator.pushNamed(context, AppRoutes.updateAccount);
},
icon: const Icon(Icons.edit, color: Colors.white),
),
],
),
);
}
```
```
Widget _buildUserProfile(
BuildContext context,
AuthController authController,
) {
final AuthController authController = Get.find<AuthController>();
```
```
return Scaffold(
backgroundColor: AppColors.background,
body: Column(
children: [
_buildHeader(context, authController),
Expanded(
child: SingleChildScrollView(
child: Container(
padding: const EdgeInsets.all( 20 ),
decoration: const BoxDecoration(
color: AppColors.white,
```



```
borderRadius: BorderRadius.only(
topLeft: Radius.circular( 24 ),
topRight: Radius.circular( 24 ),
),
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
_buildAccountSetting(context),
const SizedBox(height: 24 ),
```
```
/// APP SETTINGS HERE
_buildAppSettingLabel(),
const SizedBox(height: 16 ),
_buildAppSettings(),
```
```
const SizedBox(height: 24 ),
_buildLogoutButton(context),
],
),
),
),
),
],
),
);
}
```
```
/// ===== Account Setting =====
Widget _buildAccountSetting(BuildContext context) {
return Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('Cài đặt tài khoản', style: AppTextStyle.title),
const SizedBox(height: 16 ),
```
```
ProfileMenuItem(
icon: Icons.location_on,
title: 'Địa chỉ của tôi',
subtitle: 'Quản lý địa chỉ giao hàng',
onTap: () {
Navigator.push(
context,
MaterialPageRoute(builder: (_) => MyShippingAddressScreen()),
);
},
),
```
```
ProfileMenuItem(
icon: Icons.shopping_cart,
```



```
title: 'Giỏ hàng của tôi',
subtitle: 'Xem các mặt hàng trong giỏ hàng',
onTap: () {
Navigator.pushNamed(context, AppRoutes.cartOverview);
},
),
```
```
ProfileMenuItem(
icon: Icons.receipt_long,
title: 'Đơn hàng của tôi',
subtitle: 'Theo dõi đơn hàng của bạn',
onTap: () {
Navigator.push(
context,
MaterialPageRoute(builder: (_) => const MyOrderScreen()),
);
},
),
```
```
ProfileMenuItem(
icon: Icons.account_balance,
title: 'Tài khoản ngân hàng',
subtitle: 'Quản lý phương thức thanh toán',
onTap: () {
Navigator.push(
context,
MaterialPageRoute(builder: (_) => MyBankAccountScreen()),
);
},
),
```
```
ProfileMenuItem(
icon: Icons.notifications,
title: 'Thông báo',
subtitle: 'Cài đặt thông báo',
onTap: () {
Navigator.push(
context,
MaterialPageRoute(builder: (_) => MyNotificationScreen()),
);
},
),
],
);
}
```
### /// ===== LABEL =====

```
Widget _buildAppSettingLabel() {
return Text('Cài đặt ứng dụng', style: AppTextStyle.title);
}
```



### /// ===== SETTINGS =====

```
Widget _buildAppSettings() {
final controller = Get.find<SettingsController>();
```
```
return Obx(
() => Column(
children: [
ProfileMenuItem(
icon: Icons.dark_mode,
title: 'Giao diện',
subtitle: controller.themeMode.value.name,
onTap: () => _showThemeDialog(controller),
),
ProfileMenuItem(
icon: Icons.text_fields,
title: 'Cỡ chữ',
subtitle: controller.fontSize.value,
onTap: () => _showFontDialog(controller),
),
ProfileMenuItem(
icon: Icons.language,
title: 'Ngôn ngữ',
subtitle: controller.locale.value.languageCode,
onTap: () => _showLanguageDialog(controller),
),
],
),
);
}
```
```
/// ===== LOGOUT =====
Widget _buildLogoutButton(BuildContext context) {
final AuthController authController = Get.find<AuthController>();
```
```
return Padding(
padding: const EdgeInsets.only(top: 16 ),
child: GestureDetector(
onTap: () async {
bool? confirm = await showDialog<bool>(
context: context,
builder: (dialogContext) {
return AlertDialog(
title: const Text('Đăng xuất'),
content: const Text('Bạn có chắc muốn đăng xuất không?'),
actions: [
TextButton(
onPressed: () => Navigator.pop(dialogContext, false),
child: const Text('Hủy'),
),
```



```
TextButton(
onPressed: () => Navigator.pop(dialogContext, true),
child: const Text(
'Đăng xuất',
style: TextStyle(color: Colors.red),
),
),
],
);
},
);
```
```
if (confirm == true) {
await authController.logout();
```
```
Navigator.pushNamedAndRemoveUntil(
context,
AppRoutes.home,
(route) => false,
);
}
},
child: Container(
width: double.infinity,
padding: const EdgeInsets.symmetric(vertical: 16 ),
decoration: BoxDecoration(
border: Border.all(color: Colors.red),
borderRadius: BorderRadius.circular( 12 ),
),
child: const Center(
child: Text(
'Đăng xuất',
style: TextStyle(
color: Colors.red,
fontSize: 16 ,
fontWeight: FontWeight.bold,
),
),
),
),
),
);
}
}
```
### /// ===== GUEST =====

```
Widget _buildGuestProfile(BuildContext context) {
return Scaffold(
backgroundColor: AppColors.background,
body: Column(
```



```
children: [
Container(
width: double.infinity,
padding: const EdgeInsets.fromLTRB( 20 , 60 , 20 , 30 ),
color: AppColors.primaryBlue,
child: Column(
children: [
const CircleAvatar(
radius: 40 ,
child: Icon(Icons.person, size: 40 ),
),
const SizedBox(height: 16 ),
const Text(
'Guest User',
style: TextStyle(
fontSize: 20 ,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
const SizedBox(height: 16 ),
ElevatedButton(
onPressed: () {
Navigator.pushNamed(context, AppRoutes.login);
},
child: const Text('Đăng nhập ngay'),
),
],
),
),
],
),
);
}
```
```
/// ===== DIALOGS =====
void _showThemeDialog(SettingsController controller) {
Get.defaultDialog(
title: "Chọn Giao diện",
content: Column(
children: [
ListTile(
title: const Text("Sáng"),
onTap: () {
controller.changeTheme('light');
Get.back();
},
),
ListTile(
title: const Text("Tối"),
```



```
onTap: () {
controller.changeTheme('dark');
Get.back();
},
),
ListTile(
title: const Text("Theo hệ thống"),
onTap: () {
controller.changeTheme('system');
Get.back();
},
),
],
),
);
}
```
```
void _showFontDialog(SettingsController controller) {
Get.defaultDialog(
title: "Cỡ chữ",
content: Column(
children: [
ListTile(
title: const Text("Nhỏ"),
onTap: () {
controller.changeFontSize('small');
Get.back();
},
),
ListTile(
title: const Text("Vừa"),
onTap: () {
controller.changeFontSize('medium');
Get.back();
},
),
ListTile(
title: const Text("Lớn"),
onTap: () {
controller.changeFontSize('large');
Get.back();
},
),
],
),
);
}
```
```
void _showLanguageDialog(SettingsController controller) {
Get.defaultDialog(
```



```
title: "Ngôn ngữ",
content: Column(
children: [
ListTile(
title: const Text("Tiếng Việt"),
onTap: () {
controller.changeLanguage('vi');
Get.back();
},
),
ListTile(
title: const Text("English"),
onTap: () {
controller.changeLanguage('en');
Get.back();
},
),
],
),
);
}
```

