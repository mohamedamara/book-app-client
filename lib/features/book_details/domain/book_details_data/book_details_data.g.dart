// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_details_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookDetailsDataImpl _$$BookDetailsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$BookDetailsDataImpl(
      bookReviews: (json['bookReviews'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      userReviewForThisBook: json['userReviewForThisBook'] == null
          ? null
          : Review.fromJson(
              json['userReviewForThisBook'] as Map<String, dynamic>),
      isBookInUserFavorites: json['isBookInUserFavorites'] as bool,
      isBookInUserRecents: json['isBookInUserRecents'] as bool,
    );

Map<String, dynamic> _$$BookDetailsDataImplToJson(
        _$BookDetailsDataImpl instance) =>
    <String, dynamic>{
      'bookReviews': instance.bookReviews,
      'userReviewForThisBook': instance.userReviewForThisBook,
      'isBookInUserFavorites': instance.isBookInUserFavorites,
      'isBookInUserRecents': instance.isBookInUserRecents,
    };
