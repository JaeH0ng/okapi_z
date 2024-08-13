import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okapi_z/features/home/data/providers/bottom_navigation_provider.dart';
import 'package:okapi_z/features/auth/presentation/widgets/adventure_type_filter.dart';
import 'package:okapi_z/features/auth/presentation/widgets/search_field.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    final searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SearchField(
                controller: searchController,
                icon: Icons.calendar_month_rounded,
                hintText: 'Search',
              ),
              AdventureTypeSelector(onSelected: (index) {
                print('Selected index: $index');
              }),
            ],
          ),
          const Center(
              child: Text(
            'Create',
            style: TextStyle(
              color: Colors.black,
            ),
          )),
          const Center(
              child: Text(
            'Chat',
            style: TextStyle(
              color: Colors.black,
            ),
          )),
          const Center(
              child: Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
            ),
          )),
          const Center(
              child: Text(
            'More',
            style: TextStyle(
              color: Colors.black,
            ),
          )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) {
          // 상태 업데이트: 선택된 인덱스로 상태를 업데이트합니다.
          ref.read(bottomNavProvider.notifier).update((state) => index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add, color: Colors.black), label: 'Create'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat, color: Colors.black), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz, color: Colors.black), label: 'More'),
        ],
      ),
    );
  }
}
