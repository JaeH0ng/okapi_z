import 'package:flutter/material.dart';
import 'package:okapi_z/features/message/data/mock/mock_chat_messages.dart';
import '../models/chat_message.dart';

abstract class ChatRepository {
  Future<List<ChatMessage>> fetchMessages(int chatroomId);
  Future<void> sendMessage(ChatMessage message);
}

class MockChatRepository implements ChatRepository {
  @override
  Future<List<ChatMessage>> fetchMessages(int chatroomId) async {
    return mockChatMessages
        .where((msg) => msg.chatroomId == chatroomId)
        .toList();
  }

  @override
  Future<void> sendMessage(ChatMessage message) async {
    mockChatMessages.add(message);
  }
}
