import 'package:flutter/material.dart';
import 'package:rozrywka/Pages/MoviesPage.dart';

import 'Pages/BooksPage.dart';
import 'Pages/GamesPage.dart';
import 'Option.dart';
import 'Pages/SeriesPage.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _Page createState() => new _Page();
}
class _Page extends State<MyApp> {
  Option _currentPage = Option.film;
  void onSelectedMenu(selected){
    setState(() {
      _currentPage = selected;
    });
  }
  @override
  Widget build(BuildContext context) {
      switch(_currentPage){
        case Option.film:
         return MoviesPage(onSelectedMenu);
          break;
        case Option.series:
          return SeriesPage(onSelectedMenu);
          break;
        case Option.book:
          return BooksPage(onSelectedMenu);
          break;
        case Option.game:
          return GamesPage(onSelectedMenu);
          break;
        case Option.logout:
          // TODO: Handle this case.
          break;
        default: return MoviesPage(onSelectedMenu);
        break;
      }
  }
}