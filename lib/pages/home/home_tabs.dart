import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/add_items_page/add_item.dart';
import 'package:rozrywka/add_items_page/add_movie_api.dart';
import 'package:rozrywka/menu/nav_drawer.dart';
import 'package:rozrywka/menu/option.dart';
import 'package:rozrywka/models/book.dart';
import 'package:rozrywka/models/game.dart';
import 'package:rozrywka/models/item_card.dart';
import 'package:rozrywka/models/movie.dart';
import 'package:rozrywka/models/series.dart';
import 'package:rozrywka/pages/home/create_tabs.dart';
import 'package:rozrywka/services/auth.dart';
import 'package:rozrywka/services/database.dart';

import '../../widgets/item_list.dart';

class HomeTabs extends StatelessWidget {
  HomeTabs();

  final Map<Option, OptionData> options = optionsData; //dependency!
  final Map<Option, OptionTabView> specifics = specificsTabs; //dependency

  void _newIntent(context, page) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => page == Option.film
                ? AddMovieApi()
                : AddItem(specifics[page].typeOfNewItem, false)));
  }

  List<ItemCard> getItems(Option page, String userID, context) {
    switch (page) {
      case Option.film:
        return Provider.of<List<Movie>>(context);
        break;
      case Option.series:
        return Provider.of<List<Series>>(context);
        break;
      case Option.book:
        return Provider.of<List<Book>>(context);
        break;
      case Option.game:
        return Provider.of<List<Game>>(context);
        break;
      case Option.logout:
        // TODO: Handle this case.
        break;
    }
  }

  List<ItemCard> _selectItemsByIsDone(var allItems, bool isDone) {
    return allItems.where((b) => b.isDone == isDone).toList();
  }

  @override
  Widget build(BuildContext context) {
    final page = Provider.of<ValueNotifier<Option>>(context);
    final userID = Provider.of<String>(context);
    var items = getItems(page.value, userID, context);
    print('HomeTabs: refresh');
    if (page.value == Option.logout)
      return Container(
          color: Colors.white,
          child: Center(child: CircularProgressIndicator()));
    else {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _newIntent(context, page.value),
          ),
          drawer: NavDrawer(), //dependence
          appBar: AppBar(
            title: Text(options[page.value].title),
            bottom: TabBar(
              tabs: [
                Text(specifics[page.value].titleOne),
                Text(specifics[page.value].titleTwo),
              ],
            ),
          ),
          body: _tabsOrLoading(items),
        ),
      );
    }
  }

  Widget _tabsOrLoading(List<ItemCard> items) {
    print('HomeTabs: _tabsOrLoading: refresh');
    List<Widget> children;
    if (items != null) {
      children = <Widget>[
        ItemList(items: _selectItemsByIsDone(items, false), isDoneTab: false),
        ItemList(items: _selectItemsByIsDone(items, true), isDoneTab: true)
      ];
    }
    else{
      children = <Widget>[
        Center(child: CircularProgressIndicator()),
        Center(child: CircularProgressIndicator())
      ];
    }
    return TabBarView(
      children: children,
    );
  }
}
