// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
      title: json['title'] as String,
      author: json['author'] as String,
      contentURL: json['contentURL'] as String,
      coverImageURL: json['coverImageURL'] as String,
      genre: json['genre'] as String,
      publicationDate: DateTime.parse(json['publicationDate'] as String),
      readCount: json['readCount'] as int,
    );

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'contentURL': instance.contentURL,
      'coverImageURL': instance.coverImageURL,
      'genre': instance.genre,
      'publicationDate': instance.publicationDate.toIso8601String(),
      'readCount': instance.readCount,
    };
