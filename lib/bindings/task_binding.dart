import 'package:get/get.dart';
import '../controllers/tasks_controller.dart';

class TaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TasksController>(() => TasksController());
  }
}
