import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okapi_z/features/auth/data/models/user_model.dart';
import 'package:okapi_z/features/create/presentation/pages/create_event.dart';
import 'package:okapi_z/features/home/data/providers/bottom_navigation_provider.dart';
import 'package:okapi_z/features/home/presentation/home_page.dart';
import 'package:okapi_z/features/message/presentation/pages/message_page.dart';
import 'package:okapi_z/features/myPage/presentation/pages/my_page.dart';

// THIS IS MAIN PAGE

class MainPage extends ConsumerWidget {
  final UserModel user;

  const MainPage({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    final pageController = PageController(initialPage: currentIndex);

    void _onPageChanged(int index) {
      ref.read(bottomNavProvider.notifier).update((state) => index);
    }

    void _onItemTapped(int index) {
      pageController.jumpToPage(index);
      ref.read(bottomNavProvider.notifier).update((state) => index);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Okapi-Z'),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: _onPageChanged,
        children: [
          HomePage(),
          CreateEventPage(),
          MessagePage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/bottom_nav_bar/home_gray.svg',
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/bottom_nav_bar/home.svg',
              semanticsLabel: 'Home',
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/bottom_nav_bar/create_gray.svg',
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/bottom_nav_bar/create.svg',
            ),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/bottom_nav_bar/chat_gray.svg',
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/bottom_nav_bar/chat.svg',
            ),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/bottom_nav_bar/user_gray.svg',
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/bottom_nav_bar/user.svg',
            ),
            label: 'My Page',
          ),
        ],
      ),
    );
  }
}
