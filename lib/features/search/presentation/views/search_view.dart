import 'dart:async';

import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:books_app_client/core/extensions/string_extension.dart';
import 'package:books_app_client/features/search/presentation/views/widget/empty_search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/assets_constants.dart';
import '../../../../core/navigation/navigation_paths.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/widgets/book_liste_tile.dart';
import '../controllers/search_controller.dart';
import 'widget/empty_filter_result.dart';
import 'widget/filter_books_view.dart';

class SearchView extends ConsumerStatefulWidget {
  const SearchView({super.key});

  @override
  ConsumerState<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  late TextEditingController searchTextEditingController;
  String lastSearchValue = '';
  Timer? _debouncer;
  Object? filterBooksResult;

  @override
  void initState() {
    super.initState();
    searchTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _debouncer?.cancel();
    searchTextEditingController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String currentValue) {
    filterBooksResult = null;
    if (_debouncer?.isActive ?? false) {
      _debouncer?.cancel();
    }
    _debouncer = Timer(const Duration(milliseconds: 500), () async {
      await _searchBooks(currentValue);
    });
  }

  Future<void> _searchBooks(String currentValue) async {
    if (currentValue.isNotEqual(lastSearchValue)) {
      lastSearchValue = currentValue;
      await ref
          .read(searchControllerProvider.notifier)
          .getSearchedBooks(currentValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.setWidth(20)),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.setHeight(30)),
              CustomTextField(
                key: const Key('search_textField'),
                controller: searchTextEditingController,
                labelText: 'Search Books, Authors',
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: IconButton(
                  onPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    filterBooksResult = await Navigator.pushNamed(
                      context,
                      NavigationPaths.filterBooksRoute,
                    );
                    if (filterBooksResult != null) {
                      searchTextEditingController.clear();
                      lastSearchValue = "";
                      await ref
                          .read(searchControllerProvider.notifier)
                          .getFilteredBooks(
                            filterBooks: filterBooksResult as FilterBooksResult,
                          );
                    }
                  },
                  icon: const Icon(Icons.tune),
                ),
                onChanged: _onSearchChanged,
                onSubmitted: _searchBooks,
              ),
              Expanded(
                child: ref.watch(searchControllerProvider).when(
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      error: (e, s) => Center(
                        child: Text(e.toString()),
                      ),
                      data: (data) {
                        if (data.isEmpty && filterBooksResult != null) {
                          return const EmptyfilterResult();
                        } else if (data.isEmpty &&
                            searchTextEditingController.text.isNotEmpty) {
                          return const EmptySearchResult();
                        } else if (data.isEmpty &&
                            searchTextEditingController.text.isEmpty) {
                          return Center(
                            child: SvgPicture.asset(
                              AssetsConstants.searchImage,
                              height: context.setHeight(300),
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
                              return BookListTile(book: book);
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
