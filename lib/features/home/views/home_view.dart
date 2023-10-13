import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/features/home/views/widgets/carousel_slider_section.dart';
import 'package:books_app_client/features/home/views/widgets/curved_decoration_background.dart';
import 'package:books_app_client/features/home/views/widgets/menu_icon.dart';
import 'package:books_app_client/features/home/views/widgets/recently_viewed_section.dart';
import 'package:flutter/material.dart';

List<String> dummyBooksCoverImageURLs = [
  "https://m.media-amazon.com/images/I/71O1It5N1VS._AC_UF894,1000_QL80_.jpg",
  "https://m.media-amazon.com/images/I/71FTb9X6wsL._AC_UF1000,1000_QL80_.jpg",
  "https://m.media-amazon.com/images/I/51JEItnoKFL.jpg",
];

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    dummyBooksCoverImageURLs: dummyBooksCoverImageURLs,
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
              dummyBooksCoverImageURLs: dummyBooksCoverImageURLs,
            ),
          ],
        ),
      ),
    );
  }
}
