import 'package:chat_with_hive/Src/Application/Services/Dbservices/db_services.dart';
import 'package:chat_with_hive/Src/Application/Services/Navigation/app_navigation.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_colors.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_textstyles.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/extensions/styling.dart';
import 'package:chat_with_hive/Src/Presentation/Common/app_text.dart';
import 'package:chat_with_hive/Src/Presentation/Widgets/ChatScreen/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatHeadScreen extends StatefulWidget {
  const ChatHeadScreen({super.key});

  @override
  State<ChatHeadScreen> createState() => _ChatHeadScreenState();
}

class _ChatHeadScreenState extends State<ChatHeadScreen> {
  final user1 = '123';
  final user2 = '456';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          Apptext(
                  text: 'Chats',
                  style: AppTextStyles.circularStdBold(fontSize: 20))
              .onlyPadding(t: 30, b: 20),
          GestureDetector(
            onTap: () async {
              final users = [user1, user2];
              users.sort();
              final chatRoomId = users.join('_');

              await DBServices().initChathead(chatRoomId);
              // ignore: use_build_context_synchronously
              AppNavigation.to(
                context,
                ChatScreen(
                  chatRoomId: chatRoomId,
                  otherUserId: user1,
                ),
              );
            },
            child: Container(
              height: 70,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.lightGreyColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    decoration: const BoxDecoration(
                      color: AppColors.blackColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Apptext(
                        text: user1.characters.first,
                        style: AppTextStyles.circularStdBold(
                            fontSize: 26, color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                  Apptext(
                    text: user1,
                    style: AppTextStyles.circularStdMedium(
                        fontSize: 20, color: AppColors.blackColor),
                  ).onlyPadding(l: 12),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final users = [user1, user2];
              users.sort();
              final chatRoomId = users.join('_');

              await DBServices().initChathead(chatRoomId);
              // ignore: use_build_context_synchronously
              AppNavigation.to(
                context,
                ChatScreen(
                  chatRoomId: chatRoomId,
                  otherUserId: user2,
                ),
              );
            },
            child: Container(
              height: 70,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.lightGreyColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    decoration: const BoxDecoration(
                      color: AppColors.blackColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Apptext(
                        text: user2.characters.first,
                        style: AppTextStyles.circularStdBold(
                            fontSize: 26, color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                  Apptext(
                    text: user2,
                    style: AppTextStyles.circularStdMedium(
                        fontSize: 20, color: AppColors.blackColor),
                  ).onlyPadding(l: 12),
                ],
              ),
            ).onlyPadding(t: 20),
          )
        ],
      ),
    );
  }
}
