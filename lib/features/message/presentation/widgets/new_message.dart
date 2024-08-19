import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/chat_message.dart';
import '../viewmodels/chat_viewmodel.dart';

class NewMessage extends ConsumerStatefulWidget {
  final int chatroomId;

  NewMessage({required this.chatroomId});

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends ConsumerState<NewMessage> {
  final _controller = TextEditingController();
  var _userEnterMessage = '';

  void _sendMessage() {
    if (_userEnterMessage.trim().isEmpty) {
      return;
    }
    final newMessage = ChatMessage(
      messageId: DateTime.now().millisecondsSinceEpoch,
      chatroomId: widget.chatroomId,
      userId: 1001,
      messageText: _userEnterMessage,
      timestamp: DateTime.now(),
      filePath: null,
      messageType: MessageType.text,
    );

    ref
        .read(chatViewModelProvider(widget.chatroomId).notifier)
        .sendMessage(newMessage);
    _controller.clear();
    setState(() {
      _userEnterMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              maxLines: null,
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
              ),
              onChanged: (value) {
                setState(() {
                  _userEnterMessage = value;
                });
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _userEnterMessage.trim().isEmpty ? null : _sendMessage,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
