// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatHead.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatHeadAdapter extends TypeAdapter<ChatHead> {
  @override
  final int typeId = 1;

  @override
  ChatHead read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatHead(
      chatroomId: fields[0] as String,
      dateTime: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ChatHead obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.chatroomId)
      ..writeByte(1)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatHeadAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
