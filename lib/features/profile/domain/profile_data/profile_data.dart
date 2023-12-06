import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/review/review.dart';
import '../../../../core/models/user/user.dart';

part 'profile_data.freezed.dart';
part 'profile_data.g.dart';

@freezed
class ProfileData with _$ProfileData {
  const factory ProfileData({
    required User userInfo,
    required List<Review> userReviews,
  }) = _ProfileData;

  factory ProfileData.empty() {
    return ProfileData(
      userInfo: User.empty(),
      userReviews: [],
    );
  }

  factory ProfileData.fromJson(Map<String, Object?> json) =>
      _$ProfileDataFromJson(json);
}
