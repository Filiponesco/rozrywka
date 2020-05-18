import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rozrywka/services/auth.dart';

enum FormType{
  login,
  register
}
class LoginPage extends StatefulWidget{
  LoginPage({this.auth});
  final BaseAuth auth;
  @override
  _LoginPageState createState() => new _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{
  //provide validating form
  final formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  FormType _formType = FormType.login;
  ProgressDialog pr;

  bool validateAndSave(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }else{
      return false;
    }
  }
  void validateAndSubmit(context)async {
    if (validateAndSave()) {
      pr.show();
      try {
        if (_formType == FormType.login) {
          String userID = await widget.auth.signInWithEmailAndPassword(
              _email, _password);
          pr.hide();
          print("Signed in: $userID");
        } else {
          String userID = await widget.auth.createUserWithEmailAndPassword(
              _email, _password);
          pr.hide();
          print("Registered user: $userID");
        }
      }
      on PlatformException catch (e) {
        print("Error: $e");
        pr.hide();
        _showAlert(context, e.message);
      }
      catch(e){
        print(e.toString());
        pr.hide();
        _showAlert(context, 'Nieznany błąd');
      }
    }
  }

  void _showAlert(context, String message) {
    showDialog(
        context: context,
        builder: (context) =>
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: AlertDialog(
            title: Text("Coś poszło nie tak"),
            content: Text(message),
          ),
        )
    );
  }
    void moveToRegister() {
      formKey.currentState.reset();
      setState(() {
        _formType = FormType.register;
      });
    }
    void moveToLogin() {
      formKey.currentState.reset();
      setState(() {
        _formType = FormType.login;
      });
    }
    @override
    Widget build(BuildContext context) {
      pr = new ProgressDialog(context, showLogs: true);
      pr.style(message: 'Logowanie...');
      return Scaffold(
          appBar: AppBar(
            title: Text("Zaloguj się do rozrywki"),
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: buildInputs() + builtSubmitButtons(context)
              ),
            ),
          )
      );
    }
    List<Widget> buildInputs() {
      return [
        TextFormField(
          decoration: InputDecoration(
              labelText: "Email"
          ),
          validator: (value) =>
          value.isEmpty ? "Email nie może być pusty" : null,
          onSaved: (value) => _email = value,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Hasło",
          ),
          obscureText: true,
          validator: (value) =>
          value.isEmpty ? "Hasło nie może być puste" : null,
          onSaved: (value) => _password = value,
        ),
      ];
    }
    List<Widget> builtSubmitButtons(context) {
      if (_formType == FormType.login) {
        return [
          RaisedButton(
            child: Text(
                "Zaloguj"
            ),
            onPressed: () => validateAndSubmit(context),
          ),
          FlatButton(
            child: Text("Zarejestruj się"),
            onPressed: moveToRegister,
          )
        ];
      } else {
        return [
          RaisedButton(
            child: Text(
                "Stwórz konto"
            ),
            onPressed: () => validateAndSubmit(context),
          ),
          FlatButton(
            child: Text("Masz konto? Zaloguj się"),
            onPressed: moveToLogin,
          )
        ];
      }
    }
  }