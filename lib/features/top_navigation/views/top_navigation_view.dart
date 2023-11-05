import 'package:books_app_client/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/scaffold_utils.dart';
import 'widgets/animated_indexed_stack.dart';

class TopNavigationView extends StatefulWidget {
  const TopNavigationView({super.key});

  @override
  State<TopNavigationView> createState() => _TopNavigationViewState();
}

class _TopNavigationViewState extends State<TopNavigationView> {
  int _selectedIndex = 0;

  final List<Widget> _viewOptions = <Widget>[
    const HomeView(),
    Container(color: Colors.amber),
    Container(color: Colors.blue),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ScaffoldUtils.topNavigationScaffoldKey,
      endDrawer: const Drawer(),
      endDrawerEnableOpenDragGesture: false,
      body: AnimatedIndexedStack(
        index: _selectedIndex,
        children: _viewOptions,
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
