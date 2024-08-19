import 'dart:convert';
import 'package:equatable/equatable.dart';

enum MessageType {
  text,
  image,
  video,
}

extension MessageTypeExtension on MessageType {
  String toMap() {
    return this.toString().split('.').last;
  }

  static MessageType fromMap(String type) {
    return MessageType.values
        .firstWhere((e) => e.toString().split('.').last == type);
  }
}

class ChatMessage extends Equatable {
  final int messageId;
  final int chatroomId;
  final int userId;
  final String? messageText;
  final DateTime timestamp;
  final String? filePath;
  final MessageType messageType;

  ChatMessage({
    required this.messageId,
    required this.chatroomId,
    required this.userId,
    this.messageText,
    required this.timestamp,
    this.filePath,
    required this.messageType,
  });

  ChatMessage copyWith({
    int? messageId,
    int? chatroomId,
    int? userId,
    String? messageText,
    DateTime? timestamp,
    String? filePath,
    MessageType? messageType,
  }) {
    return ChatMessage(
      messageId: messageId ?? this.messageId,
      chatroomId: chatroomId ?? this.chatroomId,
      userId: userId ?? this.userId,
      messageText: messageText ?? this.messageText,
      timestamp: timestamp ?? this.timestamp,
      filePath: filePath ?? this.filePath,
      messageType: messageType ?? this.messageType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'messageId': messageId,
      'chatroomId': chatroomId,
      'userId': userId,
      'messageText': messageText,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'filePath': filePath,
      'messageType': messageType.toMap(),
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      messageId: map['messageId']?.toInt() ?? 0,
      chatroomId: map['chatroomId']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      messageText: map['messageText'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
      filePath: map['filePath'],
      messageType: MessageTypeExtension.fromMap(map['messageType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessage.fromJson(String source) =>
      ChatMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatMessage(messageId: $messageId, chatroomId: $chatroomId, userId: $userId, messageText: $messageText, timestamp: $timestamp, filePath: $filePath, messageType: $messageType)';
  }

  @override
  List<Object?> get props {
    return [
      messageId,
      chatroomId,
      userId,
      messageText,
      timestamp,
      filePath,
      messageType,
    ];
  }
}
