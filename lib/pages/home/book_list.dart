import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/menu/option.dart';
import 'package:rozrywka/models/book.dart';
import 'package:rozrywka/pages/home/book_tile.dart';

class BookList extends StatefulWidget {
  final bool isDoneTab;
  final Option page;

  BookList({
    @required this.page,
    @required this.isDoneTab,
  });

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {

  @override
  Widget build(BuildContext context) {
    final books = Provider.of<List<Book>>(context);
    //print(books.documents);
    final List<Book> booksOneTab =
        books.where((b) => b.isRead == widget.isDoneTab).toList();

    for (var doc in booksOneTab) {
      print("Widget: ${widget.isDoneTab} ${doc.title} isRead: ${doc.isRead}");
    }
    return ListView.builder(
        itemCount: booksOneTab.length,
        itemBuilder: (context, index) =>
            BookTile(booksOneTab[index], widget.isDoneTab));
  }
}
