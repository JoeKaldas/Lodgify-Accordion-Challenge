import 'package:get/get.dart';
import '../bindings/task_binding.dart';
import '../ui/screens/tasks_screen.dart';

class RouterPages {
  static final route = [
    GetPage(
      name: TasksScreen.routeName,
      page: () => const TasksScreen(),
      binding: TaskBinding(),
    ),
  ];
}
