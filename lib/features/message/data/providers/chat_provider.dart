import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okapi_z/features/message/data/repositories/chat_repositories.dart';
import '../models/chat_message.dart';

// ChatRepository를 제공하는 프로바이더
final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  return MockChatRepository(); // 실제 사용 시 Mock 대신 실제 리포지토리 사용
});

// 특정 채팅방의 메시지 목록을 제공하는 프로바이더
final messageListProvider =
    FutureProvider.family<List<ChatMessage>, int>((ref, chatroomId) async {
  final repository = ref.read(chatRepositoryProvider);
  return repository.fetchMessages(chatroomId);
});

// 메시지를 전송하는 함수를 제공하는 프로바이더
final sendMessageProvider =
    Provider.autoDispose<Future<void> Function(ChatMessage)>((ref) {
  final repository = ref.read(chatRepositoryProvider);
  return (ChatMessage message) async {
    await repository.sendMessage(message);
  };
});
