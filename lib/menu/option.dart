import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/services/database.dart';

enum Option { film, series, book, game, logout }

class OptionData {
  OptionData(this.iconData, this.title);

  final IconData iconData;
  final String title;
}

Map<Option, OptionData> optionsData = {
  Option.film: OptionData(Icons.movie, 'Filmy'),
  Option.series: OptionData(Icons.local_movies, 'Seriale'),
  Option.book: OptionData(Icons.library_books, 'Książki'),
  Option.game: OptionData(Icons.games, 'Gry'),
  Option.logout: OptionData(Icons.exit_to_app, 'Wyloguj'),
};

