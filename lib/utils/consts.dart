import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer:
      PrettyPrinter(), // Use the default LogOutput (-> send everything to console)
);

// Colors
const Color kColorWhite = Color(0xffffffff);
const Color kColorBlack = Color(0xff000000);
const Color kColorGreen = Color(0xff16ab86);
const Color kColorLightGreen = Color(0xffecf7f5);
const Color kColorLightGrey = Color(0xff535353);

double progressHeight = 25;
BorderRadius containerRadius = BorderRadius.circular(10);
BorderRadius progressRadius = BorderRadius.circular(35);
BorderRadius borderRadius6 = BorderRadius.circular(6.0);

// Common sizing/spacing
const EdgeInsets screenSpacing = EdgeInsets.only(
  top: 30,
  left: 20,
  right: 20,
  bottom: 20,
);
const EdgeInsets screenHorizontalSpacing = EdgeInsets.symmetric(horizontal: 20);


// To use text style with text:
// style: Get.textTheme.headline2)
// style: Get.textTheme.headline2.copyWith(color: kColorPink)
