import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/add_items_page/add_book.dart';
import 'package:rozrywka/menu/option.dart';
import 'package:rozrywka/pages/home/home_tabs.dart';
import '../../menu/nav_drawer.dart';

class HomePage extends StatelessWidget {
  final Map<Option, OptionData> options = optionsData; //dependency!

  @override
  Widget build(BuildContext context) {
    var currentPage = Provider.of<ValueNotifier<Option>>(context);
    switch (currentPage.value) {
      case Option.film:
        return HomeTabs(options[currentPage.value]);
        break;
      case Option.series:
      // TODO: Handle this case.
        break;
      case Option.book:
        return HomeTabs(options[currentPage.value]);
        break;
      case Option.game:
      // TODO: Handle this case.
        break;
      case Option.logout:
      // TODO: Handle this case.
      // Are you sure to logout?
        break;
    }
  }
}
