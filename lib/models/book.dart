import 'package:flutter/material.dart';

class Book {
  String id;
  String forename = "";
  String surname = "";
  String title = "";
  String category = "";
  String publishedDate = "";
  String publisher = "";
  String pages = "";
  String isbn = "";
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
}
