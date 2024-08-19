import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okapi_z/features/message/presentation/widgets/chat_bubbles.dart';
import '../../data/models/chat_message.dart';
import '../viewmodels/chat_viewmodel.dart';

class Messages extends ConsumerWidget {
  final int chatroomId;

  Messages({required this.chatroomId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messages = ref.watch(chatViewModelProvider(chatroomId));

    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final chatMessage = messages[index];
        return ChatBubbles(
          chatMessage.messageText ?? '',
          chatMessage.userId == 1001,
          'User ${chatMessage.userId}',
          'path/to/user_image',
        );
      },
    );
  }
}
