import 'package:flutter/material.dart';

class ScreenTool {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}