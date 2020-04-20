import 'package:flutter/cupertino.dart';

import 'Option.dart';

class DrawerStateInfo with ChangeNotifier{
  Option _currentPage = Option.film;
  Option get getCurrentPage => _currentPage;

  void setCurrentPage(Option page) {
    _currentPage = page;
    notifyListeners();
  }
}