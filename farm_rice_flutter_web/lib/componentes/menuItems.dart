import 'package:flutter/material.dart';

class MenuItemOption extends StatelessWidget{
  final String itemText;
  final IconData itemIcon;
  final int selected;
  final int position;

  const MenuItemOption({Key? key,
    required this.itemText,
    required this.itemIcon,
    required this.selected,
    required this.position
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selected == position ? const Color(0xff155215) : const Color(0xff259128),
      child: Row(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.all(15),
              child: Icon(itemIcon)
          ),
          Container(
              padding: const EdgeInsets.all(15),
              child: Text(itemText, style: const TextStyle(fontSize: 20))
          ),
        ],
      ),
    );
  }
}