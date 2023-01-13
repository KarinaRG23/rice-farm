import 'package:flutter/material.dart';

class TextString extends StatelessWidget{

  final String text;

  const TextString({Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        softWrap: true
    );
  }
}