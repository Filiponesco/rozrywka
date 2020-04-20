import 'package:flutter/material.dart';
import 'package:rozrywka/Option.dart';

import '../NavDrawer.dart';
class SeriesPage extends StatelessWidget{
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
              drawer: NavDrawer(optionsData, Option.series),
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(
                        text: "Chcę zobaczyć"
                    ),
                    Tab(text: "Obejrzane"),
                  ],
                ),
                title: Text("Seriale"),
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