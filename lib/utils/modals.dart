import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Modals {
  static void showErrorDialog(
      {String message = 'Something went wrong. Please try again'}) {
    Get.dialog(
      AlertDialog(
        title: const Text('Error'),
        content: Text(message),
      ),
    );
  }
}
