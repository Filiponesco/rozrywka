import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/models/book.dart';
import 'package:rozrywka/models/game.dart';
import 'package:rozrywka/models/movie.dart';
import 'package:rozrywka/models/series.dart';
import 'package:rozrywka/pages/home/home_tabs.dart';
import 'package:rozrywka/services/database.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final userID = Provider.of<String>(context, listen: false);
    //this multiProvider allows to update all widgets when sth change in firebase,
    //for example: ItemInfo
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
    return HomeTabs();
  }
}
