import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RecentlyViewedSection extends StatelessWidget {
  const RecentlyViewedSection({
    super.key,
    required this.dummyBooksCoverImageURLs,
  });

  final List<String> dummyBooksCoverImageURLs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.setHeight(292),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: context.setWidth(20)),
        itemCount: dummyBooksCoverImageURLs.length,
        separatorBuilder: (context, index) => SizedBox(
          width: context.setWidth(25),
        ),
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: context.setHeight(200),
                  width: context.setWidth(130),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        context.setRadius(10),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: dummyBooksCoverImageURLs[index],
                        fit: BoxFit.fitHeight,
                        placeholder: (_, __) => const SizedBox(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.setHeight(29)),
              Text(
                "Fatherhood",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: context.setSp(15),
                    ),
              ),
              SizedBox(height: context.setHeight(5)),
              Text(
                "Marcus Berkmann",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: context.setSp(11),
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          );
        },
      ),
    );
  }
}
