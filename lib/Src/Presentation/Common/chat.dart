import 'dart:convert';
import 'dart:io';

import 'package:chat_with_hive/Src/Application/Services/Navigation/app_navigation.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_colors.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_textstyles.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/extensions/styling.dart';
import 'package:chat_with_hive/Src/Domain/Models/chat.dart';
import 'package:chat_with_hive/Src/Presentation/Common/app_text.dart';
import 'package:chat_with_hive/Src/Presentation/Widgets/ImageView/image_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.chat,
    required this.isMe,
  });

  final Chat chat;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          height: 16.h,
          width: 16.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isMe ? AppColors.redColor : AppColors.greenColor,
          ),
          child: Center(
            child: Apptext(
              text: chat.senderId.characters.first,
              style: AppTextStyles.circularStdMedium(
                  color: AppColors.whiteColor, fontSize: 12),
            ),
          ),
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          padding: chat.type == 'TEXT'
              ? EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h)
              : const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(chat.type == 'TEXT' ? 30 : 8),
          ),
          child: chat.type == 'TEXT'
              ? Apptext(
                  maxLine: 1000,
                  text: chat.content,
                  style: AppTextStyles.circularStdRegular(fontSize: 16),
                )
              : GestureDetector(
                  onTap: () async {
                    AppNavigation.to(
                        context, ImageView(files: chat.images ?? []));
                  },
                  child: ImageWidget(
                    images: chat.images ?? [],
                  ),
                ),
        ).onlyPadding(t: chat.type == 'TEXT' ? 0 : 4),
      ],
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightblackColor,
      height: images.length > 2
          ? MediaQuery.sizeOf(context).width * .7
          : MediaQuery.sizeOf(context).width * .35,
      width: images.length == 1
          ? MediaQuery.sizeOf(context).width * .35
          : MediaQuery.sizeOf(context).width * .7,
      padding: const EdgeInsets.all(4),
      child: GridView.builder(
        itemCount: images.length > 4 ? 4 : images.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: images.length == 1 ? 1 : 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            clipBehavior: Clip.hardEdge,
            // padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: MemoryImage(
                  base64Decode(images[index]),
                ),
              ),
            ),
            child: (images.length > 4 && index == 3)
                ? Container(
                    color: (images.length > 4 && index == 3)
                        ? AppColors.blackColor.withOpacity(0.3)
                        : null,
                    child: Center(
                      child: Apptext(
                        text: '+ ${images.length - 4}',
                        style: AppTextStyles.circularStdBold(
                            fontSize: 20, color: AppColors.whiteColor),
                      ),
                    ),
                  )
                : Container(),
          );
        },
      ),
    );
  }
}
