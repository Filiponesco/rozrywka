import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/pages/home/home_page.dart';
import 'package:rozrywka/pages/login_page.dart';

import 'services/auth.dart';
import 'menu/option.dart';

class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final userID = Provider.of<String>(context);
    if(userID == null)
      return LoginPage(auth: Auth());
    else {
      return ChangeNotifierProvider<ValueNotifier<Option>>(
        create: (context) => ValueNotifier<Option>(Option.values[0]),
        child: HomePage(),
      );
    }
  }

}