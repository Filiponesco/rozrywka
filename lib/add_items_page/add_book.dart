import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/models/book.dart';
import 'package:rozrywka/services/auth.dart';
import 'package:rozrywka/services/database.dart';

class AddBook extends StatelessWidget {
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
          title: Text("Dodaj książkę")),
      body: AddBookForm(),
    ));
  }
}

class AddBookForm extends StatefulWidget {
  @override
  _AddBookFormState createState() {
    return _AddBookFormState();
  }
}

class _AddBookFormState extends State<AddBookForm> {
  final _formKey = GlobalKey<FormState>();
  Book _book = Book();

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
      await DatabaseService(uid: userID).addBook(
          _book.surname,
          _book.forename,
          _book.title,
          _book.category,
          _book.publishedDate,
          _book.publisher,
          _book.pages,
          _book.isbn,
          _book.isRead);
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
          onSaved: (value) => _book.title = value,
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
                onSaved: (value) => _book.forename = value,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Imie'),
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: TextFormField(
                onSaved: (value) => _book.surname = value,
                validator: (value) =>
                    value.isEmpty ? "Nazwisko autora nie może być puste" : null,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Nazwisko'),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextFormField(
          onSaved: (value) => _book.category = value,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'Kategoria'),
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Flexible(
              child: TextFormField(
                onSaved: (value) => _book.publishedDate = value,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Rok wydania'),
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: TextFormField(
                onSaved: (value) => _book.publisher = value,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Wydawnictwo'),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextFormField(
          onSaved: (value) => _book.pages = value,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'Liczba stron'),
        ),
        SizedBox(height: 10),
        TextFormField(
          onSaved: (value) => _book.isbn = value,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'Numer ISBN'),
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            Checkbox(

                onChanged: (value) {
                  setState(() {
                    _book.isRead = value;
                  });
                },
                value: _book.isRead),
            Text("Przeczytana", style: TextStyle(fontSize: 17)),
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
