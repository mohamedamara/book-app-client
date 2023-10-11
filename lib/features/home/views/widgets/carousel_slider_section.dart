import 'package:books_app_client/core/extensions/context_extensions.dart';
import 'package:books_app_client/features/home/views/widgets/carousel_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderSection extends StatefulWidget {
  const CarouselSliderSection({
    super.key,
    required this.dummyBooksCoverImageURLs,
  });

  final List<String> dummyBooksCoverImageURLs;

  @override
  State<CarouselSliderSection> createState() => _CarouselSliderSectionState();
}

class _CarouselSliderSectionState extends State<CarouselSliderSection> {
  int _selectedCarouselItem = 1;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: context.setHeight(0),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: context.setHeight(271),
          enlargeCenterPage: true,
          viewportFraction: 0.43,
          enableInfiniteScroll: true,
          initialPage: _selectedCarouselItem,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          enlargeFactor: 0.35,
          onPageChanged: (index, _) {
            setState(() {
              _selectedCarouselItem = index;
            });
          },
        ),
        itemCount: widget.dummyBooksCoverImageURLs.length,
        itemBuilder: (_, index, __) {
          return CarouselItem(
            bookImage: widget.dummyBooksCoverImageURLs[index],
            isActiveItem: _selectedCarouselItem == index,
          );
        },
      ),
    );
  }
}
