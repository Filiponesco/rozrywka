import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/models/book.dart';
import 'package:rozrywka/pages/home/book_tile.dart';

class BookList extends StatefulWidget {
  final bool _isDone;
  BookList(this._isDone);
  @override
    _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    final books = Provider.of<List<Book>>(context);
    //print(books.documents);
    final List<Book> booksOneTab = books.where((b) => b.isRead = widget._isDone).toList();
    for(var doc in books){
      print(doc.pages);
    }
    return ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) => BookTile(booksOneTab[index]));
  }
}
