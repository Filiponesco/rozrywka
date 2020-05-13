import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/menu/option.dart';
import 'package:rozrywka/models/book.dart';
import 'package:rozrywka/models/game.dart';
import 'package:rozrywka/models/item_card.dart';
import 'package:rozrywka/models/movie.dart';
import 'package:rozrywka/models/series.dart';
import 'package:rozrywka/widgets/item_tile.dart';
import 'package:rozrywka/services/database.dart';

class ItemList extends StatefulWidget {
  final bool isDoneTab;

  ItemList({
    @required this.isDoneTab,
  });

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List _selectItemsByIsDone(var allItems){
    return allItems.where((b) => b.isDone == widget.isDoneTab).toList();
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = Provider.of<ValueNotifier<Option>>(context);
    switch(currentPage.value){

      case Option.film:
        final movies = Provider.of<List<Movie>>(context);
        var moviesOneTab = _selectItemsByIsDone(movies);
        return _buildListItems(moviesOneTab);
        break;
      case Option.series:
        final seriesList = Provider.of<List<Series>>(context);
        final List<Series> seriesListOneTab = _selectItemsByIsDone(seriesList);
        return _buildListItems(seriesListOneTab);
        break;
      case Option.book:
        final books = Provider.of<List<Book>>(context);
        final List<Book> booksOneTab = _selectItemsByIsDone(books);
        return _buildListItems(booksOneTab);
        break;
      case Option.game:
        final games = Provider.of<List<Game>>(context);
        final List<Game> gamesOneTab = _selectItemsByIsDone(games);
        return _buildListItems(gamesOneTab);
        break;
      case Option.logout:
        // TODO: Handle this case.
        break;


    }
  }
  Widget _buildListItems(items){
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) =>
            ItemTile(items[index], widget.isDoneTab));
  }
}
