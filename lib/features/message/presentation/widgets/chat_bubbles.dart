import 'package:flutter/material.dart';

class ChatBubbles extends StatelessWidget {
  final String message;
  final bool isMe;
  final String userName;
  final String userImage;

  const ChatBubbles(this.message, this.isMe, this.userName, this.userImage);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isMe)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(userImage),
                ),
              ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: isMe ? Colors.grey.shade300 : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  if (!isMe)
                    Text(
                      userName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  Text(message),
                  Text(
                    'PM 08:00',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
