import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/Pages/main_page.dart';
import 'package:rozrywka/login_page.dart';

import 'Auth.dart';
import 'option.dart';

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
    //return LoginPage(auth: Auth());
    return ChangeNotifierProvider<ValueNotifier<Option>>(
        create: (context) => ValueNotifier<Option>(Option.values[0]),
        child: LoginPage(),
    );
  }
}