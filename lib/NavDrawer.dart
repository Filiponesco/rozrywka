import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'DrawerStateInfo.dart';
import 'Option.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer(this.options, this.currentPage, this.onSelected);
  final Map<Option, OptionData> options;
  final Option currentPage;
  final Function(Option) onSelected;
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
      //trailing: currentPage == option ? Icon(Icons.check) : null,
      onTap: () {
        Navigator.of(context).pop();
        onSelected(option);
      },
    );
  }
}