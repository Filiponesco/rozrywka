// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) {
  return Game(
    title: json['title'] as String ?? '',
    forename: json['forename'] as String ?? '',
    surname: json['surname'] as String ?? '',
  )
    ..id = json['id'] as String ?? ''
    ..publishedDate = json['publishedDate'] as String ?? ''
    ..platforms = json['platforms'] as String ?? ''
    ..publisher = json['publisher'] as String ?? ''
    ..category = json['category'] as String ?? ''
    ..isDone = json['isDone'] as bool ?? false;
}

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'forename': instance.forename,
      'surname': instance.surname,
      'publishedDate': instance.publishedDate,
      'platforms': instance.platforms,
      'publisher': instance.publisher,
      'category': instance.category,
      'isDone': instance.isDone,
    };
