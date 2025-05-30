

import 'package:flutter/material.dart';

class Dimensions {
  static late double screenHeight;
  static late double screenWidth;

  // Initialize with context
  static void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }

  // dynamic height padding and margin
  // 932/10 = 93.2
  static double height10 = screenHeight / 93.2;
  // 932/15= 62.1
  static double height15 = screenHeight / 62.1;
  static double height20 = screenHeight / 46.6;
  static double height30 = screenHeight / 31.0;
  static double height40 = screenHeight / 23.3;

  //dynamic width padding and margin
  static double width5 = screenHeight / 186.4;
  static double width10 = screenHeight / 93.2;
  static double width15 = screenHeight / 62.1;
  static double width20 = screenHeight / 46.6;
  static double width30 = screenHeight / 31.0;
  static double width40 = screenHeight / 23.3;

  // 932/50 = 18.64
  static double navBarHeight50 = screenHeight / 18.64;

  //? checkbox SizedBox height to remove default padding
  // 932/18 =51.77
  static double height18 = screenHeight / 51.77;

  //font size
  static double font15 = screenHeight / 62.1;
  static double font18 = screenHeight / 51.7;
  static double font20 = screenHeight / 46.6;
  static double font22 = screenHeight / 40.5;
  static double font26 = screenHeight / 35.8;

  //radius
  static double radius15 = screenHeight / 62.1;
  static double radius20 = screenHeight / 46.6;
  // 932/30 = 31.06
  static double radius30 = screenHeight / 31.0;

  //icon size
  static double iconSize28 = screenHeight / 33.1;
  static double iconSize24 = screenHeight / 38.8;
  static double iconSize20 = screenHeight / 46.6;
  static double iconSize16 = screenHeight / 58.2;

  //text_field widget size
  // 430/350 = 1.22
  // 932/60 = 15.53
  // 932/50 = 18.64
  static double text_field_width = screenWidth / 1.2;
  // static double text_field_height = screenHeight / 15.5;
  static double text_field_height50 = screenHeight / 18.6;
}
