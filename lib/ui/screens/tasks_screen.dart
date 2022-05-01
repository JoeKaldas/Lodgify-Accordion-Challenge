import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lodgify/controllers/tasks_controller.dart';
import 'package:lodgify/ui/widgets/progress_bar.dart';
import 'package:lodgify/ui/widgets/tasks_list.dart';
import 'package:lodgify/utils/consts.dart';

class TasksScreen extends StatelessWidget {
  static const routeName = '/';

  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetPlatform.isIOS
        ? const CupertinoPageScaffold(child: Body())
        : const Scaffold(body: Body());
  }
}

class Body extends GetView<TasksController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          width: Get.width,
          padding: screenSpacing,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: containerRadius,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: GetPlatform.isDesktop ? 40 : 0,
                    bottom: 15,
                  ),
                  child: Text(
                    'Lodgify Grouped Tasks',
                    style: Get.textTheme.headline1,
                  ),
                ),
                const ProgressBar(),
                // Loading API
                FutureBuilder(
                  future: controller.loadTaskGroups(),
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: containerRadius,
                              ),
                              child: const TasksList(),
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
