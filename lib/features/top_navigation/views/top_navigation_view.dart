import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/utils/scaffold_utils.dart';
import 'widgets/animated_indexed_stack.dart';

class TopNavigationView extends HookWidget {
  const TopNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    return Scaffold(
      key: ScaffoldUtils.topNavigationScaffoldKey,
      endDrawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(context.setRadius(300)),
          ),
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
