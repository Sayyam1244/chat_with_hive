import 'package:hive/hive.dart';
part 'chat.g.dart';

@HiveType(typeId: 2)
class Chat {
  Chat({
    required this.chatroomId,
    required this.content,
    required this.dateTime,
    required this.isDeleted,
    required this.senderId,
    required this.type,
    this.images,
  });
  @HiveField(0)
  String chatroomId;

  @HiveField(1)
  String content;

  @HiveField(2)
  String type;

  @HiveField(3)
  DateTime dateTime;

  @HiveField(4)
  bool isDeleted;

  @HiveField(5)
  String senderId;

  @HiveField(6)
  List<String>? images;
}
