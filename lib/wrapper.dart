import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/login_page.dart';

import 'Auth.dart';
import 'Pages/main_page.dart';
import 'option.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final userID = Provider.of<String>(context);
    if(userID == null)
      return LoginPage(auth: Auth());
    else {
      return ChangeNotifierProvider<ValueNotifier<Option>>(
        create: (context) => ValueNotifier<Option>(Option.values[0]),
        child: MainPage(),
      );
    }
  }

}