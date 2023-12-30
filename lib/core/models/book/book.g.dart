// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      contentOverview: json['contentOverview'] as String,
      contentURL: json['contentURL'] as String,
      coverImageURL: json['coverImageURL'] as String,
      genre: json['genre'] as String,
      language: json['language'] as String,
      numberOfPages: json['numberOfPages'] as int,
      publicationDate: DateTime.parse(json['publicationDate'] as String),
      rating: json['rating'] as num,
    );

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'contentOverview': instance.contentOverview,
      'contentURL': instance.contentURL,
      'coverImageURL': instance.coverImageURL,
      'genre': instance.genre,
      'language': instance.language,
      'numberOfPages': instance.numberOfPages,
      'publicationDate': instance.publicationDate.toIso8601String(),
      'rating': instance.rating,
    };
