import 'package:books_app_client/features/search/presentation/enums/sort_by.dart';
import 'package:flutter/material.dart';

import '../../../../../core/themes/custom_colors.dart';

class SortByFilter extends StatelessWidget {
  const SortByFilter({
    super.key,
    required this.sortByValue,
    required this.onSortByRadioChanged,
  });

  final SortBy sortByValue;
  final Function(SortBy newSortByValue) onSortByRadioChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sort by',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: CustomColors.textColorAlmostBlack.withOpacity(0.25),
              ),
        ),
        RadioListTile<SortBy>(
          title: const Text('Book Title : A - Z'),
          value: SortBy.bookTitleAZ,
          groupValue: sortByValue,
          onChanged: (SortBy? value) {
            if (value != null) {
              onSortByRadioChanged(value);
            }
          },
        ),
        RadioListTile<SortBy>(
          title: const Text('Book Title : Z - A'),
          value: SortBy.bookTitleZA,
          groupValue: sortByValue,
          onChanged: (SortBy? value) {
            if (value != null) {
              onSortByRadioChanged(value);
            }
          },
        ),
        RadioListTile<SortBy>(
          title: const Text('publicationDate : Ascending'),
          value: SortBy.publicationDateAsc,
          groupValue: sortByValue,
          onChanged: (SortBy? value) {
            if (value != null) {
              onSortByRadioChanged(value);
            }
          },
        ),
        RadioListTile<SortBy>(
          title: const Text('Publication Date : Descending'),
          value: SortBy.publicationDateDesc,
          groupValue: sortByValue,
          onChanged: (SortBy? value) {
            if (value != null) {
              onSortByRadioChanged(value);
            }
          },
        ),
      ],
    );
  }
}
