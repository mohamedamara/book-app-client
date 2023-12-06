// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      reviewContent: json['reviewContent'] as String,
      reviewRating: json['reviewRating'] as num,
      createdBy: json['createdBy'] == null
          ? null
          : User.fromJson(json['createdBy'] as Map<String, dynamic>),
      createdFor: json['createdFor'] == null
          ? null
          : Book.fromJson(json['createdFor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'reviewContent': instance.reviewContent,
      'reviewRating': instance.reviewRating,
      'createdBy': instance.createdBy,
      'createdFor': instance.createdFor,
    };
