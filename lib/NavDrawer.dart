import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
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
          ListTile(
            leading: Icon(Icons.movie),
            title: Text('Filmy'),
            onTap: () {Navigator.of(context).pop();},
          ),
          ListTile(
            leading: Icon(Icons.local_movies),
            title: Text('Seriale'),
            onTap: () {
              Navigator.of(context).pop();

            },
          ),
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text('Książki'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.videogame_asset),
            title: Text('Gry'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Wyloguj'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}