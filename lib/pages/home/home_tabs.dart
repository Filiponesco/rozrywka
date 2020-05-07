import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/add_items_page/add_book.dart';
import 'package:rozrywka/menu/nav_drawer.dart';
import 'package:rozrywka/menu/option.dart';
import 'package:rozrywka/models/book.dart';
import 'package:rozrywka/services/database.dart';

import 'book_list.dart';

class HomeTabs extends StatelessWidget {
  HomeTabs(this.page);
  final Option page;
  final Map<Option, OptionData> options = optionsData; //dependency!

  void _newIntent(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => AddBook()));
  }

  @override
  Widget build(BuildContext context) {
    final userID = Provider.of<String>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _newIntent(context),
        ),
        drawer: NavDrawer(), //dependence
        appBar: AppBar(
          title: Text(optionsData[page].title),
          bottom: TabBar(
            tabs: [
              Text("Chcę obejrzeć"),
              Text("Obejrzane"),
            ],
          ),
        ),
        // i decide to keep tab with data
        body: StreamProvider<List<Book>>.value(
          value: DatabaseService(uid: userID).books,
          child:  TabBarView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              _tab1(),
              _tab2(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tab1() {
    return BookList(isDoneTab: false, page: page,);
  }

  Widget _tab2() {
    return BookList(isDoneTab: true, page: page);
  }
}