import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/add_items_page/add_item.dart';
import 'package:rozrywka/main.dart';
import 'package:rozrywka/menu/option.dart';
import 'package:rozrywka/models/book.dart';
import 'package:rozrywka/models/game.dart';
import 'package:rozrywka/models/item_card.dart';
import 'package:rozrywka/models/movie.dart';
import 'package:rozrywka/models/series.dart';

class ItemInfo extends StatelessWidget {
  final ItemCard item;
  ItemInfo(this.item){
    print('ItemInfo: constructor');
  }

  void _newIntentEditItem(context, item) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddItem(item, true)));
  }

  @override
  Widget build(BuildContext context) {
    print('ItemInfo: build');
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => _newIntentEditItem(context, item),
          )
        ],
      ),
      body: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(item.cardTitle, style: TextStyle(fontSize: 30)),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Icon(
                        item.icon,
                        size: 100.0
                      )
                    ),
                    ..._nameFields(item)
                  ],
                ),
              ),
            ],
          )),
    ));
  }

  List<Widget> _nameFields(item) {
    var fields = item.toJson();
    var fieldsPL = item.jsonToPL();
    return fields.keys
        .map<Widget>((key) => key != 'id' &&
                key != 'title' &&
                key != 'Title' &&
                fields[key] != '' &&
                key != 'isDone'
            ? Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: '${fieldsPL[key]}: ',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '${fields[key]}',
                            style: TextStyle(fontSize: 15.0))
                      ]),
                    )),
              )
            : Container(
                width: 0,
                height: 0,
              ))
        .toList();
  }
}
