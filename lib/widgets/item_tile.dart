import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rozrywka/models/book.dart';
import 'package:rozrywka/models/game.dart';
import 'package:rozrywka/models/item_card.dart';
import 'package:rozrywka/models/movie.dart';
import 'package:rozrywka/models/series.dart';
import 'package:rozrywka/pages/item_info.dart';
import 'package:rozrywka/services/database.dart';
import 'package:rozrywka/widgets/bg_card.dart';

class ItemTile extends StatelessWidget {
  final ItemCard _item;
  final bool _isDoneTab;

  ItemTile(this._item, this._isDoneTab) {
    print('ItemTile: constructor, item: ${_item.toJson()}');
  }

  void _deleteCard(String userID) {
    DatabaseService(uid: userID).deleteItem(_item);
  }

  void _moveCardToOtherTab(String userID) {
    DatabaseService(uid: userID).updateItemDone(_item, !_isDoneTab);
  }

  void _clickOnCard(context, userID) {
    print('ItemTile: _clickOnCard');
    // so sad that i have to again make this providers
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (newContext) =>
                ItemInfo(_item)
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    final userID = Provider.of<String>(context, listen: false);
    return Dismissible(
      key: Key(_item.hashCode.toString()),
      direction: _isDoneTab
          ? DismissDirection.endToStart
          : DismissDirection.startToEnd,
      background: BgCard(_isDoneTab),
      onDismissed: (_) => _moveCardToOtherTab(userID),
      child: Card(
          child: ListTile(
              onTap: () => _clickOnCard(context, userID),
              leading: Icon(
                _item.icon,
                size: 50.0,
              ),
              title: Text(_item.cardTitle),
              subtitle: Text("${_item.cardDescription}"),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _deleteCard(userID),
              ))),
    );
  }
}
