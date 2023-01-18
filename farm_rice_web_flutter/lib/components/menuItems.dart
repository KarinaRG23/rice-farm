// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MenuItemOption extends StatelessWidget{
  String itemText;
  IconData itemIcon;
  int selected;
  int position;

  MenuItemOption({
    Key key,
    this.itemText,
    this.itemIcon,
    this.selected,
    this.position
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selected == position ? const Color(0xff155215) : const Color(0xff259128),
      child: Row(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(10),
              child: Icon(itemIcon)
          ),
          Container(
              padding: const EdgeInsets.all(10),
              child: Text(itemText, style: const TextStyle(fontSize: 20))
          ),
        ],
      ),
    );
  }
}