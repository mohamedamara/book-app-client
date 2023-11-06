import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(
        right: context.setWidth(40),
        top: context.setHeight(5),
        bottom: context.setHeight(5),
      ),
      title: Text(
        title,
        textAlign: TextAlign.end,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 22,
              letterSpacing: 0.5,
              color: isSelected ? Colors.white : null,
            ),
      ),
      trailing: Icon(
        icon,
        size: 30,
        color:
            isSelected ? Colors.white : Theme.of(context).colorScheme.primary,
      ),
      selected: isSelected,
      onTap: () {
        Navigator.of(context).pop();
        onTap();
      },
      selectedTileColor: Theme.of(context).colorScheme.primary,
    );
  }
}
