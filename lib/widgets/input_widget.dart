import 'package:flutter/material.dart';
import 'package:realtime_innovation/utils/app_colors.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Function()? onTap;
  final bool? readOnly;
  const InputWidget({super.key, this.controller, this.hintText, this.onTap, this.readOnly});

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
        if(val == null || val.isEmpty) {
          return "Please enter the name";
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
