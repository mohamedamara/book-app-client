import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/themes/custom_colors.dart';
import 'package:books_app_client/features/book_details/presentation/controllers/book_details_controller.dart';
import 'package:books_app_client/features/book_details/presentation/views/widgets/book_details_header.dart';
import 'package:books_app_client/features/book_details/presentation/views/widgets/book_details_bottom_action_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/models/book/book.dart';
import '../../../../core/widgets/error_view.dart';
import 'widgets/book_details_floating_header_container.dart';

class BookDetailsView extends ConsumerStatefulWidget {
  const BookDetailsView({
    super.key,
    required this.bookDetailsArguments,
  });

  final BookDetailsArguments bookDetailsArguments;

  @override
  ConsumerState<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends ConsumerState<BookDetailsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  String overview =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color headerColor = CustomColors.mainGreenColor.withOpacity(0.1);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                BookDetailsHeader(
                  bookDetailsArguments: widget.bookDetailsArguments,
                ),
                const BookDetailsFloatingHeaderContainer(),
              ],
            ),
          ),
          SizedBox(height: context.setHeight(50)),
          Expanded(
            child: ref
                .watch(
                  bookDetailsControllerProvider(
                    widget.bookDetailsArguments.book.id,
                  ),
                )
                .bookReviews
                .when(
                  loading: () => Column(
                    children: [
                      SizedBox(height: context.setHeight(80)),
                      const CircularProgressIndicator(),
                    ],
                  ),
                  error: (e, _) => ErrorView(
                    errorText: e.toString(),
                    buttonAction: () {
                      var bookId = widget.bookDetailsArguments.book.id;
                      ref
                          .read(
                            bookDetailsControllerProvider(bookId).notifier,
                          )
                          .getBookDetailsData(
                            bookId: bookId,
                          );
                    },
                  ),
                  data: (data) => Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: UnconstrainedBox(
                          child: Container(
                            height: context.setHeight(25),
                            padding: EdgeInsets.symmetric(
                              horizontal: context.setWidth(10),
                            ),
                            margin: EdgeInsets.only(left: context.setWidth(18)),
                            decoration: BoxDecoration(
                              color:
                                  CustomColors.mainGreenColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(
                                context.setRadius(8),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                widget.bookDetailsArguments.book.genre,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: CustomColors.mainGreenColor
                                          .withOpacity(0.7),
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: context.setHeight(16)),
                      Padding(
                        padding: EdgeInsets.only(left: context.setWidth(5)),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TabBar(
                            controller: _tabController,
                            tabs: [
                              const Text('Overview'),
                              Text('Reviews (${data.length})'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            SingleChildScrollView(
                              padding: EdgeInsets.symmetric(
                                horizontal: context.setWidth(20),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    overview,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color:
                                              CustomColors.textColorAlmostBlack,
                                          fontWeight: FontWeight.w400,
                                          height: 1.8,
                                        ),
                                  ),
                                  SizedBox(height: context.setHeight(16)),
                                ],
                              ),
                            ),
                            if (data.isEmpty) ...[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.setWidth(20),
                                ),
                                child: Text(
                                  'No review for this book yet.',
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: CustomColors.textColorAlmostBlack
                                            .withOpacity(0.25),
                                        fontWeight: FontWeight.normal,
                                        height: 1.6,
                                      ),
                                ),
                              ),
                            ] else ...[
                              Theme(
                                data: Theme.of(context).copyWith(
                                  listTileTheme: ListTileThemeData(
                                    titleTextStyle: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          color:
                                              CustomColors.textColorAlmostBlack,
                                        ),
                                    subtitleTextStyle: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color:
                                              CustomColors.textColorAlmostBlack,
                                        ),
                                    contentPadding: EdgeInsets.zero,
                                    horizontalTitleGap: 0,
                                  ),
                                ),
                                child: ListView.separated(
                                  padding: EdgeInsets.symmetric(
                                    vertical: context.setHeight(8),
                                    horizontal: context.setWidth(20),
                                  ),
                                  itemCount: data.length,
                                  separatorBuilder: (context, index) {
                                    return const Divider();
                                  },
                                  itemBuilder: (context, index) {
                                    return Material(
                                      borderRadius: BorderRadius.circular(
                                        context.setRadius(20),
                                      ),
                                      color: CustomColors
                                          .reviewCardBackgroundColor,
                                      elevation: 5,
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                            context.setHeight(16),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ReadMoreText(
                                                data[index].reviewContent,
                                                trimLines: 3,
                                                trimMode: TrimMode.Line,
                                                trimCollapsedText: 'Read more',
                                                trimExpandedText: 'Read Less',
                                                moreStyle: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      height: 1.4,
                                                      color: CustomColors
                                                          .textColorAlmostBlack
                                                          .withOpacity(0.75),
                                                    ),
                                                lessStyle: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                              SizedBox(
                                                height: context.setHeight(10),
                                              ),
                                              RatingBarIndicator(
                                                rating: data[index]
                                                    .reviewRating
                                                    .toDouble(),
                                                itemBuilder: (context, index) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: CustomColors
                                                      .mainGreenColor,
                                                ),
                                                unratedColor: CustomColors
                                                    .textColorAlmostBlack
                                                    .withOpacity(0.2),
                                                itemCount: 5,
                                                itemSize: context.setHeight(14),
                                              ),
                                              SizedBox(
                                                height: context.setHeight(10),
                                              ),
                                              Text(
                                                'Reviewed by ${data[index].createdBy?.firstName} ${data[index].createdBy?.lastName}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      BookDetailsBottomActionBar(
                        bookId: widget.bookDetailsArguments.book.id,
                      ),
                    ],
                  ),
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
