import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/models/movie.dart';
import 'package:rozrywka/services/api_movies.dart';
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
  var _txtTitle = TextEditingController();
  var _txtDirector = TextEditingController();
  var _txtYear = TextEditingController();
  var _txtPlot = TextEditingController();
  FocusNode myFocusNode;
  ProgressDialog pr;

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
      _showSnackBar(message: "Zapisano");
    }
  }

  void _showSnackBar({String message, Color color}) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }

  void _searchMovie() async {
    final form = _formKey.currentState;
    if (form.validate()) {
      myFocusNode.unfocus();
      pr.show();
      try {
        Movie m = await ApiMovies().searchMovie(_txtTitle.text);
        print("Movie: ${m.title} ${m.director} ${m.year} ${m.plot}");
        pr.hide();
        _setText(m);
        _showSnackBar(message: 'Znaleziono film');
      } catch (e) {
        print("EXCEPTION");
        pr.hide();
        _resetText();
        _showSnackBar(message: e['Error'], color: Colors.red);
      }
    }
  }

  void _setText(Movie m) {
    _txtTitle.text = m.title == 'N/A' ? '' : m.title;
    _txtDirector.text = m.director == 'N/A' ? '' : m.director;
    _txtYear.text = m.year == 'N/A' ? '' : m.year;
    _txtPlot.text = m.plot == 'N/A' ? '' : m.plot;
  }
  void _resetText(){
    _txtTitle.clear();
    _txtDirector.clear();
    _txtYear.clear();
    _txtPlot.clear();
  }

  @override void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }
  @override
  Widget build(BuildContext context) {
    final userID = Provider.of<String>(context);
    pr = new ProgressDialog(context, showLogs: true);
    pr.style(message: 'Ładowanie filmu...');
    //return Text("abc");
    return Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(8),
          children: <Widget>[
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: TextFormField(
                    focusNode: myFocusNode,
                    controller: _txtTitle,
                    onSaved: (value) => _movie.title = value,
                    validator: (value) =>
                        value.isEmpty ? "Tytuł nie może być pusty" : null,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Tytuł'),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: FlatButton(
                    color: Colors.blue,
                    child: Text("Wyszukaj"),
                    onPressed: () => _searchMovie(),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _txtDirector,
              onSaved: (value) => _movie.director = value,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Reżyser'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _txtYear,
              onSaved: (value) => _movie.year = value,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Rok wydania'),
            ),
            SizedBox(height: 10),
            TextFormField(
              maxLines: null,
              controller: _txtPlot,
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
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _txtTitle.dispose();
    _txtDirector.dispose();
    _txtYear.dispose();
    _txtPlot.dispose();
    myFocusNode.dispose();
    super.dispose();
  }
}
