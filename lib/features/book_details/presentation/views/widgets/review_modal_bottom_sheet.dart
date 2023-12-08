import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/themes/custom_colors.dart';
import 'package:books_app_client/features/book_details/presentation/controllers/book_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/models/failure.dart';
import '../../../../../core/widgets/primary_button.dart';

showReviewModalBottomSheet({
  required BuildContext context,
  required TextEditingController textEditingController,
  required ScrollController scrollController,
  required String bookId,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white.withOpacity(0),
    isScrollControlled: true,
    elevation: 0,
    builder: (_) {
      num ratingValue = 5;
      final bottomPadding = MediaQuery.of(context).padding.bottom;
      final viewInsets = EdgeInsets.fromViewPadding(
        View.of(context).viewInsets,
        View.of(context).devicePixelRatio,
      );
      var safeTopPadding =
          View.of(context).viewPadding.top / View.of(context).devicePixelRatio;
      return Padding(
        padding: EdgeInsets.only(top: safeTopPadding),
        child: Container(
          color: Colors.white.withOpacity(0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(context.setRadius(24)),
                topRight: Radius.circular(context.setRadius(24)),
              ),
            ),
            child: AbsorbPointer(
              absorbing: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: context.setHeight(8)),
                  Container(
                    height: context.setHeight(8),
                    width: context.setWidth(63),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        context.setRadius(4),
                      ),
                      color: CustomColors.textColorAlmostBlack.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(height: context.setHeight(26)),
                  Padding(
                    padding: EdgeInsets.only(left: context.setWidth(16)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Review",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  SizedBox(height: context.setHeight(24)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.setWidth(12)),
                      child: RatingBar.builder(
                        initialRating: ratingValue.toDouble(),
                        allowHalfRating: true,
                        glow: false,
                        maxRating: 5,
                        minRating: 1,
                        updateOnDrag: true,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: CustomColors.mainGreenColor,
                        ),
                        unratedColor:
                            CustomColors.textColorAlmostBlack.withOpacity(0.2),
                        itemCount: 5,
                        itemSize: context.setHeight(30),
                        onRatingUpdate: (rating) {
                          ratingValue = rating;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: context.setHeight(24)),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.setWidth(16),
                      ),
                      child: Scrollbar(
                        thumbVisibility: true,
                        controller: scrollController,
                        child: TextField(
                          controller: textEditingController,
                          scrollController: scrollController,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: Colors.black),
                          autofocus: true,
                          cursorColor: Theme.of(context).colorScheme.primary,
                          keyboardType: TextInputType.multiline,
                          maxLength: 2000,
                          maxLines: null,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            hintText: 'Write your review',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: context.setHeight(-4),
                            ),
                            border: InputBorder.none,
                            counterText: '',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(context.setRadius(20)),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(context.setRadius(20)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: context.setHeight(16),
                    padding: EdgeInsets.only(left: context.setWidth(16)),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Consumer(
                        builder: (context, ref, child) {
                          var cureentState =
                              ref.watch(bookDetailsControllerProvider(bookId));
                          return Visibility(
                            visible: cureentState.isBookReviewedByUser
                                    is AsyncError &&
                                cureentState.isBookReviewedByUser.error
                                    is Failure,
                            child: Text(
                              cureentState.isBookReviewedByUser.error
                                  .toString(),
                              style: TextStyle(
                                fontSize: context.setSp(10),
                                fontWeight: FontWeight.normal,
                                color: const Color(0xFFE70202),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: context.setHeight(24)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.setWidth(16),
                    ),
                    child: SizedBox(
                      height: context.setHeight(45),
                      child: Consumer(
                        builder: (context, ref, child) {
                          return PrimaryButtoon(
                            buttonText: "Send Review",
                            isEnabled: true,
                            isLoading: ref
                                .watch(
                                  bookDetailsControllerProvider(bookId),
                                )
                                .isBookReviewedByUser is AsyncLoading,
                            onPressed: () async {
                              await ref
                                  .read(
                                    bookDetailsControllerProvider(bookId)
                                        .notifier,
                                  )
                                  .addReview(
                                    reviewContent: textEditingController.text,
                                    reviewRating: ratingValue,
                                    bookId: bookId,
                                  );
                              var isBookReviewedSuccessfully = ref
                                  .read(
                                    bookDetailsControllerProvider(bookId),
                                  )
                                  .isBookReviewedByUser
                                  .unwrapPrevious()
                                  .valueOrNull;
                              if (isBookReviewedSuccessfully ?? false) {
                                if (context.mounted) {
                                  Navigator.pop(context);
                                }
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: viewInsets.bottom),
                  SizedBox(
                    height: bottomPadding == 0
                        ? context.setHeight(14)
                        : context.setHeight(bottomPadding),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  ).whenComplete(() {
    textEditingController.clear();
  });
}
