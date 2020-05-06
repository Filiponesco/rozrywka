import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/models/book.dart';
import 'package:rozrywka/services/database.dart';

class BookTile extends StatelessWidget {
  final Book _book;

  BookTile(this._book);

  void _deleteCard(String userID, String bookID){
    DatabaseService(uid: userID).deleteBook(bookID);
  }
  void _moveToDoneCard(String userID, String bookID, bool isRead){
    DatabaseService(uid: userID).updateBookRead(bookID, isRead);
  }
  @override
  Widget build(BuildContext context) {
    final userID = Provider.of<String>(context, listen: false);
    return Dismissible(
      key: Key(_book.hashCode.toString()),
      direction: DismissDirection.startToEnd,
      background: _bgCard(),
      onDismissed: (_) => _moveToDoneCard(userID, _book.id, _book.isRead),
      child: Card(
          child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.blueGrey,
        ),
        title: Text(_book.title),
        subtitle: Text("${_book.surname} ${_book.forename}"),
        trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: ()=>_deleteCard(userID, _book.id),
        )
      )),
    );
  }
}

Widget _bgCard() {
  return Padding(
    padding: EdgeInsets.only(left: 15),
    child: Align(
        alignment: Alignment.centerLeft,
        child: Icon(
          Icons.done,
          color: Colors.green,
        )),
  );
}
