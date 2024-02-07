import 'package:chat_with_hive/Src/Domain/Models/chat.dart';
import 'package:chat_with_hive/Src/Domain/Models/chatHead.dart';
import 'package:hive/hive.dart';

class DBServices {
  static final DBServices _dbServices = DBServices._internal();
  factory DBServices() => _dbServices;
  DBServices._internal();

  Box? chatBox;
  Box? singleChatroomBox;
  hiveBoxesInit() async {
    // await Hive.deleteBoxFromDisk('chathead');
    // await Hive.deleteBoxFromDisk('chat');

    chatBox = await Hive.openBox<ChatHead>('chathead');
    singleChatroomBox = await Hive.openBox<Chat>('chats');
  }
  //chatroom - user1+user2

  Future initChathead(String chatroomId) async {
    await chatBox!.put(
        chatroomId, ChatHead(chatroomId: chatroomId, dateTime: DateTime.now()));
  }
}
