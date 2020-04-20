import 'package:flutter/material.dart';
import 'package:rozrywka/Option.dart';

import '../AddGame.dart';
import '../NavDrawer.dart';
class GamesPage extends StatelessWidget{
  GamesPage(this.onSelected);
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
                      MaterialPageRoute(builder: (context) => AddGame()));
                },
              ),
              drawer: NavDrawer(optionsData, Option.game, onSelected),
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(
                        text: "Chcę zagrać"
                    ),
                    Tab(text: "Zagrane"),
                  ],
                ),
                title: Text("Gry"),
              ),
              body: TabBarView(
                children: [
                  Text("Obejrzane"),
                  Text("Obejrzane")
                ],
              ),
            ),
          ),
        )
    );
  }

}