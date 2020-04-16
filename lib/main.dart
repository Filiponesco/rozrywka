import 'package:flutter/material.dart';
import 'package:rozrywka/NavDrawer.dart';
import 'package:rozrywka/AddBook.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _Page createState() => new _Page();
}
class _Page extends State<MyApp> {
  String _title = "Filmy";
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
                debugPrint("click");
              },
            ),
            drawer: NavDrawer(),
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(text: "Chcę zobaczyć"),
                  Tab(text: "Obejrzane"),
                ],
              ),
              title: Text(_title),
            ),
            body: TabBarView(
              children: [
                Text("Chcę zobaczyć"),
                Text("Obejrzane"),
              ],
            ),
          ),
        ),
      )
    );
  }
}