import 'package:flutter/material.dart';

class ScaffoldUtils {
  static final GlobalKey<ScaffoldState> topNavigationScaffoldKey = GlobalKey();

  static void openEndDrawer() {
    topNavigationScaffoldKey.currentState!.openEndDrawer();
  }
}
