import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/features/favorites/presentation/views/widgets/favorites_item.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.setWidth(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.setHeight(33)),
              Text(
                "Favorites",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: context.setHeight(8)),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                    vertical: context.setHeight(16),
                  ),
                  itemCount: 10,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: context.setHeight(24),
                    );
                  },
                  itemBuilder: (context, index) {
                    return const FavoritesItem();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
