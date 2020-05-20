import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rozrywka/models/item_card.dart';
import 'package:rozrywka/widgets/item_tile.dart';

class ItemList extends StatefulWidget {
  final List<ItemCard> items;
final bool isDoneTab;
  ItemList({
    @required this.items,
    @required this.isDoneTab
  });

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) =>
            ItemTile(widget.items[index], widget.isDoneTab));
  }
}
