import 'package:books_app_client/core/constants/assets_constants.dart';
import 'package:books_app_client/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/exceptions/failure.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../../core/widgets/error_view.dart';
import '../controllers/favorites_controller.dart';
import '../../../../core/widgets/book_list_tile.dart';

class FavoritesView extends ConsumerWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(favoritesControllerProvider, (previous, current) {
      var previousRemoveBookResult = previous?.removeBookFromFavoritesResult;
      var currentRemoveBookResult = current.removeBookFromFavoritesResult;
      if (previousRemoveBookResult != currentRemoveBookResult) {
        if (currentRemoveBookResult is AsyncData &&
            currentRemoveBookResult.value == true) {
          showSnackBar(
            context: context,
            message: 'Book removed from favorites',
            messageType: SnackBarMessageType.success,
          );
        } else if (currentRemoveBookResult is AsyncError &&
            currentRemoveBookResult.error is Failure) {
          showSnackBar(
            context: context,
            message: currentRemoveBookResult.error.toString(),
            messageType: SnackBarMessageType.failure,
          );
        }
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.setWidth(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.setHeight(33)),
              Text(
                "Favorites",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: context.setHeight(8)),
              Expanded(
                child: ref
                    .watch(favoritesControllerProvider)
                    .favoriteBooks
                    .when(
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      error: (e, _) => ErrorView(
                        errorText: e.toString(),
                        buttonAction: () => ref
                            .read(favoritesControllerProvider.notifier)
                            .getFavoritesBooks(),
                      ),
                      data: (data) {
                        if (data.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AssetsConstants.noFavoritesImage,
                                  height: context.setHeight(250),
                                ),
                                SizedBox(height: context.setHeight(30)),
                                Text(
                                  'No favorite books',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: CustomColors.textColorAlmostBlack
                                            .withOpacity(0.25),
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return ListView.separated(
                            padding: EdgeInsets.symmetric(
                              vertical: context.setHeight(16),
                            ),
                            itemCount: data.length,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: context.setHeight(24),
                              );
                            },
                            itemBuilder: (context, index) {
                              var book = data[index];
                              return Dismissible(
                                key: Key(book.id),
                                onDismissed: (direction) {
                                  ref
                                      .read(
                                        favoritesControllerProvider.notifier,
                                      )
                                      .removeBookFromFavorites(book.id);
                                },
                                child: BookListTile(
                                  book: book,
                                  parentViewName: 'favorites',
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
