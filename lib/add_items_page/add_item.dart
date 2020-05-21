import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/models/item_card.dart';
import 'package:rozrywka/services/database.dart';

class AddItem extends StatelessWidget {
  final ItemCard item;
  final bool isEditing;

  //item can contain also a few data for example only titleAddItem
  AddItem(this.item, this.isEditing);

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
          title:
              isEditing ? Text(item.titleEditItem) : Text(item.titleAddItem)),
      body: AddItemForm(item, isEditing),
    ));
  }
}

class AddItemForm extends StatefulWidget {
  final ItemCard _item;
  final bool _isEditing;

  AddItemForm(this._item, this._isEditing);

  @override
  _AddItemFormState createState() {
    return _AddItemFormState();
  }
}

class _AddItemFormState extends State<AddItemForm> {
  final _formKey = GlobalKey<FormState>();
  var _itemJS, _itemLabelPL;
  String userID;
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
      print('AddItem: ${_itemJS}');
      await DatabaseService(uid: userID)
          .addItem(_itemJS, widget._item.tableName);
      _showSnackBar(message: "Zapisano");
    }
  }

  void _validateAndUpdate(String userID) async {
    if (_validateAndSave()) {
      // need to pass table name because json doesnt contains info about it
      await DatabaseService(uid: userID)
          .updateItem(_itemJS, widget._item.tableName);
      print('Aktualizacja: $_itemJS');
      _showSnackBar(message: "Zaktualizowano");
    }
  }

  void _showSnackBar({String message, Color color}) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }

  @override
  Widget build(BuildContext context) {
    userID = Provider.of<String>(context, listen: false);
    _itemJS = widget._item.toJson();
    _itemLabelPL = widget._item.jsonToPL();

    return Form(
      key: _formKey,
      child: _listFields(),
    );
  }

  Widget _listFields() {
    return ListView(padding: EdgeInsets.all(8), children: <Widget>[
      ..._textFields(),
      MyCheckBox(_itemJS, _itemLabelPL),
      _saveBtn()
    ]);
  }

  List<Widget> _textFields() {
    return _itemJS.keys
        .map<Widget>((key) => key != 'isDone' && key != 'id'
            ? _oneField(key, _itemJS[key])
            : Container())
        .toList();
  }

  Widget _oneField(key, value) {
    //if (widget._item is Book) print("it is Book");
    final controller = TextEditingController(); //todo dispose!
    controller.text = value;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        maxLines: key == 'plot' || key == 'Plot' ? null : 1,
        validator: key == 'title' || key == 'Title'
            ? (value) => value.isEmpty ? "Tytuł nie może być pusty" : null
            : null,
        onSaved: (value) => _itemJS[key] = value,
        textCapitalization: key != 'plot' && key != 'Plot'
            ? TextCapitalization.words
            : TextCapitalization.sentences,
        decoration: InputDecoration(
            border: OutlineInputBorder(), labelText: _itemLabelPL[key]),
      ),
    );
  }

  Widget _saveBtn() {
    return FlatButton(
      color: Colors.blue,
      onPressed: () => widget._isEditing
          ? _validateAndUpdate(userID)
          : _validateAndSend(userID),
      child: Text("Zapisz"),
    );
  }
}

class MyCheckBox extends StatefulWidget {
  final _itemJS;
  final _itemLabelPL;

  MyCheckBox(this._itemJS, this._itemLabelPL);

  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
            onChanged: (value) {
              setState(() {
                widget._itemJS['isDone'] = value;
              });
            },
            value: widget._itemJS['isDone']),
        Text(widget._itemLabelPL['isDone'], style: TextStyle(fontSize: 17)),
      ],
    );
  }
}
