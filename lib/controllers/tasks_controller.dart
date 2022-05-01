import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:lodgify/models/task.dart';

import 'package:lodgify/models/task_group.dart';
import 'package:lodgify/repo/task_repo.dart';
import 'package:lodgify/utils/consts.dart';

class TasksController extends GetxController {
  final TaskRepo _taskRepo = TaskRepo();
  final _tasksGroups = <TaskGroup>[].obs;

  final _progressValue = 0.0.obs;

  List<TaskGroup> get tasksGroups {
    return _tasksGroups;
  }

  double get progressValue {
    return _progressValue.value;
  }

  double get containerWidth {
    // Screen size - 80 screen padding - 40 screen margin - 40/0 according to screen size - 2 progress border
    final double leftMargin = GetPlatform.isDesktop ? 40 : 0;
    return Get.width - 80 - 40 - leftMargin - 2;
  }

  double get progressTextWidth {
    double width = progressValue * containerWidth / 100.0;
    if (width < 20) {
      width = 20;
    }
    return width;
  }

  int get tasksSum {
    // Map by task value, flatten list and sum
    return tasksGroups
        .map((g) => g.tasks.map((t) => t.value))
        .expand((i) => i)
        .toList()
        .sum;
  }

  void setProgressValue() {
    _progressValue.value = 0;
    final List<int> list = tasksGroups
        .map(
            (g) => g.tasks.where((t) => t.checked).map((t) => t.value).toList())
        .expand((e) => e)
        .toList();
    for (final t in list) {
      _progressValue.value += t * 100.0 / tasksSum;
    }
    _progressValue.value = _progressValue.value.roundToDouble();
  }

  Future<void> loadTaskGroups() async {
    try {
      final List<TaskGroup> response = await _taskRepo.getTasks();
      _tasksGroups.assignAll(response);
      setProgressValue();
    } catch (e, stacktrace) {
      logger.e(e);
      logger.e(stacktrace);
    }
  }

  void toggleTaskGroup(int index, bool isExpanded) {
    final TaskGroup taskGroup = tasksGroups[index];
    taskGroup.isExpanded = !isExpanded;
    tasksGroups[index] = taskGroup;
  }

  void toggleTask(int taskGroupIndex, int taskIndex, bool? isChecked) {
    final TaskGroup taskGroup = tasksGroups[taskGroupIndex];
    final Task task = tasksGroups[taskGroupIndex].tasks[taskIndex];
    // Toggle checked
    task.checked = isChecked ?? false;
    // Update task in tasks list
    taskGroup.tasks[taskIndex] = task;
    // Update task group in tasks group list
    tasksGroups[taskGroupIndex] = taskGroup;
    setProgressValue();
  }
}
