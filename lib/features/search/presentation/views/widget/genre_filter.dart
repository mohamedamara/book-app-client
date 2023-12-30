import 'package:books_app_client/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/themes/custom_colors.dart';
import '../../enums/genre.dart';

class GenreFitler extends HookWidget {
  const GenreFitler({
    super.key,
    required this.genreValue,
    required this.onGenreRadioChanged,
  });

  final Genre genreValue;
  final Function(Genre newGenreValue) onGenreRadioChanged;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> showAllGenres = useState(false);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Genre',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: CustomColors.textColorAlmostBlack.withOpacity(0.25),
              ),
        ),
        RadioListTile<Genre>(
          title: const Text('Architecture'),
          value: Genre.architecture,
          groupValue: genreValue,
          onChanged: (Genre? value) {
            if (value != null) {
              onGenreRadioChanged(value);
            }
          },
        ),
        RadioListTile<Genre>(
          title: const Text('Biography'),
          value: Genre.biography,
          groupValue: genreValue,
          onChanged: (Genre? value) {
            if (value != null) {
              onGenreRadioChanged(value);
            }
          },
        ),
        RadioListTile<Genre>(
          title: const Text('Children'),
          value: Genre.children,
          groupValue: genreValue,
          onChanged: (Genre? value) {
            if (value != null) {
              onGenreRadioChanged(value);
            }
          },
        ),
        if (showAllGenres.value) ...[
          RadioListTile<Genre>(
            title: const Text('Fiction'),
            value: Genre.fiction,
            groupValue: genreValue,
            onChanged: (Genre? value) {
              if (value != null) {
                onGenreRadioChanged(value);
              }
            },
          ),
          RadioListTile<Genre>(
            title: const Text('Philosophy'),
            value: Genre.philosophy,
            groupValue: genreValue,
            onChanged: (Genre? value) {
              if (value != null) {
                onGenreRadioChanged(value);
              }
            },
          ),
          RadioListTile<Genre>(
            title: const Text('Science'),
            value: Genre.science,
            groupValue: genreValue,
            onChanged: (Genre? value) {
              if (value != null) {
                onGenreRadioChanged(value);
              }
            },
          ),
          RadioListTile<Genre>(
            title: const Text('technology'),
            value: Genre.technology,
            groupValue: genreValue,
            onChanged: (Genre? value) {
              if (value != null) {
                onGenreRadioChanged(value);
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
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: context.setSp(14),
                    color: CustomColors.textColorAlmostBlack.withOpacity(0.3),
                  ),
            ),
            leading: Icon(
              Icons.add,
              color: CustomColors.textColorAlmostBlack.withOpacity(0.3),
            ),
          )
        ],
      ],
    );
  }
}
