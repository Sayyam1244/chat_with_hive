import 'package:chat_with_hive/Src/Application/Services/Navigation/app_navigation.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_colors.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_textstyles.dart';
import 'package:chat_with_hive/Src/Presentation/Common/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSize chatAppbar(userId, context) {
  return PreferredSize(
    preferredSize: Size(double.infinity, 60.h),
    child: Container(
      height: 60.h,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.lightblackColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              AppNavigation.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          Apptext(
            text: "User$userId",
            style: AppTextStyles.circularStdRegular(
              fontSize: 18,
              color: AppColors.blackColor.withOpacity(0.8),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_rounded,
            ),
          ),
        ],
      ),
    ),
  );
}
