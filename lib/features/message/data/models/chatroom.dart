import 'dart:convert';

import 'package:equatable/equatable.dart';

class ChatRomm extends Equatable {
  int chatroom_id;
  int adventure_id;
  String chatroom_name;
  ChatRomm({
    required this.chatroom_id,
    required this.adventure_id,
    required this.chatroom_name,
  });

  ChatRomm copyWith({
    int? chatroom_id,
    int? adventure_id,
    String? chatroom_name,
  }) {
    return ChatRomm(
      chatroom_id: chatroom_id ?? this.chatroom_id,
      adventure_id: adventure_id ?? this.adventure_id,
      chatroom_name: chatroom_name ?? this.chatroom_name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chatroom_id': chatroom_id,
      'adventure_id': adventure_id,
      'chatroom_name': chatroom_name,
    };
  }

  factory ChatRomm.fromMap(Map<String, dynamic> map) {
    return ChatRomm(
      chatroom_id: map['chatroom_id']?.toInt() ?? 0,
      adventure_id: map['adventure_id']?.toInt() ?? 0,
      chatroom_name: map['chatroom_name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatRomm.fromJson(String source) =>
      ChatRomm.fromMap(json.decode(source));

  @override
  String toString() =>
      'ChatRomm(chatroom_id: $chatroom_id, adventure_id: $adventure_id, chatroom_name: $chatroom_name)';

  @override
  List<Object> get props => [chatroom_id, adventure_id, chatroom_name];
}
