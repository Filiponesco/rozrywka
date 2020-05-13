import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/models/game.dart';
import 'package:rozrywka/services/auth.dart';
import 'package:rozrywka/services/database.dart';

class AddGame extends StatelessWidget {
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
              title: Text("Dodaj grę")),
          body: AddGameForm(),
        ));
  }
}

class AddGameForm extends StatefulWidget {
  @override
  _AddGameFormState createState() {
    return _AddGameFormState();
  }
}

class _AddGameFormState extends State<AddGameForm> {
  final _formKey = GlobalKey<FormState>();
  Game _game = Game();

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void _validateAndSend(String userID) async {
    if (_validateAndSave()) {
      await DatabaseService(uid: userID).addItem(
          _game);
      _showSnackBar("Zapisano");
    }
  }

  void _showSnackBar(String message) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final userID = Provider.of<String>(context);
    return Form(
      key: _formKey,
      child: ListView(padding: EdgeInsets.all(8), children: <Widget>[
        SizedBox(height: 10),
        TextFormField(
          onSaved: (value) => _game.title = value,
          validator: (value) =>
          value.isEmpty ? "Tytuł nie może być pusty" : null,
          textCapitalization: TextCapitalization.words,
          decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: 'Tytuł'),
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Flexible(
              child: TextFormField(
                onSaved: (value) => _game.forename = value,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Imie'),
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: TextFormField(
                onSaved: (value) => _game.surname = value,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Nazwisko'),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextFormField(
          onSaved: (value) => _game.category = value,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'Kategoria'),
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Flexible(
              child: TextFormField(
                onSaved: (value) => _game.publishedDate = value,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Rok wydania'),
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: TextFormField(
                onSaved: (value) => _game.publisher = value,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Wydawnictwo'),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextFormField(
          onSaved: (value) => _game.platforms = value,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'Platforma'),
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Checkbox(
                onChanged: (value) {
                  setState(() {
                    _game.isDone= value;
                  });
                },
                value: _game.isDone),
            Text("Zagrana", style: TextStyle(fontSize: 17)),
          ],
        ),
        SizedBox(height: 10),
        FlatButton(
          color: Colors.blue,
          onPressed: () => _validateAndSend(userID),
          child: Text("Zapisz"),
        )
      ]),
    );
  }
}
