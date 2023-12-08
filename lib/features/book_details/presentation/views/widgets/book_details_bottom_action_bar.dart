import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/themes/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/models/failure.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import 'review_modal_bottom_sheet.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../controllers/book_details_controller.dart';

class BookDetailsBottomActionBar extends HookConsumerWidget {
  const BookDetailsBottomActionBar({
    super.key,
    required this.bookId,
  });

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewTextEditingController = useTextEditingController();
    final reviewScrollController = useScrollController();
    final isBookReviewedByUser = useState(false);
    final isBookInUserFavorites = useState(false);
    ref
        .watch(bookDetailsControllerProvider(bookId))
        .isBookReviewedByUser
        .whenData((value) => isBookReviewedByUser.value = value);
    ref
        .watch(bookDetailsControllerProvider(bookId))
        .isBookInUserFavorites
        .whenData((value) => isBookInUserFavorites.value = value);

    ref.listen(
      bookDetailsControllerProvider(bookId),
      (_, current) {
        // if (current.isBookReviewedByUser is AsyncData) {
        //   if (current.isBookReviewedByUser.value == true) {
        //     isBookReviewedByUser.value = true;
        //   } else if (current.isBookReviewedByUser.value == false) {
        //     isBookReviewedByUser.value = false;
        //   }
        // }

        // if (current.isBookInUserFavorites is AsyncData) {
        //   if (current.isBookInUserFavorites.value == true) {
        //     isBookInUserFavorites.value = true;
        //   } else if (current.isBookInUserFavorites.value == false) {
        //     isBookInUserFavorites.value = false;
        //   }
        // }

        if (current.isBookReviewedByUser is AsyncError &&
            current.isBookReviewedByUser.error is Failure) {
          showSnackBar(
            context: context,
            message: current.isBookReviewedByUser.error.toString(),
            messageType: SnackBarMessageType.failure,
          );
        }

        if (current.isBookInUserFavorites is AsyncError &&
            current.isBookInUserFavorites.error is Failure) {
          showSnackBar(
            context: context,
            message: current.isBookInUserFavorites.error.toString(),
            messageType: SnackBarMessageType.failure,
          );
        }
      },
    );

    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: context.setWidth(20)),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: CustomColors.mainGreenColor),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () {
                  if (isBookReviewedByUser.value) {
                    showSnackBar(
                      context: context,
                      message: 'You already reviewed this book',
                      messageType: SnackBarMessageType.failure,
                    );
                  } else {
                    showReviewModalBottomSheet(
                      context: context,
                      textEditingController: reviewTextEditingController,
                      scrollController: reviewScrollController,
                      bookId: bookId,
                    );
                  }
                },
                child: Tooltip(
                  message: "Review",
                  child: SizedBox(
                    height: context.setHeight(45),
                    width: context.setHeight(45),
                    child: Icon(
                      Icons.chat_outlined,
                      size: context.setHeight(20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.setWidth(20),
              ),
              child: SizedBox(
                height: context.setHeight(45),
                child: PrimaryButtoon(
                  buttonText: "Start Reading",
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: CustomColors.mainGreenColor),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () async {
                  if (isBookInUserFavorites.value) {
                    await ref
                        .read(bookDetailsControllerProvider(bookId).notifier)
                        .removeBookFromFavorites(bookId: bookId);
                  } else {
                    await ref
                        .read(bookDetailsControllerProvider(bookId).notifier)
                        .addBookToFavorites(bookId: bookId);
                  }
                },
                child: Tooltip(
                  message: "Favorite",
                  child: SizedBox(
                    height: context.setHeight(45),
                    width: context.setHeight(45),
                    child: ref
                            .watch(bookDetailsControllerProvider(bookId))
                            .isBookInUserFavorites is AsyncLoading
                        ? Center(
                            child: SizedBox(
                              height: context.setHeight(20),
                              width: context.setHeight(20),
                              child: const CircularProgressIndicator(
                                strokeWidth: 1,
                              ),
                            ),
                          )
                        : Icon(
                            isBookInUserFavorites.value
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            size: context.setHeight(20),
                          ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: context.setWidth(20)),
        ],
      ),
    );
  }
}
