import 'package:books_app_client/features/search/presentation/views/widget/filter_books_bottom_action_bar.dart';
import 'package:books_app_client/features/search/presentation/views/widget/genre_filter.dart';
import 'package:books_app_client/features/search/presentation/views/widget/rating_filter.dart';
import 'package:books_app_client/features/search/presentation/views/widget/sort_by_filter.dart';
import 'package:flutter/material.dart';
import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/themes/custom_colors.dart';
import '../../enums/genre.dart';
import '../../enums/rating.dart';
import '../../enums/sort_by.dart';
import 'filter_books_header.dart';

class FilterBooksView extends HookConsumerWidget {
  const FilterBooksView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<SortBy> sortBy = useState(SortBy.bookTitleAZ);
    final ValueNotifier<Genre> genre = useState(Genre.architecture);
    final ValueNotifier<Rating> rating = useState(Rating.fiveStars);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.setHeight(33)),
            const FilterBooksHeader(),
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
                    SortByFilter(
                      sortByValue: sortBy.value,
                      onSortByRadioChanged: (newSortByValue) {
                        sortBy.value = newSortByValue;
                      },
                    ),
                    SizedBox(height: context.setHeight(20)),
                    GenreFitler(
                      genreValue: genre.value,
                      onGenreRadioChanged: (newGenreValue) {
                        genre.value = newGenreValue;
                      },
                    ),
                    SizedBox(height: context.setHeight(20)),
                    RatingFilter(
                      ratingValue: rating.value,
                      onRatingRadioChanged: (newRatingValue) {
                        rating.value = newRatingValue;
                      },
                    ),
                    SizedBox(height: context.setHeight(20)),
                  ],
                ),
              ),
            ),
            FilterBooksBottomActionBar(
              onPressed: () {
                Navigator.pop(
                  context,
                  FilterBooksResult(
                    sort: sortBy.value,
                    genre: genre.value,
                    rating: rating.value,
                  ),
                );
              },
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

  final SortBy sort;
  final Genre genre;
  final Rating rating;

  @override
  String toString() {
    return 'SearchFilterResult (sort: $sort, genre: $genre, rating: $rating)';
  }
}
