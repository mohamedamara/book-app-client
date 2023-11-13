// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      reviewContent: json['reviewContent'] as String,
      reviewRating: json['reviewRating'] as num,
      createdFor: Book.fromJson(json['createdFor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'reviewContent': instance.reviewContent,
      'reviewRating': instance.reviewRating,
      'createdFor': instance.createdFor,
    };
