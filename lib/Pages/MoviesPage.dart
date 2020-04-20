import 'package:flutter/material.dart';
import 'package:rozrywka/Option.dart';

import '../NavDrawer.dart';
class MoviesPage extends StatelessWidget{
  MoviesPage(this.onSelected);
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
//                onPressed: (){
//                  Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => /*AddMovie()*/));
//                },
              ),
              drawer: NavDrawer(optionsData, Option.film, onSelected),
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(
                        text: "Chcę zobaczyć"
                    ),
                    Tab(text: "Obejrzane"),
                  ],
                ),
                title: Text("Filmy"),
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