import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/add_items_page/add_item.dart';
import 'package:rozrywka/add_items_page/add_movie_api.dart';
import 'package:rozrywka/menu/nav_drawer.dart';
import 'package:rozrywka/menu/option.dart';
import 'package:rozrywka/models/item_card.dart';
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

  Stream<List<ItemCard>> getItems(Option page, String userID) {
    switch (page) {
      case Option.film:
        return DatabaseService(uid: userID).movies;
        break;
      case Option.series:
        return DatabaseService(uid: userID).series;
        break;
      case Option.book:
        return DatabaseService(uid: userID).books;
        break;
      case Option.game:
        return DatabaseService(uid: userID).games;
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
    if (page.value == Option.logout)
      return Container(
          color: Colors.white,
          child: Center(child: CircularProgressIndicator()));
    else {
      final userID = Provider.of<String>(context);
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
          body: _tabsOrLoading(getItems(page.value, userID)),
        ),
      );
    }
  }

  Widget _tabsOrLoading(Stream<List<ItemCard>> items) {
    return StreamBuilder<List<ItemCard>>(
      stream: items,
      builder: (context, AsyncSnapshot<List<ItemCard>> snapshot) {
        List<Widget> children;
        if (!snapshot.hasData) {
          children = <Widget>[
            Center(child: CircularProgressIndicator()),
            Center(child: CircularProgressIndicator())
          ];
        } else {
          print('Data: ${snapshot.data}');
          children = <Widget>[
            ItemList(
                items: _selectItemsByIsDone(snapshot.data, false),
                isDoneTab: false),
            ItemList(
                items: _selectItemsByIsDone(snapshot.data, true),
                isDoneTab: true)
          ];
        }
        return TabBarView(
          children: children,
        );
      },
    );
  }
}
