import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth.dart';
import 'option.dart';

class NavDrawer extends StatelessWidget {
  final Map<Option, OptionData> options = optionsData; //dependency!
  String email;
  NavDrawer(){
    _fetchUser();
  }
  @override
  Widget build(BuildContext context) {
    final userID= Provider.of<String>(context, listen: false);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text(email ?? ''),
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

  List<Widget> _buildOptions(BuildContext context) {
    return options.keys.map((option) => _buildTile(context, option)).toList();
  }

  Widget _buildTile(BuildContext context, Option option) {
    var currentPage = Provider.of<ValueNotifier<Option>>(context);
    final data = options[option];

    void _logout(){
      Auth().signOut();
    }

    return ListTile(
      leading: Icon(data.iconData),
      title: Text(data.title),
      trailing: currentPage.value == option ? Icon(Icons.check) : null,
      onTap: () {
        Navigator.of(context).pop();
        //change page
        currentPage.value = option;
        if(option == Option.logout){
          _logout();
        }
      },
    );
  }
  Future _fetchUser() async{
      email = await Auth().userEmail;
  }
}
