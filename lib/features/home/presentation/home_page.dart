import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okapi_z/features/auth/data/models/user_model.dart';
import 'package:okapi_z/features/home/data/providers/bottom_navigation_provider.dart';
import 'package:okapi_z/features/auth/presentation/widgets/adventure_type_filter.dart';
import 'package:okapi_z/features/auth/presentation/widgets/search_field.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends ConsumerWidget {
  final UserModel user;

  const HomePage({super.key, required this.user});

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
          SingleChildScrollView(
            // Column을 SingleChildScrollView로 감쌈
            child: Column(
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
            'Message',
            style: TextStyle(
              color: Colors.black,
            ),
          )),
          const Center(
              child: Text(
            'My Page',
            style: TextStyle(
              color: Colors.black,
            ),
          )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(bottomNavProvider.notifier).update((state) => index);
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/bottom_nav_bar/tab1_home_not_selected.svg',
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/bottom_nav_bar/tab1_home_selected.svg',
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/bottom_nav_bar/tab2_add_one_not_selected.svg',
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/bottom_nav_bar/tab2_add_one_selected.svg',
              ),
              label: 'Create'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/bottom_nav_bar/tab3_communication_not_selected.svg',
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/bottom_nav_bar/tab3_communication_selected.svg',
              ),
              label: 'Message'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/bottom_nav_bar/tab4_me_not_selected.svg',
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/bottom_nav_bar/tab4_me_selected.svg',
              ),
              label: 'My Page'),
        ],
      ),
    );
  }
}
