import 'package:flutter/material.dart';
import 'package:rozrywka/Option.dart';

import '../AddBook.dart';
import '../NavDrawer.dart';
class BooksPage extends StatelessWidget{
  BooksPage(this.onSelected);
  final Function(Option) onSelected; //only pass to NavDrawer
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(
          builder: (context) => DefaultTabController(
            length: 2,
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddBook()));
                },
              ),
              drawer: NavDrawer(optionsData, Option.film, onSelected),
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(
                        text: "Chcę przeczytać"
                    ),
                    Tab(text: "Przeczytane"),
                  ],
                ),
                title: Text("Książki"),
              ),
              body: TabBarView(
                children: [
                  Text("Chcę"),
                  Text("Przeczytane")
                ],
              ),
            ),
          ),
        )
    );
  }

}