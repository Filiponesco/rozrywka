import 'package:flutter/material.dart';
import 'package:rozrywka/models/book.dart';

class BookTile extends StatelessWidget {
  final Book _book;
  BookTile(this._book);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.blueGrey,
      ),
      title: Text(_book.title),
          subtitle: Text("${_book.surname} ${_book.forename}"),
    ));
  }
}
