import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okapi_z/pages/home/home_providers/bottom_navigation_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          Center(child: Text('Home')),
          Center(child: Text('Create')),
          Center(child: Text('Chat')),
          Center(child: Text('Profile')),
          Center(child: Text('More')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          // 상태 업데이트: 선택된 인덱스로 상태를 업데이트합니다.
          ref.read(bottomNavProvider.notifier).update((state) => index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Create'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }
}
