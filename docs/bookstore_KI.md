# Bookstore App Architectural Patterns & Common Pitfalls

This Knowledge Item documents the established architectural patterns and common compilation/runtime pitfalls found and fixed in the Bookstore application.

## 1. Dependency Injection (GetX)
The application uses GetX for dependency injection. The order of registration in `Bindings` is critical:
1. **Services**: raw IO (e.g., `BookFirestoreService`).
2. **Repositories**: data orchestration (e.g., `BookRepository`).
3. **Controllers**: business logic (e.g., `BookCatalogController`).

### Pitfall: Constructor Mismatch
Ensure that `Bindings` pass the required service/repository instances to constructors. Avoid `Get.put(Controller(Get.find()))` inside UI screens if the controller is already registered in a binding. Use `Get.find<Controller>()` instead to maintain singleton state.

## 2. State Management (Rx Variables)
### Pitfall: `.value` Access
When using `Rx` or `Rxn` variables (e.g., `Rxn<UserModel> currentUser`), always access the underlying data via `.value`.
- **Incorrect**: `authController.currentUser.id`
- **Correct**: `authController.currentUser.value?.id`

### Pitfall: Reactive Listeners
Use `ever(rxVariable, (callback))` to react to state changes. Ensure the callback parameter is correctly typed to avoid runtime errors during state updates.

## 3. Data Models Consistency
The application follows a strict `Model -> Repository -> Controller -> Screen` flow.
- **OrderModel**: Requires `id`, `userId`, and `total` (not `totalAmount`).
- **UserModel**: Use `fullName` getter instead of concatenated strings in multiple places.
- **BrandModel**: Map only to valid fields (`imageUrl`, `name`, `productsCount`, `isFeatured`). Avoid speculative properties like `description` or `rating` unless added to the model and Firestore schema.

## 4. Navigation & Routes
Always use named routes defined in `AppRoutes` and `AppPages`.
- **Incorrect**: `Get.to(ProductDetailScreen(product: book))`
- **Correct**: `Get.toNamed(AppRoutes.productDetail, arguments: book)`

## 5. External Dependencies
- **timeago**: Used for formatting timestamps (e.g., "5 minutes ago").
  - Must be initialized in `main.dart`: `timeago.setLocaleMessages('vi', timeago.ViMessages());`
  - Usage in UI: `timeago.format(dateTime, locale: 'vi')`

## 6. Coding Rules (Mandatory)
- No hardcoded `userId`.
- No color gradients (unless specified in `AppColors`).
- Use `GetX` for everything (routing, state, DI).
- Separation of concerns: UI screens only listen to state; Controllers call Repositories; Repositories call Services.
