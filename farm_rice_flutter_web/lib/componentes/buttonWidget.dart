// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget{
  final VoidCallback? function;
  final Color color;
  final double width;
  final double height;
  final double circular;
  final String namebutton;

  const ButtonWidget({
    Key? key,
    this.function,
    required this.color,
    required this.width,
    required this.height,
    required this.circular,
    required this.namebutton
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(circular)),
          padding: EdgeInsets.symmetric(vertical: height, horizontal: width)),
      onPressed: function,
      child: Text(namebutton, softWrap: true, style: const TextStyle(fontSize: 20), textAlign: TextAlign.center),
    );
  }
}