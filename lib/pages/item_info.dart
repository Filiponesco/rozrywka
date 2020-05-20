import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rozrywka/add_items_page/add_item.dart';
import 'package:rozrywka/models/item_card.dart';

class ItemInfo extends StatelessWidget {
  final ItemCard item;

  ItemInfo(this.item);

  void _newIntentEditItem(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddItem(item, true)));
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: () => _newIntentEditItem(context),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(item.cardTitle, style: TextStyle(fontSize: 30)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[..._nameFields()],
                  )
                ],
              )
            ],
          )),
    ));
  }

  List<Widget> _nameFields() {
    var fields = item.toJson();
    return fields.keys
        .map((key) => key != 'id'
            ? Text('$key: ${fields[key]}')
            : Container(
                width: 0,
                height: 0,
              ))
        .toList();
  }
}
