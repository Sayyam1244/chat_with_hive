import 'package:hive/hive.dart';
part 'chatHead.g.dart';

@HiveType(typeId: 1)
class ChatHead {
  ChatHead({required this.chatroomId, required this.dateTime});
  @HiveField(0)
  String chatroomId;

  @HiveField(1)
  DateTime dateTime;
}
