import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class FilterBooksHeader extends StatelessWidget {
  const FilterBooksHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.setWidth(20),
      ),
      child: Row(
        children: [
          Text(
            "Favorites",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Spacer(),
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
