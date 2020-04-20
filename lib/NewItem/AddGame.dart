import 'package:flutter/material.dart';
class AddGame extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text("Dodaj Grę")
            ),
            body: ListView(
                padding: EdgeInsets.all(8),
                children: <Widget>[
                  SizedBox(height: 10),
                  TextField(
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tytuł gry'
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Kategoria'
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Rok wydania'
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: TextField(
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Wytwórnia'
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  FlatButton(
                    color: Colors.blue,
                    onPressed: (){},
                    child: Text("Zapisz"),
                  )
                ]
            )
        )
    );
  }
}