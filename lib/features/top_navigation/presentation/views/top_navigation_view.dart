import 'package:books_app_client/core/constants/assets_constants.dart';
import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/navigation/navigation_paths.dart';
import 'package:books_app_client/core/providers/top_navigation_scaffold_key_provider.dart';
import 'package:books_app_client/features/home/presentation/views/home_view.dart';
import 'package:books_app_client/features/top_navigation/presentation/controllers/top_navigation_controller.dart';
import 'package:books_app_client/features/top_navigation/presentation/views/widgets/drawer_item.dart';
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
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsConstants.drawerHeaderImage),
                  fit: BoxFit.fill,
                ),
              ),
              child: SizedBox(),
            ),
            DrawerItem(
              title: 'Account',
              icon: Icons.account_circle,
              onTap: () => Navigator.pushNamed(
                context,
                NavigationPaths.userProfileRoute,
              ),
            ),
            DrawerItem(
              title: 'Careers',
              icon: Icons.work,
              onTap: () {},
            ),
            DrawerItem(
              title: 'Privacy',
              icon: Icons.verified_user,
              onTap: () {},
            ),
            DrawerItem(
              title: 'Terms',
              icon: Icons.description,
              onTap: () {},
            ),
            DrawerItem(
              title: 'About',
              icon: Icons.info,
              onTap: () {},
            ),
            DrawerItem(
              title: 'Sign out',
              icon: Icons.exit_to_app,
              onTap: () {
                ref.read(topNavigationControllerProvider).signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  NavigationPaths.onboardingRoute,
                  (Route<dynamic> route) => false,
                );
              },
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
