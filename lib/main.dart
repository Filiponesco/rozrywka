import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/wrapper.dart';

import 'services/auth.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<String>.value(
      value: Auth().userID, //listen data
      child: MaterialApp(
        home: Wrapper()
      )
    );
  }
}