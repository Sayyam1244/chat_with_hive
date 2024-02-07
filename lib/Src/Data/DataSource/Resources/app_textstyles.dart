import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle circularStdBold({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.blackColor,
        fontFamily: "circularStd Bold",
      );
  static TextStyle circularStdRegular({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? AppColors.blackColor,
        fontFamily: "circularStd Regular",
      );
  static TextStyle circularStdMedium({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? AppColors.blackColor,
        fontFamily: "circularStd Medium",
      );
}
