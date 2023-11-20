// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
      id: json['_id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      contentURL: json['contentURL'] as String,
      coverImageURL: json['coverImageURL'] as String,
      genre: json['genre'] as String,
      publicationDate: DateTime.parse(json['publicationDate'] as String),
      rating: json['rating'] as num,
    );

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'contentURL': instance.contentURL,
      'coverImageURL': instance.coverImageURL,
      'genre': instance.genre,
      'publicationDate': instance.publicationDate.toIso8601String(),
      'rating': instance.rating,
    };
