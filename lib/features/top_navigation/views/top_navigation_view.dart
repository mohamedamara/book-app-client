import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/navigation/navigation_paths.dart';
import 'package:books_app_client/core/providers/top_navigation_scaffold_key_provider.dart';
import 'package:books_app_client/features/home/presentation/views/home_view.dart';
import 'package:books_app_client/features/top_navigation/views/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/animated_indexed_stack.dart';

class TopNavigationView extends HookConsumerWidget {
  const TopNavigationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    return Scaffold(
      key: ref.watch(topNavigationScaffoldKeyProvider),
      endDrawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(context.setRadius(250)),
          ),
        ),
        child: ListView(
          children: [
            SizedBox(height: context.setHeight(100)),
            DrawerItem(
              title: 'Home',
              icon: Icons.home,
              isSelected: selectedIndex.value == 0,
              onTap: () => selectedIndex.value = 0,
            ),
            DrawerItem(
              title: 'Search',
              icon: Icons.search,
              isSelected: selectedIndex.value == 1,
              onTap: () => selectedIndex.value = 1,
            ),
            DrawerItem(
              title: 'Favorites',
              icon: Icons.favorite,
              isSelected: selectedIndex.value == 2,
              onTap: () => selectedIndex.value = 2,
            ),
            DrawerItem(
              title: 'Account',
              icon: Icons.account_circle,
              isSelected: false,
              onTap: () => Navigator.pushNamed(
                context,
                NavigationPaths.userProfileRoute,
              ),
            ),
            DrawerItem(
              title: 'Careers',
              icon: Icons.work,
              isSelected: false,
              onTap: () {},
            ),
            DrawerItem(
              title: 'Privacy',
              icon: Icons.verified_user,
              isSelected: false,
              onTap: () {},
            ),
            DrawerItem(
              title: 'Terms',
              icon: Icons.description,
              isSelected: false,
              onTap: () {},
            ),
            DrawerItem(
              title: 'About',
              icon: Icons.info,
              isSelected: false,
              onTap: () {},
            ),
          ],
        ),
      ),
      endDrawerEnableOpenDragGesture: false,
      body: AnimatedIndexedStack(
        index: selectedIndex.value,
        children: [
          const HomeView(),
          Container(color: Colors.amber),
          Container(color: Colors.blue),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
        currentIndex: selectedIndex.value,
        onTap: (index) => selectedIndex.value = index,
      ),
    );
  }
}
