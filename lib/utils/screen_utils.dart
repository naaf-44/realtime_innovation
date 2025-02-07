import 'package:flutter/cupertino.dart';

class ScreenUtils{
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static bool isDeskTop(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }
}