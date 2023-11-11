import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/features/home/presentation/views/widgets/carousel_slider_section.dart';
import 'package:books_app_client/features/home/presentation/views/widgets/curved_decoration_background.dart';
import 'package:books_app_client/features/home/presentation/views/widgets/menu_icon.dart';
import 'package:books_app_client/features/home/presentation/views/widgets/recently_viewed_section.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/home_controller.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(homeControllerProvider).when(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (e, s) => Center(
              child: Text(e.toString()),
            ),
            data: (data) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.setHeight(434),
                    child: Stack(
                      children: [
                        const CurvedDecorationBackground(),
                        Positioned(
                          top: context.setHeight(108),
                          left: context.setWidth(20),
                          child: Text(
                            "Our Top Picks",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                        const MenuIcon(),
                        CarouselSliderSection(
                          topBooks: data.topBooks,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: context.setHeight(50)),
                  Padding(
                    padding: EdgeInsets.only(left: context.setWidth(20)),
                    child: Text(
                      "Recently Viewed",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(height: context.setHeight(25)),
                  RecentlyViewedSection(
                    recentlyViewedBooks: data.recentlyViewedBooks,
                  ),
                  SizedBox(height: context.setHeight(30)),
                ],
              ),
            ),
          ),
    );
  }
}
