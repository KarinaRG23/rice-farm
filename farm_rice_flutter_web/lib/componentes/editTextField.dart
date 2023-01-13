import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget{
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final Icon icon;
  final String hintext;
  final bool? obscureText;

  const EditTextField({
    Key? key,
    required this.textEditingController,
    required this.textInputType,
    required this.icon,
    required this.hintext,
    this.obscureText
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      obscureText: obscureText != null,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: icon,
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