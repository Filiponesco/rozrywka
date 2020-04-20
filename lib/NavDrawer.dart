import 'package:flutter/material.dart';
import 'package:rozrywka/Pages/SeriesPage.dart';

import 'Option.dart';
import 'Pages/BooksPage.dart';
import 'Pages/GamesPage.dart';
import 'Pages/MoviesPage.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer(this.options, this.currentPage);
  final Map<Option, OptionData> options;
  final Option currentPage;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Rozrywka',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/nav.jpg'))),
          ),
          ..._buildOptions(context),
        ],
      ),
    );
  }
  List<Widget> _buildOptions(BuildContext context){
    return options.keys.map((option) => _buildTile(context, option)).toList();
  }
  Widget _buildTile(BuildContext context, Option option){
    final data = options[option];
    return ListTile(
      leading: Icon(data.iconData),
      title: Text(data.title),
      trailing: currentPage == option ? Icon(Icons.check) : null,
      onTap: () {
        Navigator.of(context).pop();
        switch(option){
          case Option.film:
            _changeRoute(context, MoviesPage());
            break;
          case Option.series:
            _changeRoute(context, SeriesPage());
            break;
          case Option.book:
            _changeRoute(context, BooksPage());
            break;
          case Option.game:
            _changeRoute(context, GamesPage());
            break;
          case Option.logout:
            // TODO: Handle this case.
            break;
        }
      },
    );
  }
  void _changeRoute(BuildContext context, page){
    Route route = MaterialPageRoute(builder: (context) => page);
    Navigator.pushReplacement(context, route);
  }
}