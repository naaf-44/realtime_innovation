import 'package:flutter/material.dart';
import 'package:realtime_innovation/utils/app_colors.dart';
import 'package:realtime_innovation/utils/enum.dart';

Map<TextType, TextStyle> appTextStyle = {
  TextType.appBarTitle : TextStyle(
    color: AppColors.whiteColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto-Regular'
  ),

  TextType.title : TextStyle(
      color: AppColors.blackColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto-Regular'
  ),

  TextType.body : TextStyle(
      color: AppColors.greyColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto-Regular'
  ),

  TextType.label : TextStyle(
      color: AppColors.primaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto-Regular'
  ),

  TextType.primaryButton : TextStyle(
      color: AppColors.whiteColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto-Regular'
  ),

  TextType.secondaryButton : TextStyle(
      color: AppColors.primaryColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto-Regular'
  ),
};

class AppText extends StatelessWidget {
  final String? text;
  final TextType? textType;
  const AppText({super.key, required this.text, required this.textType});

  @override
  Widget build(BuildContext context) {
    return Text(text!, style: appTextStyle[textType]);
  }
}
