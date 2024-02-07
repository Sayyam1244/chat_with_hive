import 'package:chat_with_hive/Src/Application/Services/Navigation/app_navigation.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_colors.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_textstyles.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/extensions/date_formating.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/extensions/styling.dart';
import 'package:chat_with_hive/Src/Domain/Models/chat.dart';
import 'package:chat_with_hive/Src/Presentation/Common/app_text.dart';
import 'package:chat_with_hive/Src/Presentation/Common/image_widget.dart';
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
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (isMe)
              Text.rich(
                TextSpan(
                  text: chat.dateTime.formatDate() + ' ',
                  style: AppTextStyles.circularStdRegular(
                      fontSize: 14, color: AppColors.lightblackColor),
                  children: [
                    TextSpan(
                      text: chat.senderId,
                      style: AppTextStyles.circularStdBold(fontSize: 14),
                    ),
                  ],
                ),
              ).onlyPadding(r: 5),
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
            if (!isMe)
              Text.rich(
                TextSpan(
                  text: '${chat.senderId}  ',
                  style: AppTextStyles.circularStdBold(fontSize: 14),
                  children: [
                    TextSpan(
                      text: chat.dateTime.formatDate(),
                      style: AppTextStyles.circularStdRegular(
                          fontSize: 14, color: AppColors.lightblackColor),
                    ),
                  ],
                ),
              ).onlyPadding(l: 5),
          ],
        ).onlyPadding(b: 4),
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
