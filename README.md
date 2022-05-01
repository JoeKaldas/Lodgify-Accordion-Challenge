# flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Libraries Used

- [Dio: For Network requests](https://pub.dev/packages/dio)
- [GetX: For state management](https://pub.dev/packages/get)

### Project Structure
- Base: has any base classes (for network, models, etc..)
- Bindings: Binding controllers to screens
- Controllers: Handles all the logic for a screen
- Models: Classes that represents the objects
- Network: Any network classes (Endpoints variables, Interceptors, Network Manager instance itself, Object Parser)
- Repo: Any API calls
- UI: split into screens and widgets
- Utils: Consts (for colors, spacings, etc..), Modals (any popups shown in app), Router Pages (App routing)

### State management
GetX was used for how easy it is to make a variable observable and listen to its changes in the widget. And only parts of widget affected by this variable is wrapped in Obx and thus only those parts rebuild.