import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/book.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required ({List<Book> topBooks, List<Book> recentlyViewedBooks}) homeData,
  }) = _HomeState;
}
