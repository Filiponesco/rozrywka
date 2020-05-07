// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    id: json['id'] as String,
    title: json['title'] as String,
    director: json['director'] as String,
    year: json['year'] as String,
    note: json['note'] as String,
    type: json['type'] as String,
    plot: json['plot'] as String,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'director': instance.director,
      'year': instance.year,
      'note': instance.note,
      'type': instance.type,
      'plot': instance.plot,
    };
