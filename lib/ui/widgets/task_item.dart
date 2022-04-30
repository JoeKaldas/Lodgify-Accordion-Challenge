import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lodgify/controllers/tasks_controller.dart';
import 'package:lodgify/utils/consts.dart';

class TaskItem extends GetView<TasksController> {
  const TaskItem({
    Key? key,
    required this.taskGroupIndex,
    required this.taskIndex,
  }) : super(key: key);

  final int taskGroupIndex;
  final int taskIndex;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CheckboxListTile(
        checkColor: kColorWhite,
        activeColor: kColorGreen,
        controlAffinity: ListTileControlAffinity.leading,
        value: controller.tasksGroups[taskGroupIndex].tasks[taskIndex].checked,
        onChanged: (value) {
          controller.toggleTask(taskGroupIndex, taskIndex, value);
        },
        title: Text(
          controller.tasksGroups[taskGroupIndex].tasks[taskIndex].taskName,
        ),
      ),
    );
  }
}
