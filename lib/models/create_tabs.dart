import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/add_items_page/add_book.dart';
import 'package:rozrywka/add_items_page/add_game.dart';
import 'package:rozrywka/add_items_page/add_movie.dart';
import 'package:rozrywka/add_items_page/add_series.dart';
import 'package:rozrywka/menu/option.dart';
import 'package:rozrywka/models/book.dart';
import 'package:rozrywka/models/item_card.dart';
import 'package:rozrywka/services/database.dart';

class OptionTabView {
  String titleOne = "titleONe";
  String titleTwo;
  var addNewItemPage;

  OptionTabView(
      {this.titleOne,
      this.titleTwo,
      this.addNewItemPage});
}

Map<Option, OptionTabView> specificsTabs = {
  Option.book: OptionTabView(
      titleOne: "Chcę przeczytać",
      titleTwo: "Przeczytana",
  addNewItemPage: (_) => AddBook()),
  Option.film: OptionTabView(
    titleOne: "Chcę obejrzeć",
    titleTwo: "Obejrzany",
      addNewItemPage: (_) => AddMovie()),
  Option.series: OptionTabView(
    titleOne: "Chcę obejrzeć",
    titleTwo: "Obejrzany",
    addNewItemPage: (_) => AddSeries()
  ),
  Option.game: OptionTabView(
    titleOne: "Chcę zagrać",
    titleTwo: "Zagrane",
    addNewItemPage: (_) => AddGame()
  ),

};
