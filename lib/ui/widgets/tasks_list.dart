import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lodgify/controllers/tasks_controller.dart';
import 'package:lodgify/ui/widgets/task_item.dart';
import 'package:lodgify/utils/consts.dart';

class TasksList extends GetView<TasksController> {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: containerRadius,
      child: Obx(
        () => ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            controller.toggleTaskGroup(index, isExpanded);
          },
          children: [
            for (var taskGroupIndex = 0;
                taskGroupIndex < controller.tasksGroups.length;
                taskGroupIndex++)
              ExpansionPanel(
                isExpanded: controller.tasksGroups[taskGroupIndex].isExpanded,
                headerBuilder: (context, isExpanded) => ListTile(
                  leading: Icon(
                    controller.tasksGroups[taskGroupIndex].allTasksChecked
                        ? Icons.assignment_turned_in_outlined
                        : Icons.assignment_outlined,
                    color:
                        controller.tasksGroups[taskGroupIndex].allTasksChecked
                            ? kColorGreen
                            : kColorLightGrey,
                  ),
                  title: Text(
                    controller.tasksGroups[taskGroupIndex].name,
                    style: TextStyle(
                      color:
                          controller.tasksGroups[taskGroupIndex].allTasksChecked
                              ? kColorGreen
                              : kColorBlack,
                    ),
                  ),
                  trailing: Text(
                    controller.tasksGroups[taskGroupIndex].isExpanded
                        ? 'Hide'
                        : 'Show',
                  ),
                ),
                body: ListView.builder(
                  itemCount:
                      controller.tasksGroups[taskGroupIndex].tasks.length,
                  itemBuilder: (context, taskIndex) {
                    return TaskItem(
                      taskGroupIndex: taskGroupIndex,
                      taskIndex: taskIndex,
                    );
                  },
                  shrinkWrap: true,
                ),
                canTapOnHeader: true,
              )
          ],
        ),
      ),
    );
  }
}
