import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rozrywka/models/item_card.dart';

part 'book.g.dart';

@JsonSerializable()
class Book implements ItemCard {
  //id is generate by firebase
  @JsonKey(defaultValue: "")
  @override
  String id;

  @JsonKey(defaultValue: "")
  String forename;

  @JsonKey(defaultValue: "")
  String surname;

  @JsonKey(defaultValue: "")
  String title;

  @JsonKey(defaultValue: "")
  String category;

  @JsonKey(defaultValue: "")
  String publishedDate;

  @JsonKey(defaultValue: "")
  String publisher;

  @JsonKey(defaultValue: "")
  String pages;

  @JsonKey(defaultValue: "")
  String isbn;

  @JsonKey(defaultValue: false)
  @override
  bool isDone = false;

  //name of table in firebase
  @JsonKey(ignore: true)
  @override
  String tableName = 'books';

  //description in card
  @JsonKey(ignore: true)
  @override
  String cardDescription;

  @override
  @JsonKey(ignore: true)
  String cardTitle;

  //cardTitle and cardDescription needs in constructor specifics field
  Book({this.forename,
    this.surname,
    this.title,
    this.category,
    this.publishedDate,
    this.publisher}) {
    print('Konstruktor book');
    cardDescription = "$forename $surname";
    cardTitle = "$title";
  }

  @override
  Map<String, dynamic> toJson() => _$BookToJson(this);

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  @JsonKey(ignore: true)
  @override
  String titleAddItem = 'Dodaj książkę';

  @override
  Map<String, dynamic> toPLJson() {
    return <String, dynamic>{
      'id': id,
      'Imię': forename,
      'Nazwisko': surname,
      'Tytuł': title,
      'Kategoria': category,
      'Data publikacji': publishedDate,
      'Wydawca': publisher,
      'Strony': pages,
      'isbn': isbn,
      'Przeczytana': isDone,
    };
  }

  @override
  Map<String, String> jsonToPL() {
    return <String, String>{
      'id': 'id',
      'forename': 'Imię',
      'surname': 'Nazwisko',
      'title': 'Tytuł',
      'category': 'Kategoria',
      'publishedDate': 'Data publikacji',
      'publisher': 'Wydwawca',
      'pages': 'Strony',
      'isbn': 'ISBN',
      'isDone': 'Przeczytana',
    };
  }

  @override
  String titleEditItem = 'Edytuj książkę';

  @override
  IconData icon = Icons.book;
}
