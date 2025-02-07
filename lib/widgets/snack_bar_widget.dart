import 'package:flutter/material.dart';
import 'package:realtime_innovation/utils/app_colors.dart';
import 'package:realtime_innovation/utils/enum.dart';
import 'package:realtime_innovation/utils/screen_utils.dart';
import 'package:realtime_innovation/widgets/app_text.dart';

class SnackBarWidget {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(child: AppText(text: message, textType: TextType.title)),
      behavior: SnackBarBehavior.floating,
      margin: ScreenUtils.isDeskTop(context)
          ? EdgeInsets.only(
        bottom: 10,
        left: ScreenUtils.getWidth(context) * 0.25,
        right: ScreenUtils.getWidth(context) * 0.25,
      )
          : EdgeInsets.only(bottom: 10, left: 20, right: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColors.primaryColor,
    ));
  }
}
