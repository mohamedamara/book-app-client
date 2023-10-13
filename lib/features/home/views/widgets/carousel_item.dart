import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/themes/custom_colors.dart';
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
          style: isActiveItem
              ? Theme.of(context).textTheme.bodyMedium ?? const TextStyle()
              : Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: CustomColors.textColorAlmostBlack.withOpacity(
                          0.5,
                        ),
                      ) ??
                  const TextStyle(),
          child: const Text("Fatherhood"),
        ),
        SizedBox(height: context.setHeight(5)),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: isActiveItem
              ? Theme.of(context).textTheme.bodySmall ?? const TextStyle()
              : Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: CustomColors.textColorAlmostBlack.withOpacity(
                          0.25,
                        ),
                      ) ??
                  const TextStyle(),
          child: const Text("Marcus Berkmann"),
        ),
      ],
    );
  }
}
