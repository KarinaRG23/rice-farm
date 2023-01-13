// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget{

  final String hintext;
  final TextEditingController controller;
  final GestureDetector gestureDetector;
  final bool obscureText;
  StateSetter setState;

  PasswordTextField({
    Key key,
    this.controller,
    this.hintext,
    this.gestureDetector,
    this.obscureText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText != null,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: gestureDetector,
        hintText: hintext,
        contentPadding: const EdgeInsets.all(24),
        fillColor: Colors.white,
        filled: true,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3), borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}