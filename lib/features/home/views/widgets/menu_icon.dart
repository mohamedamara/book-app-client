import 'package:books_app_client/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/scaffold_utils.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.setHeight(92),
      right: context.setWidth(0),
      child: InkWell(
        onTap: () => ScaffoldUtils.openEndDrawer(),
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
