// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    title: json['Title'] as String ?? '',
    director: json['Director'] as String ?? '',
  )
    ..id = json['id'] as String ?? ''
    ..year = json['Year'] as String ?? ''
    ..plot = json['Plot'] as String ?? ''
    ..genre = json['Genre'] as String ?? ''
    ..isDone = json['isDone'] as bool ?? false;
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'Title': instance.title,
      'Director': instance.director,
      'Year': instance.year,
      'Plot': instance.plot,
      'Genre': instance.genre,
      'isDone': instance.isDone,
    };
