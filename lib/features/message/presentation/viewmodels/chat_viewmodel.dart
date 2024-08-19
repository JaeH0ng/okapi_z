import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okapi_z/features/message/data/providers/chat_provider.dart';
import '../../data/models/chat_message.dart';

class ChatViewModel extends StateNotifier<List<ChatMessage>> {
  final Ref ref;
  final int chatroomId;

  ChatViewModel(this.ref, this.chatroomId) : super([]) {
    loadMessages();
  }

  Future<void> loadMessages() async {
    final messages = await ref.read(messageListProvider(chatroomId).future);
    state = messages;
  }

  Future<void> sendMessage(ChatMessage message) async {
    await ref.read(sendMessageProvider)(message);
    state = [...state, message];
  }
}

final chatViewModelProvider =
    StateNotifierProvider.family<ChatViewModel, List<ChatMessage>, int>(
        (ref, chatroomId) {
  return ChatViewModel(ref, chatroomId);
});
