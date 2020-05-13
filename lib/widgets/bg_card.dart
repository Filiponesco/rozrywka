import 'package:flutter/material.dart';
class BgCard extends StatelessWidget {
  final bool isDoneTab;
  BgCard(this.isDoneTab);

  @override
  Widget build(BuildContext context) {
    if (isDoneTab) {
        return Padding(
            padding: EdgeInsets.only(right: 15),
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.cancel,
                color: Colors.yellow,
              ),
            ));
      } else {
        return Padding(
            padding: EdgeInsets.only(left: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.done,
                color: Colors.green,
              ),
            ));
      }
    }
}
