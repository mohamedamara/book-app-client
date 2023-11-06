import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final topNavigationScaffoldKeyProvider = Provider<GlobalKey<ScaffoldState>>((ref) {
  GlobalKey<ScaffoldState> topNavigationScaffoldKey =
      GlobalKey<ScaffoldState>();
  return topNavigationScaffoldKey;
});
