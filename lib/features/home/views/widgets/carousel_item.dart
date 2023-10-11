import 'package:books_app_client/core/extensions/context_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    super.key,
    required this.bookImage,
    required this.isActiveItem,
  });

  final String bookImage;
  final bool isActiveItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: context.setHeight(200),
              width: context.setWidth(127),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(context.setRadius(10)),
                  child: CachedNetworkImage(
                    imageUrl: bookImage,
                    fit: BoxFit.fitHeight,
                    placeholder: (_, __) => const SizedBox(),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: context.setHeight(28)),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            color: isActiveItem
                ? const Color(0xFF242126)
                : const Color(0xFF242126).withOpacity(0.5),
            fontWeight: isActiveItem ? FontWeight.w600 : FontWeight.w500,
            fontSize: context.setSp(16),
          ),
          child: const Text(
            "Fatherhood",
          ),
        ),
        SizedBox(height: context.setHeight(5)),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
              color: isActiveItem
                  ? const Color(0xFF242126).withOpacity(0.6)
                  : const Color(0xFF242126).withOpacity(0.4),
              fontWeight: isActiveItem ? FontWeight.w300 : FontWeight.w200,
              fontSize: context.setSp(13)),
          child: const Text(
            "Marcus Berkmann",
          ),
        ),
      ],
    );
  }
}
