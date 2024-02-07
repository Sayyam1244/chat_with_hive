import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_textstyles.dart';
import 'package:chat_with_hive/Src/Presentation/Common/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomSmallButton extends StatelessWidget {
  CustomSmallButton({
    super.key,
    required this.btnColor,
    required this.textColor,
    required this.text,
    required this.ontap,
    this.width,
    this.height = 47,
    this.borderRadius,
  });
  final Color btnColor;
  final Color textColor;
  final String text;
  final VoidCallback ontap;
  double? width;
  double height;
  BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: borderRadius ?? BorderRadius.circular(15),
      ),
      child: MaterialButton(
        onPressed: ontap,
        child: Center(
          child: Apptext(
            text: text,
            style: AppTextStyles.circularStdRegular(
              fontSize: 16.sp,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
