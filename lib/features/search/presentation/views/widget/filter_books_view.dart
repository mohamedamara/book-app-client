import 'package:flutter/material.dart';
import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/themes/custom_colors.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../enums/genre.dart';
import '../../enums/rating.dart';
import '../../enums/sort.dart';

class FilterBooksView extends HookConsumerWidget {
  const FilterBooksView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<Sort> sort = useState(Sort.bookTitleAZ);
    final ValueNotifier<Genre> genre = useState(Genre.agriculture);
    final ValueNotifier<Rating> rating = useState(Rating.fiveStars);
    final ValueNotifier<bool> showAllGenres = useState(false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.setHeight(33)),
            Padding(
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
            ),
            SizedBox(height: context.setHeight(20)),
            Theme(
              data: Theme.of(context).copyWith(
                listTileTheme: ListTileThemeData(
                  titleTextStyle: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: CustomColors.textColorAlmostBlack),
                  contentPadding: EdgeInsets.zero,
                  horizontalTitleGap: 0,
                  titleAlignment: ListTileTitleAlignment.center,
                ),
              ),
              child: Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.setWidth(20),
                  ),
                  children: [
                    Text(
                      'Sort by',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: CustomColors.textColorAlmostBlack
                                .withOpacity(0.25),
                          ),
                    ),
                    RadioListTile<Sort>(
                      title: const Text('Book Title : A - Z'),
                      value: Sort.bookTitleAZ,
                      groupValue: sort.value,
                      onChanged: (Sort? value) {
                        if (value != null) {
                          sort.value = value;
                        }
                      },
                    ),
                    RadioListTile<Sort>(
                      title: const Text('Book Title : Z - A'),
                      value: Sort.bookTitleZA,
                      groupValue: sort.value,
                      onChanged: (Sort? value) {
                        if (value != null) {
                          sort.value = value;
                        }
                      },
                    ),
                    RadioListTile<Sort>(
                      title: const Text('publicationDate : Ascending'),
                      value: Sort.publicationDateAsc,
                      groupValue: sort.value,
                      onChanged: (Sort? value) {
                        if (value != null) {
                          sort.value = value;
                        }
                      },
                    ),
                    RadioListTile<Sort>(
                      title: const Text('Publication Date : Descending'),
                      value: Sort.publicationDateDesc,
                      groupValue: sort.value,
                      onChanged: (Sort? value) {
                        if (value != null) {
                          sort.value = value;
                        }
                      },
                    ),
                    SizedBox(height: context.setHeight(20)),
                    Text(
                      'Genre',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: CustomColors.textColorAlmostBlack
                                .withOpacity(0.25),
                          ),
                    ),
                    RadioListTile<Genre>(
                      title: const Text('Agriculture'),
                      value: Genre.agriculture,
                      groupValue: genre.value,
                      onChanged: (Genre? value) {
                        if (value != null) {
                          genre.value = value;
                        }
                      },
                    ),
                    RadioListTile<Genre>(
                      title: const Text('Architecture'),
                      value: Genre.architecture,
                      groupValue: genre.value,
                      onChanged: (Genre? value) {
                        if (value != null) {
                          genre.value = value;
                        }
                      },
                    ),
                    RadioListTile<Genre>(
                      title: const Text('Biography'),
                      value: Genre.biography,
                      groupValue: genre.value,
                      onChanged: (Genre? value) {
                        if (value != null) {
                          genre.value = value;
                        }
                      },
                    ),
                    RadioListTile<Genre>(
                      title: const Text('Children'),
                      value: Genre.children,
                      groupValue: genre.value,
                      onChanged: (Genre? value) {
                        if (value != null) {
                          genre.value = value;
                        }
                      },
                    ),
                    if (showAllGenres.value) ...[
                      RadioListTile<Genre>(
                        title: const Text('Fiction'),
                        value: Genre.fiction,
                        groupValue: genre.value,
                        onChanged: (Genre? value) {
                          if (value != null) {
                            genre.value = value;
                          }
                        },
                      ),
                      RadioListTile<Genre>(
                        title: const Text('Philosophy'),
                        value: Genre.philosophy,
                        groupValue: genre.value,
                        onChanged: (Genre? value) {
                          if (value != null) {
                            genre.value = value;
                          }
                        },
                      ),
                      RadioListTile<Genre>(
                        title: const Text('technology'),
                        value: Genre.technology,
                        groupValue: genre.value,
                        onChanged: (Genre? value) {
                          if (value != null) {
                            genre.value = value;
                          }
                        },
                      ),
                    ] else ...[
                      ListTile(
                        onTap: () {
                          showAllGenres.value = true;
                        },
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'See more',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: context.setSp(14),
                                    color: CustomColors.textColorAlmostBlack
                                        .withOpacity(0.3),
                                  ),
                        ),
                        leading: Icon(
                          Icons.add,
                          color: CustomColors.textColorAlmostBlack
                              .withOpacity(0.3),
                        ),
                      )
                    ],
                    SizedBox(height: context.setHeight(20)),
                    Text(
                      'Average Customer Review',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: CustomColors.textColorAlmostBlack
                                .withOpacity(0.25),
                          ),
                    ),
                    RadioListTile<Rating>(
                      title: RatingBarIndicator(
                        rating: 5,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: CustomColors.mainGreenColor,
                        ),
                        unratedColor:
                            CustomColors.textColorAlmostBlack.withOpacity(0.5),
                        itemCount: 5,
                        itemSize: context.setHeight(14),
                      ),
                      value: Rating.fiveStars,
                      groupValue: rating.value,
                      onChanged: (Rating? value) {
                        if (value != null) {
                          rating.value = value;
                        }
                      },
                    ),
                    RadioListTile<Rating>(
                      title: RatingBarIndicator(
                        rating: 4,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: CustomColors.mainGreenColor,
                        ),
                        unratedColor:
                            CustomColors.textColorAlmostBlack.withOpacity(0.5),
                        itemCount: 5,
                        itemSize: context.setHeight(14),
                      ),
                      value: Rating.fourStars,
                      groupValue: rating.value,
                      onChanged: (Rating? value) {
                        if (value != null) {
                          rating.value = value;
                        }
                      },
                    ),
                    RadioListTile<Rating>(
                      title: RatingBarIndicator(
                        rating: 3,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: CustomColors.mainGreenColor,
                        ),
                        unratedColor:
                            CustomColors.textColorAlmostBlack.withOpacity(0.5),
                        itemCount: 5,
                        itemSize: context.setHeight(14),
                      ),
                      value: Rating.threeStars,
                      groupValue: rating.value,
                      onChanged: (Rating? value) {
                        if (value != null) {
                          rating.value = value;
                        }
                      },
                    ),
                    RadioListTile<Rating>(
                      title: RatingBarIndicator(
                        rating: 2,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: CustomColors.mainGreenColor,
                        ),
                        unratedColor:
                            CustomColors.textColorAlmostBlack.withOpacity(0.5),
                        itemCount: 5,
                        itemSize: context.setHeight(14),
                      ),
                      value: Rating.twoStars,
                      groupValue: rating.value,
                      onChanged: (Rating? value) {
                        if (value != null) {
                          rating.value = value;
                        }
                      },
                    ),
                    RadioListTile<Rating>(
                      title: RatingBarIndicator(
                        rating: 1,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: CustomColors.mainGreenColor,
                        ),
                        unratedColor:
                            CustomColors.textColorAlmostBlack.withOpacity(0.5),
                        itemCount: 5,
                        itemSize: context.setHeight(14),
                      ),
                      value: Rating.oneStar,
                      groupValue: rating.value,
                      onChanged: (Rating? value) {
                        if (value != null) {
                          rating.value = value;
                        }
                      },
                    ),
                    SizedBox(height: context.setHeight(20)),
                  ],
                ),
              ),
            ),
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
                      horizontal: context.setWidth(38),
                    ),
                    child: SizedBox(
                      height: context.setHeight(45),
                      child: PrimaryButtoon(
                        buttonText: "Apply Filter",
                        onPressed: () {
                          Navigator.pop(
                            context,
                            FilterBooksResult(
                              sort: sort.value,
                              genre: genre.value,
                              rating: rating.value,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterBooksResult {
  FilterBooksResult({
    required this.sort,
    required this.genre,
    required this.rating,
  });

  final Sort sort;
  final Genre genre;
  final Rating rating;

  @override
  String toString() {
    return 'SearchFilterResult (sort: $sort, genre: $genre, rating: $rating)';
  }
}
