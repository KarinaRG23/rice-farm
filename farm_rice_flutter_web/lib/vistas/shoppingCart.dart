import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget{
  const ShoppingCart({Key key}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Venta de produccion"),
        backgroundColor: const Color(0xff329437),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/fondo_de_pantalla.jpg'),
              fit: BoxFit.fill),
        ),
        child: Center(
            child: Container()
        ),
      ),
    );
  }

}