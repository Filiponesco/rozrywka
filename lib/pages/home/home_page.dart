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
    return HomeTabs();
  }
}
