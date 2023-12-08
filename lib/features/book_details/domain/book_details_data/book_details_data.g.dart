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
      isBookReviewedByUser: json['isBookReviewedByUser'] as bool,
      isBookInUserFavorites: json['isBookInUserFavorites'] as bool,
    );

Map<String, dynamic> _$$BookDetailsDataImplToJson(
        _$BookDetailsDataImpl instance) =>
    <String, dynamic>{
      'bookReviews': instance.bookReviews,
      'isBookReviewedByUser': instance.isBookReviewedByUser,
      'isBookInUserFavorites': instance.isBookInUserFavorites,
    };
