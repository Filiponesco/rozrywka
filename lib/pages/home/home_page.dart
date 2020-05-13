import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/add_items_page/add_book.dart';
import 'package:rozrywka/menu/option.dart';
import 'package:rozrywka/models/book.dart';
import 'package:rozrywka/models/game.dart';
import 'package:rozrywka/models/item_card.dart';
import 'package:rozrywka/models/movie.dart';
import 'package:rozrywka/models/create_tabs.dart';
import 'package:rozrywka/models/series.dart';
import 'package:rozrywka/pages/home/home_tabs.dart';
import 'package:rozrywka/services/database.dart';
import '../../menu/nav_drawer.dart';

class HomePage extends StatelessWidget {
  //final Map<Option, OptionData> options = optionsData; //dependency!

  @override
  Widget build(BuildContext context) {
    final userID = Provider.of<String>(context, listen: false);
    return MultiProvider(
      providers: [
        StreamProvider<List<Movie>>.value(
            value: DatabaseService(uid: userID).movies),
        StreamProvider<List<Series>>.value(
            value: DatabaseService(uid: userID).series),
        StreamProvider<List<Book>>.value(
            value: DatabaseService(uid: userID).books),
        StreamProvider<List<Game>>.value(
            value: DatabaseService(uid: userID).games),
      ],
      child: HomeTabs(),
    );
  }
}
