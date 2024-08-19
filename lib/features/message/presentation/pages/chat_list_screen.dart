import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okapi_z/features/message/presentation/pages/chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
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
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            height: 84,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user1.png'),
              ),
              title: Text('Name $index'),
              subtitle: Text('Context'),
              trailing: Column(
                mainAxisSize: MainAxisSize.min, // 추가된 부분
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('PM 08:00'),
                  // SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('1'),
                  ),
                ],
              ),
              // 클릭 시
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(
                      chatroomId: index, // 예시로 채팅방 ID를 index로 설정
                      chatroomName: 'Name $index', // 채팅방 이름 전달
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
