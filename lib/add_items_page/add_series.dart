import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/models/series.dart';
import 'package:rozrywka/services/database.dart';

class AddSeries extends StatelessWidget {
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
              title: Text("Dodaj serial")),
          body: AddSeriesForm(),
        ));
  }
}

class AddSeriesForm extends StatefulWidget {
  @override
  _AddSeriesFormState createState() {
    return _AddSeriesFormState();
  }
}

class _AddSeriesFormState extends State<AddSeriesForm> {
  final _formKey = GlobalKey<FormState>();
  Series _series = Series();

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
      await DatabaseService(uid: userID).addItem(_series);
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
              onSaved: (value) => _series.title = value,
              validator: (value) =>
              value.isEmpty ? "Tytuł nie może być pusty" : null,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Tytuł'),
            ),
            SizedBox(height: 10),
            TextFormField(
              onSaved: (value) => _series.director = value,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Reżyser'),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Flexible(
                  child: TextFormField(
                    onSaved: (value) => _series.releasedYear = value,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Rok wydania'),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    onSaved: (value) => _series.note = value,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Ocena'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextFormField(
              onSaved: (value) => _series.plot = value,
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
                        _series.isDone = value;
                      });
                    },
                    value: _series.isDone),
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
