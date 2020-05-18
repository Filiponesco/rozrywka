import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/menu/nav_drawer.dart';
import 'package:rozrywka/menu/option.dart';
import 'package:rozrywka/models/create_tabs.dart';
import 'package:rozrywka/services/auth.dart';

import '../../widgets/item_list.dart';

class HomeTabs extends StatelessWidget {
  HomeTabs();
  final Map<Option, OptionData> options = optionsData; //dependency!
  final Map<Option, OptionTabView> specifics = specificsTabs; //dependency
  void _newIntent(context, page) {
    Navigator.push(context,
        MaterialPageRoute(builder:  specifics[page].addNewItemPage));
  }

  @override
  Widget build(BuildContext context) {
    final page = Provider.of<ValueNotifier<Option>>(context);
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
        body: TabBarView(
            children: <Widget>[
              ItemList(isDoneTab: false,),
              ItemList(isDoneTab: true,)
            ],
          ),
        ),
      );
  }
}
