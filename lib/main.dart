import 'package:flutter/material.dart';
import 'package:rozrywka/Pages/MoviesPage.dart';
import 'package:rozrywka/login_page.dart';

import 'Auth.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _Page createState() => new _Page();
}
class _Page extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return LoginPage(auth: Auth());
  }
}