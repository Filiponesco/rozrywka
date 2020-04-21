import 'package:flutter/material.dart';

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

class TabProperty {
  TabProperty(this.title, {this.content});

  final String title;
  String content = "";
}

class TabsOption {
  TabsOption(this.tabs);

  final List<TabProperty> tabs;
}

Map<Option, TabsOption> pagesData = {
  Option.film: TabsOption([
    TabProperty("Chcę objerzeć", content: "Tutaj wyświetlę filmy"),
    TabProperty("Obejrzane", content: "Tutaj będą obejrzane filmy"),
  ]),
  Option.series: TabsOption([
    TabProperty("Chcę objerzeć", content: "Tutaj wyświetlę seriale"),
    TabProperty("Obejrzane", content: "Tutaj będą obejrzane seriale")
  ]),
  Option.book: TabsOption([
    TabProperty("Chcę przeczytać", content: "Tutaj wyświetlę książki"),
    TabProperty("Przeczytane", content: "Tutaj wyświetlę przeczytane książki")
  ]),
  Option.game: TabsOption(
      [TabProperty("Chcę zagrać", content: "Tutaj wyświetlę gry"),
        TabProperty("Zagrane", content: "Tutaj wyświetlę zagrane gry")
      ]),
  Option.logout: TabsOption([])
};
