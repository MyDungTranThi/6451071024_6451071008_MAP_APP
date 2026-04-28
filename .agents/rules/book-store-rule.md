---
trigger: always_on
---


# S-Store (Book Store) - Coding Rules & Architecture

## 1. Architecture & State Management
- **Framework:** Flutter.
- **State Management:** GetX 100%. Use GetX for state management, routing, and dependency injection (Bindings).
- **Separation of Concerns:** 
  - `screens/`: Contains only UI Widgets. No business logic (API calls, Firebase operations). UI only listens to state.
  - `controller/`: Contains business logic/state for screen workflows, and **must call repositories only**.
  - `data/repositories/`: Layer between controllers and services. Handles data orchestration, mapping/transform, fallback strategy.
  - `data/services/`: Handles raw IO (Firebase/API/local storage) only. No UI/controller logic.
  - `data/models/`: Dart Object modeling (JSON serialization).

### Repository Rule (mandatory)
- `controller/` must **not** import or call classes in `data/services/` directly.
- Dependency flow must be: `screens` → `controller` → `repository` → `service`.
- Any new Firebase operation must be exposed through a repository before being used by a controller.

## 2. Navigation
- **Rule:** Never use vanilla `Navigator.push`. 
- **Usage:** 
  - Navigate: `Get.toNamed(AppRoutes.routeName)`
  - Navigate and replace: `Get.offNamed(...)` or `Get.offAllNamed(...)`
- All routes must be defined as `static const String` constants in `lib/routes/app_routes.dart`.
- All pages must have their Bindings registered in `AppPages.pages` (`lib/routes/app_pages.dart`).

## 3. Naming Conventions
- **Files/Directories:** `snake_case` (e.g., `home_screen.dart`, `app_colors.dart`).
- **Classes/Models:** `PascalCase` (e.g., `HomeScreen`, `BookModel`, `AuthController`).
- **Variables/Functions:** `camelCase` (e.g., `fetchBooks()`, `userData`).

## 4. UI & Design System
- **Colors & Fonts:** Only use predefined colors in `AppColors` and typography in `AppTextStyle`. NO hardcoded hex colors or direct `fontSize` outside the common style files.
- **Widgets:** Reusable widgets (buttons, inputs) must be placed in `lib/common/widgets/` (e.g., `PrimaryButton`, `ProgressDots`).

## 5. Domain Specifics (Book Store)
- **Data Model:** Products are Books (`BookModel`).
- **Attributes:** Must include `title`, `author` (Tác giả), `publisher` (Nhà xuất bản), `genre` (Thể loại), `pages` (Số trang), `price`, `coverImage`.
- **Variations:** Instead of Size/Color, book variations are: Paperback (Bìa mềm), Hardcover (Bìa cứng), E-book.

## 6. Code Reusability & Bootstrapping
- **MUST REUSE CODE:** Tận dụng tối đa mã nguồn (source code) có sẵn trong tài liệu `Tài liệu thực hành (Xây app).md` (ví dụ: `AppColors`, `AppTextStyle`, `PrimaryButton`, `ProgressDots`, `SplashScreen`, `OnboardingScreen`, cấu trúc `AppRoutes`, `main.dart`, v.v.) để xây dựng khung ứng dụng nhanh nhất có thể. Chỉ thay đổi nội dung text/hình ảnh cho phù hợp với chủ đề Book Store.