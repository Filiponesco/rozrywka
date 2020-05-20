// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) {
  return Book(
    forename: json['forename'] as String ?? '',
    surname: json['surname'] as String ?? '',
    title: json['title'] as String ?? '',
    category: json['category'] as String ?? '',
    publishedDate: json['publishedDate'] as String ?? '',
    publisher: json['publisher'] as String ?? '',
  )
    ..id = json['id'] as String ?? ''
    ..pages = json['pages'] as String ?? ''
    ..isbn = json['isbn'] as String ?? ''
    ..isDone = json['isDone'] as bool ?? false;
}

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'forename': instance.forename,
      'surname': instance.surname,
      'title': instance.title,
      'category': instance.category,
      'publishedDate': instance.publishedDate,
      'publisher': instance.publisher,
      'pages': instance.pages,
      'isbn': instance.isbn,
      'isDone': instance.isDone,
    };
