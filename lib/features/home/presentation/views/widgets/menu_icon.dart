import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/providers/top_navigation_scaffold_key_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuIcon extends ConsumerWidget {
  const MenuIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      top: context.setHeight(92),
      right: context.setWidth(0),
      child: InkWell(
        onTap: () => ref
            .read(topNavigationScaffoldKeyProvider)
            .currentState!
            .openEndDrawer(),
        child: Padding(
          padding: EdgeInsets.all(context.setHeight(20)),
          child: SizedBox(
            height: context.setHeight(18),
            width: context.setHeight(22),
            child: Column(
              children: [
                Container(
                  height: context.setHeight(3),
                  color: Colors.white,
                ),
                SizedBox(height: context.setHeight(4.5)),
                Container(
                  height: context.setHeight(3),
                  color: Colors.white,
                ),
                SizedBox(height: context.setHeight(4.5)),
                Container(
                  height: context.setHeight(3),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
