import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/features/home/presentation/views/widgets/carousel_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/models/book/book.dart';

class CarouselSliderSection extends HookWidget {
  const CarouselSliderSection({
    super.key,
    required this.topBooks,
  });

  final List<Book> topBooks;

  @override
  Widget build(BuildContext context) {
    final selectedCarouselItem = useState(1);
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
          initialPage: selectedCarouselItem.value,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          enlargeFactor: 0.35,
          onPageChanged: (index, _) => selectedCarouselItem.value = index,
        ),
        itemCount: topBooks.length,
        itemBuilder: (_, index, __) {
          return CarouselItem(
            book: topBooks[index],
            isActiveItem: selectedCarouselItem.value == index,
          );
        },
      ),
    );
  }
}
