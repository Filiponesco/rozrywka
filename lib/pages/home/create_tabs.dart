import 'package:rozrywka/menu/option.dart';
import 'package:rozrywka/models/book.dart';
import 'package:rozrywka/models/series.dart';

import '../../models/game.dart';
import '../../models/movie.dart';

class OptionTabView {
  String titleOne;
  String titleTwo;
  var typeOfNewItem;
  var onClickCard;

  OptionTabView(
      {this.titleOne,
      this.titleTwo,
      this.typeOfNewItem,
      this.onClickCard});
}

Map<Option, OptionTabView> specificsTabs = {
  Option.book: OptionTabView(
      titleOne: "Chcę przeczytać",
      titleTwo: "Przeczytana",
  typeOfNewItem: Book()),
  Option.film: OptionTabView(
    titleOne: "Chcę obejrzeć",
    titleTwo: "Obejrzany",
      typeOfNewItem: Movie()),
  Option.series: OptionTabView(
    titleOne: "Chcę obejrzeć",
    titleTwo: "Obejrzany",
      typeOfNewItem: Series()
  ),
  Option.game: OptionTabView(
    titleOne: "Chcę zagrać",
    titleTwo: "Zagrane",
      typeOfNewItem: Game()
  ),

};
