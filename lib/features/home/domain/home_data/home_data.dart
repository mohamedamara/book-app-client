import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/book/book.dart';

part 'home_data.freezed.dart';
part 'home_data.g.dart';

@freezed
class HomeData with _$HomeData {
  const factory HomeData({
    required List<Book> topBooks,
    required List<Book> recentlyViewedBooks,
  }) = _HomeData;

  factory HomeData.empty() {
    return const HomeData(
      topBooks: [],
      recentlyViewedBooks: [],
    );
  }

  factory HomeData.fromJson(Map<String, Object?> json) =>
      _$HomeDataFromJson(json);
}
