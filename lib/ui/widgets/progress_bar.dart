import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lodgify/controllers/tasks_controller.dart';
import 'package:lodgify/utils/consts.dart';

class ProgressBar extends GetView<TasksController> {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: GetPlatform.isDesktop ? 40 : 0,
        bottom: 30,
      ),
      child: Stack(
        children: [
          Container(
            height: progressHeight,
            decoration: BoxDecoration(
              color: kColorLightGreen,
              borderRadius: progressRadius,
            ),
          ),
          Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width:
                  controller.progressValue * controller.containerWidth / 100.0,
              height: progressHeight,
              decoration: BoxDecoration(
                color: kColorGreen,
                borderRadius: progressRadius,
              ),
              alignment: Alignment.centerRight,
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              top: 0,
              bottom: 0,
              width: controller.progressTextWidth,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: controller.progressTextWidth * 0.08),
                alignment: Alignment.centerRight,
                child: Obx(
                  () => Text(
                    '${controller.progressValue}%',
                    style: Get.textTheme.bodyText1!.copyWith(
                      color: controller.progressValue == 0.0
                          ? kColorGreen
                          : kColorWhite,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
