import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/themes/custom_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/book/book.dart';
import '../../../../core/widgets/primary_button.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({
    super.key,
    required this.bookDetailsArguments,
  });

  final BookDetailsArguments bookDetailsArguments;

  @override
  Widget build(BuildContext context) {
    Color headerColor = CustomColors.mainGreenColor.withOpacity(0.1);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: headerColor,
      ),
      body: Column(
        children: [
          Container(
            height: context.setHeightFraction(0.4),
            width: double.infinity,
            color: headerColor,
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                Column(
                  children: [
                    Hero(
                      tag: bookDetailsArguments.bookAnimationHeroTag,
                      child: SizedBox(
                        height: context.setHeight(200),
                        width: context.setHeight(130),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              context.setRadius(10),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: bookDetailsArguments.book.coverImageURL,
                              height: context.setHeight(200),
                              width: context.setHeight(130),
                              fit: BoxFit.fitHeight,
                              placeholder: (_, __) => const SizedBox(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: context.setHeight(20)),
                    Text(
                      bookDetailsArguments.book.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: context.setSp(15),
                          ),
                    ),
                    SizedBox(height: context.setHeight(5)),
                    Text(
                      bookDetailsArguments.book.author,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: context.setSp(11),
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: -(context.setHeight(30)),
                  left: 0,
                  right: 0,
                  child: Container(
                    height: context.setHeight(60),
                    margin: EdgeInsets.symmetric(
                      horizontal: context.setWidth(30),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        context.setRadius(14),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(0, 1),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          Container(
            height: context.setHeight(80),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(context.setRadius(10)),
                topRight: Radius.circular(context.setRadius(10)),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 1),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.setWidth(80),
                  ),
                  child: SizedBox(
                    height: context.setHeight(45),
                    child: PrimaryButtoon(
                      buttonText: "Start Reading",
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookDetailsArguments {
  BookDetailsArguments({
    required this.book,
    required this.bookAnimationHeroTag,
  });

  final Book book;
  final String bookAnimationHeroTag;
}
