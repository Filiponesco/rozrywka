import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rozrywka/models/item_card.dart';

part 'book.g.dart';

@JsonSerializable()
class Book implements ItemCard {
  //id is generate by firebase
  @override
  String id;
  String forename;
  String surname;
  String title;
  String category;
  String publishedDate;
  String publisher;
  String pages;
  String isbn;
  @override
  bool isDone;

  Book(
      {this.id = "",
      this.forename = "",
      this.surname = "",
      this.title = "",
      this.category = "",
      this.publishedDate = "",
      this.publisher = "",
      this.pages = "",
      this.isbn = "",
      this.isDone = false}) {
    cardDescription = "$forename $surname";
    cardTitle = "$title";
  }
  @override
  Map<String, dynamic> toJson() => _$BookToJson(this);

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  //name of table in firebase
  @override
  String tableName = 'books';

  //description in card
  @JsonKey(ignore: true)
  @override
  String cardDescription;

  @override
  @JsonKey(ignore: true)
  String cardTitle;
}
