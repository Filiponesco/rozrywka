// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Series _$SeriesFromJson(Map<String, dynamic> json) {
  return Series(
    id: json['id'] as String,
    title: json['title'] as String,
    years: json['years'] as String,
    releasedYear: json['releasedYear'] as String,
    genre: json['genre'] as String,
    plot: json['plot'] as String,
    director: json['director'] as String,
  )
    ..note = json['note'] as String
    ..isDone = json['isDone'] as bool;
}

Map<String, dynamic> _$SeriesToJson(Series instance) => <String, dynamic>{
      'title': instance.title,
      'years': instance.years,
      'releasedYear': instance.releasedYear,
      'genre': instance.genre,
      'plot': instance.plot,
      'director': instance.director,
      'note': instance.note,
      'id': instance.id,
      'isDone': instance.isDone,
    };
