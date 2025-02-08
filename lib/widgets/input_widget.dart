import 'package:flutter/material.dart';
import 'package:realtime_innovation/utils/app_colors.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Function()? onTap;
  final bool? readOnly;
  final String? validationMessage;
  const InputWidget({super.key, this.controller, this.hintText, this.onTap, this.readOnly, this.validationMessage});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: AppColors.greyColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: 'Robot-Regular'),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(Icons.person_outline,
            color: AppColors.primaryColor),
      ),
      validator: (val) {
        if(validationMessage != null) {
          if (val == null || val.isEmpty) {
            return validationMessage;
          }
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUnfocus,
    );
  }
}
