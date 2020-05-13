import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/models/movie.dart';
import 'package:rozrywka/services/database.dart';

class AddMovie extends StatelessWidget {
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
          title: Text("Dodaj film")),
      body: AddMovieForm(),
    ));
  }
}

class AddMovieForm extends StatefulWidget {
  @override
  _AddMovieFormState createState() {
    return _AddMovieFormState();
  }
}

class _AddMovieFormState extends State<AddMovieForm> {
  final _formKey = GlobalKey<FormState>();
  Movie _movie = Movie();

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
      await DatabaseService(uid: userID).addItem(_movie);
      _showSnackBar("Zapisano");
    }
  }

  void _showSnackBar(String message) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final userID = Provider.of<String>(context);
    //return Text("abc");
    return Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(8),
          children: <Widget>[
            SizedBox(height: 10),
            TextFormField(
              onSaved: (value) => _movie.title = value,
              validator: (value) =>
                  value.isEmpty ? "Tytuł nie może być pusty" : null,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Tytuł'),
            ),
            SizedBox(height: 10),
            TextFormField(
                onSaved: (value) => _movie.director = value,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Reżyser'),
              ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Flexible(
                  child: TextFormField(
                    onSaved: (value) => _movie.year = value,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Rok wydania'),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    onSaved: (value) => _movie.note = value,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Ocena'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextFormField(
              onSaved: (value) => _movie.plot = value,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Opis'),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Checkbox(
                    onChanged: (value) {
                      setState(() {
                        _movie.isDone = value;
                      });
                    },
                    value: _movie.isDone),
                Text("Obejrzany", style: TextStyle(fontSize: 17)),
              ],
            ),
            SizedBox(height: 10),
            FlatButton(
              color: Colors.blue,
              onPressed: () => _validateAndSend(userID),
              child: Text("Zapisz"),
            ),
          ],
        ));
  }
}
