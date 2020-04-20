import 'package:flutter/material.dart';
class AddBook extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text("Dodaj książkę")
            ),
            body: ListView(
              padding: EdgeInsets.all(8),
              children: <Widget>[
                SizedBox(height: 10),
                TextField(
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tytuł'
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
                            labelText: 'Imie'
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Nazwisko'
                        ),
                      ),
                    ),
                  ],
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
                            labelText: 'Wydawnictwo'
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Liczba stron'
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Numer ISBN'
                  ),
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