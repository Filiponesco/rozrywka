import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/models/book.dart';
import 'package:rozrywka/services/database.dart';

class BookTile extends StatelessWidget {
  final Book _book;
  final bool _isDoneTab;

  BookTile(this._book, this._isDoneTab);

  void _deleteCard(String userID, String bookID) {
    DatabaseService(uid: userID).deleteBook(bookID);
  }

  void _moveCardToOtherTab(String userID, String bookID) {
    DatabaseService(uid: userID).updateBookRead(bookID, !_isDoneTab);
  }

  @override
  Widget build(BuildContext context) {
    final userID = Provider.of<String>(context, listen: false);
    return Dismissible(
      key: Key(_book.hashCode.toString()),
      direction: _isDoneTab
          ? DismissDirection.endToStart
          : DismissDirection.startToEnd,
      background: _bgCard(_isDoneTab),
      onDismissed: (_) => _moveCardToOtherTab(userID, _book.id),
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
                onPressed: () => _deleteCard(userID, _book.id),
              ))),
    );
  }
}

Widget _bgCard(isDoneTab) {
  if (isDoneTab) {
    return Padding(
        padding: EdgeInsets.only(right: 15),
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.cancel,
            color: Colors.yellow,
          ),
        ));
  } else{
    return Padding(
        padding: EdgeInsets.only(left: 15),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.done,
            color: Colors.green,
          ),
        ));
  }
}
