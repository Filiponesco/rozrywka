import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'book.g.dart';
@JsonSerializable()
class Book{
  //id is generate by firebase
  String id;
  String forename;
  String surname;
  String title;
  String category;
  String publishedDate;
  String publisher;
  String pages;
  String isbn;
  bool isRead;

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
      this.isRead = false});

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}
