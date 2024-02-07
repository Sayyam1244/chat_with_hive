import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:chat_with_hive/Src/Application/Services/Dbservices/db_services.dart';
import 'package:chat_with_hive/Src/Application/Services/FileServices/file_services.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_colors.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/app_textstyles.dart';
import 'package:chat_with_hive/Src/Data/DataSource/Resources/extensions/styling.dart';
import 'package:chat_with_hive/Src/Domain/Models/chat.dart';
import 'package:chat_with_hive/Src/Presentation/Common/app_text.dart';
import 'package:chat_with_hive/Src/Presentation/Common/chat.dart';
import 'package:chat_with_hive/Src/Presentation/Common/custom_small_button.dart';
import 'package:chat_with_hive/Src/Presentation/Common/custom_textfield.dart';
import 'package:chat_with_hive/Src/Presentation/Widgets/ChatScreen/Common/chat_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {super.key, required this.chatRoomId, required this.otherUserId});
  final String chatRoomId;
  final String otherUserId;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ValueNotifier<List<Chat>> userChats = ValueNotifier([]);
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();
  ValueNotifier<List<File>> files = ValueNotifier([]);

  @override
  void initState() {
    final ls = DBServices().singleChatroomBox!.values.toList() as List<Chat>;
    log(ls.toString());
    userChats.value = ls.where((element) {
      return element.chatroomId == widget.chatRoomId;
    }).toList();

    final unReversedData = ls.where((element) {
      return element.chatroomId == widget.chatRoomId;
    }).toList();
    userChats.value = unReversedData.reversed.toList();

    DBServices().singleChatroomBox!.listenable().addListener(() {
      final ls = DBServices().singleChatroomBox!.values.toList() as List<Chat>;
      log(ls.toString());

      final unReversedData = ls.where((element) {
        return element.chatroomId == widget.chatRoomId;
      }).toList();
      userChats.value = unReversedData.reversed.toList();
      userChats.notifyListeners();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: chatAppbar(widget.otherUserId, context),
        backgroundColor: AppColors.lightWhite,
        body: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: userChats,
                builder: (context, snapshot, child) {
                  if (snapshot.isNotEmpty) {
                    return ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.only(top: 20.h),
                      itemCount: snapshot.length,
                      itemBuilder: (context, index) {
                        return ChatWidget(
                          chat: snapshot[index],
                          isMe: widget.otherUserId == snapshot[index].senderId,
                        ).symmetricPadding(horizontal: 24.w, vertical: 8.h);
                      },
                    );
                  } else {
                    return Center(
                      child: Apptext(
                          text: 'No chats',
                          style: AppTextStyles.circularStdBold()),
                    );
                  }
                },
              ),
            ),
            ValueListenableBuilder(
              valueListenable: files,
              builder: (context, value, child) {
                return Column(
                  children: [
                    if (value.isNotEmpty)
                      Container(
                        height: 140.h,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.greenColor),
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          itemCount: value.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            width: 120,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(value[index]),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {
                                files.value.removeAt(index);
                                files.notifyListeners();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ).onlyPadding(r: 4),
                        ),
                      ),
                    if (value.isNotEmpty)
                      Row(
                        children: [
                          Expanded(
                            child: CustomSmallButton(
                              btnColor: AppColors.greenColor,
                              textColor: AppColors.whiteColor,
                              text: 'Send',
                              ontap: () async {
                                final List<String> imageStrings = [];
                                for (var i = 0; i < value.length; i++) {
                                  final imageBytes =
                                      await value[i].readAsBytes();
                                  imageStrings.add(base64Encode(imageBytes));
                                }

                                if (imageStrings.isNotEmpty) {
                                  await DBServices().singleChatroomBox!.put(
                                      "${widget.chatRoomId}_${DateTime.now()}",
                                      Chat(
                                          chatroomId: widget.chatRoomId,
                                          content: '',
                                          dateTime: DateTime.now(),
                                          isDeleted: false,
                                          senderId: widget.otherUserId,
                                          images: imageStrings,
                                          type: 'IMAGE'));
                                  files.value = [];
                                }
                              },
                            ),
                          ),
                          CustomSmallButton(
                              btnColor: AppColors.redColor,
                              textColor: AppColors.whiteColor,
                              text: 'Clear',
                              ontap: () {
                                files.value = [];
                              }).onlyPadding(l: 6),
                        ],
                      ).onlyPadding(t: 6),
                    if (value.isEmpty)
                      CustomTextfield(
                        controller: controller,
                        onFieldSubmitted: (v) {
                          if (v.trim().isNotEmpty) {
                            DBServices().singleChatroomBox!.put(
                                "${widget.chatRoomId}_${DateTime.now()}",
                                Chat(
                                    chatroomId: widget.chatRoomId,
                                    content: v.toString(),
                                    dateTime: DateTime.now(),
                                    isDeleted: false,
                                    senderId: widget.otherUserId,
                                    type: 'TEXT'));
                            controller.clear();
                          }
                        },
                        inputDecoration: InputDecoration(
                          prefixIcon: IconButton(
                            padding: EdgeInsets.only(left: 16.w, right: 10.w),
                            onPressed: () async {
                              files.value = await FileServices.getImages();
                            },
                            icon: const Icon(
                              Icons.image,
                              color: AppColors.greenColor,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (controller.text.trim().isNotEmpty) {
                                DBServices().singleChatroomBox!.put(
                                    "${widget.chatRoomId}_${DateTime.now()}",
                                    Chat(
                                        chatroomId: widget.chatRoomId,
                                        content: controller.text.toString(),
                                        dateTime: DateTime.now(),
                                        isDeleted: false,
                                        senderId: widget.otherUserId,
                                        type: 'TEXT'));
                                controller.clear();
                              }
                            },
                            icon: const Icon(
                              Icons.send_rounded,
                              color: AppColors.greenColor,
                            ),
                          ),
                          fillColor: AppColors.whiteColor,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 16.h),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(30),
                            ),
                            borderSide: BorderSide(
                              color: AppColors.greenColor.withOpacity(0.3),
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          constraints: BoxConstraints(
                            maxHeight: 60.h,
                          ),
                        ),
                      )
                  ],
                ).onlyPadding(b: 20, l: 24, r: 24);
              },
            ),
          ],
        ),
      ),
    );
  }
}
