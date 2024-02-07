import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_colors.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_textstyles.dart';
import 'package:chat_with_hive/Src/Presentation/Common/app_text.dart';
import 'package:chat_with_hive/Src/Presentation/Common/custom_small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDialog {
  static Future<dynamic> loadingDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SizedBox(
            height: 30.h,
            width: 30.h,
            child: const CircularProgressIndicator(
              color: AppColors.redColor,
            ),
          ),
        );
      },
    );
  }

  static Future<dynamic> errorDialog(
      BuildContext context, String errorMessage, void Function() ontapClose) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          actionsPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          title: Apptext(
            text: "Error",
            style: AppTextStyles.circularStdBold(
              color: AppColors.redColor,
              fontSize: 18,
            ),
          ),
          content: Apptext(
            maxLine: 3,
            text: errorMessage,
            style: AppTextStyles.circularStdRegular(
              fontSize: 14,
            ),
          ),
          actions: [
            CustomSmallButton(
                borderRadius: BorderRadius.circular(4),
                btnColor: AppColors.redColor,
                textColor: AppColors.whiteColor,
                text: 'Close',
                ontap: ontapClose)
          ],
        );
      },
    );
  }

  static Future<dynamic> generalDialog(BuildContext context, String title,
      String message, void Function() ontapClose) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          actionsPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          title: Apptext(
            text: title,
            style: AppTextStyles.circularStdBold(
              color: AppColors.greenColor,
              fontSize: 18,
            ),
          ),
          content: Apptext(
            text: message,
            maxLine: 3,
            style: AppTextStyles.circularStdRegular(
              fontSize: 14,
            ),
          ),
          actions: [
            CustomSmallButton(
                borderRadius: BorderRadius.circular(4),
                btnColor: AppColors.greenColor,
                textColor: AppColors.whiteColor,
                text: 'Close',
                ontap: ontapClose)
          ],
        );
      },
    );
  }
}
