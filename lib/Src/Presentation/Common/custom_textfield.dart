import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_colors.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_textstyles.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/extensions/styling.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({
    this.hinText,
    this.controller,
    this.hintTextstyle,
    this.ontap,
    this.textstyle,
    this.validator,
    super.key,
    this.onChanged,
    this.keyboardType,
    this.onFieldSubmitted,
    this.inputDecoration,
  });
  String? hinText;
  TextStyle? hintTextstyle;
  TextStyle? textstyle;
  TextEditingController? controller;
  VoidCallback? ontap;
  String? Function(String?)? validator;
  Function(String)? onChanged;
  TextInputType? keyboardType;
  Function(String)? onFieldSubmitted;
  InputDecoration? inputDecoration;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: keyboardType,
      onChanged: onChanged,
      controller: controller,
      onTap: ontap,
      validator: validator,
      style: textstyle ??
          AppTextStyles.circularStdMedium(
            fontSize: 16,
            color: AppColors.blackColor,
          ),
      decoration: inputDecoration ??
          InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hinText,
            hintStyle: hintTextstyle ??
                AppTextStyles.circularStdMedium(
                  fontSize: 16,
                  color: AppColors.lightblackColor,
                ),
          ),
    ).symmetricPadding(vertical: 6);
  }
}
