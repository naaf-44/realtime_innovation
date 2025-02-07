import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realtime_innovation/utils/app_colors.dart';
import 'package:realtime_innovation/utils/enum.dart';
import 'package:realtime_innovation/widgets/app_text.dart';

Map<ButtonType, BoxDecoration> buttonTypeMap = {
  ButtonType.primary: BoxDecoration(
    color: AppColors.primaryColor,
    borderRadius: BorderRadius.circular(8),
  ),
  ButtonType.secondary: BoxDecoration(
    color: AppColors.secondaryColor,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: AppColors.primaryColor, width: 1),
  ),
};

class AppButton extends StatelessWidget {
  final String? text;
  final ButtonType? buttonType;
  final Function()? onPressed;
  const AppButton(
      {super.key,
      required this.text,
      required this.buttonType,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: buttonTypeMap[buttonType],
        alignment: Alignment.center,
        child: AppText(
          text: text,
          textType: buttonType == ButtonType.primary
              ? TextType.primaryButton
              : TextType.secondaryButton,
        ),
      ),
    );
  }
}
