import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/option.dart';

import '../nav_drawer.dart';

class MainPage extends StatelessWidget {
  final Map<Option, OptionData> options = optionsData; //dependency!
  void _addNewItems(currentPage) {
    /* Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddMovie()));*/
  }

  @override
  Widget build(BuildContext context) {
    var currentPage = Provider.of<ValueNotifier<Option>>(context);
    //it needs consumer to update state
    return MaterialApp(
        home: Builder(
      builder: (context) => DefaultTabController(
        length: pagesData[currentPage.value].tabs.length,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              _addNewItems(currentPage);
            },
          ),
          drawer: NavDrawer(), //dependence
          appBar: _appBarAndTabTitle(currentPage),
          body: TabBarView(
            children: [..._tabsContent(currentPage)],
          ),
        ),
      ),
    ));
  }

  Widget _appBarAndTabTitle(currentPage) {
    return AppBar(
        title: Text(options[currentPage.value].title),
        bottom: TabBar(
          tabs: [
            ..._tabsTitle(currentPage),
          ],
        ));
  }
  //for specific page
  List<Widget> _tabsTitle(currentPage){
    int numberOfTabs = pagesData[currentPage.value].tabs.length;
    List<Widget> tabs = List<Widget>();
    for(int i = 0; i < numberOfTabs; i++)
      tabs.add(Tab(text: pagesData[currentPage.value].tabs[i].title));
    return tabs;
  }
  List<Widget> _tabsContent(currentPage){
    int numberOfTabs = pagesData[currentPage.value].tabs.length;
    List<Widget> tabsContent = List<Widget>();
    for(int i = 0; i < numberOfTabs; i++){
      tabsContent.add(Text(pagesData[currentPage.value].tabs[i].content));
    }
    return tabsContent;
  }
}
