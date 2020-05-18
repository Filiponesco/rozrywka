// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Series _$SeriesFromJson(Map<String, dynamic> json) {
  return Series(
    title: json['title'] as String ?? '',
    director: json['director'] as String ?? '',
  )
    ..id = json['id'] as String ?? ''
    ..years = json['years'] as String ?? ''
    ..releasedYear = json['releasedYear'] as String ?? ''
    ..genre = json['genre'] as String ?? ''
    ..plot = json['plot'] as String ?? ''
    ..note = json['note'] as String ?? ''
    ..isDone = json['isDone'] as bool;
}

Map<String, dynamic> _$SeriesToJson(Series instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'years': instance.years,
      'releasedYear': instance.releasedYear,
      'genre': instance.genre,
      'plot': instance.plot,
      'director': instance.director,
      'note': instance.note,
      'isDone': instance.isDone,
    };
