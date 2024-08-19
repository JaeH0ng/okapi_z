import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatScreen extends StatelessWidget {
  final int chatroomId;
  final String chatroomName;

  ChatScreen({required this.chatroomId, required this.chatroomName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chatroomName),
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/Left.svg',
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/edit--more_one.svg',
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'August 8 Wed 2024',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // 임의의 메시지 수
              itemBuilder: (context, index) {
                bool isMe = index % 2 == 0;
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment:
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      if (!isMe)
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/user2.png'),
                        ),
                      SizedBox(width: 10),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          color: isMe
                              ? Colors.grey.shade200
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft:
                                isMe ? Radius.circular(20) : Radius.circular(0),
                            bottomRight:
                                isMe ? Radius.circular(0) : Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: isMe
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            if (!isMe)
                              Text(
                                'Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            Text(
                              'Text Message',
                              style: TextStyle(
                                  color: isMe ? Colors.black : Colors.black),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'PM 08:00',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/Plus.svg',
                  ),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                    ),
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/arrows_send_one.svg',
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
