// ignore_for_file: unused_field, prefer_final_fields, use_build_context_synchronously

import 'package:farm_rice_flutter_web/componentes/buttonWidget.dart';
import 'package:farm_rice_flutter_web/componentes/editTextField.dart';
import 'package:farm_rice_flutter_web/componentes/textWidget.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:farm_rice_flutter_web/temporalClass/sharedPreferences.dart';
import 'package:farm_rice_flutter_web/vistas/splashAfterLogin.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;
  String _user = '', _password = '';
  bool loginSucces;
  Endpoints conect = Endpoints();
  Preferences preferences = Preferences();

  final user = TextEditingController();
  final password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/fondo_de_pantalla.jpg'),
              fit: BoxFit.fill
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 25),
              Expanded(
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: 350,
                    height: 200,
                    child: Column(
                      children: [
                        const Expanded(
                            child: Icon(Icons.account_circle, size: 100, color: Color(0xff259128))
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                            child: Column(
                              children: const [
                                Text("Hacienda ''La Esperanza''",
                                  softWrap: true,
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                                Text("Inicio de sesion",
                                  softWrap: true,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                                )
                              ],
                            )
                        ),
                        const SizedBox(height: 5),
                        Expanded(
                          child: Column(
                            children: [
                              EditTextField(
                                textEditingController: user,
                                textInputType: TextInputType.text,
                                icon: const Icon(Icons.person),
                                hintext: "Usuario",
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: password,
                                obscureText: obscureText,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        obscureText =! obscureText;
                                      });
                                    },
                                    child: Icon(obscureText ? Icons.visibility : Icons.visibility_off, size: 30),
                                  ),
                                  hintText: 'Contraseña',
                                  contentPadding: const EdgeInsets.all(24),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white, width: 3), borderRadius: BorderRadius.all(Radius.circular(10))),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Expanded(
                            child: ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: [
                                ButtonWidget(
                                  function: (){
                                    logInUser();
                                  },
                                  circular: 5,
                                  height: 15,
                                  width: 100,
                                  color: const Color(0xff259128),
                                  namebutton: "Ingresar",
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  logInUser() async {
    _user = user.text;
    _password = password.text;
    if(_user.isEmpty){
      showDialog(
          context: context,
          builder: (ctx)=> AlertDialog(
            title: const TextString(text: "ERROR DE INICIO DE SESION"),
            content: const Text("Campo usuario vacio, por favor ingresar su usuario e intente nuevamente",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            actions: [
              ButtonBar(
                children: [
                  ButtonWidget(
                    height: 15,
                    width: 25,
                    circular: 10,
                    color: Colors.redAccent,
                    namebutton: "Cerrar",
                    function: (){
                      Navigator.pop(context);
                    },
                  )
                ],
              )
            ],
          )
      );
    }
    else if(_password.isEmpty){
      showDialog(
          context: context,
          builder: (ctx)=> AlertDialog(
            title: const TextString(text: "ERROR DE INICIO DE SESION"),
            content: const Text("Campo contraseña vacio, por favor ingresar su contraseña e intente nuevamente",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            actions: [
              ButtonBar(
                children: [
                  ButtonWidget(
                    height: 15,
                    width: 25,
                    circular: 10,
                    color: Colors.redAccent,
                    namebutton: "Cerrar",
                    function: (){
                      Navigator.pop(context);
                    },
                  )
                ],
              )
            ],
          )
      );
    }
    else if(_user.isEmpty && _password.isEmpty){
      showDialog(
          context: context,
          builder: (ctx)=> AlertDialog(
            title: const TextString(text: "ERROR DE INICIO DE SESION"),
            content: const Text("Campo vacios, por favor ingresar sus datos e intente nuevamente",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
            actions: [
              ButtonBar(
                children: [
                  ButtonWidget(
                    height: 15,
                    width: 25,
                    circular: 10,
                    color: Colors.redAccent,
                    namebutton: "Cerrar",
                    function: (){
                      Navigator.pop(context);
                    },
                  )
                ],
              )
            ],
          )
      );
    }
    else{
      preferences.setEmail(_user);
      preferences.setPassword(_password);
      loginSucces = await conect.logIn(_user, _password);
      if(loginSucces == true){
        Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const SplashPage()));
      }
      else if(loginSucces == false){
        showDialog(
            context: context,
            builder: (ctx)=> AlertDialog(
              title: const TextString(text: "USUARIO NO ENCONTRADO"),
              content: const Text("Si no tiene cuenta solicite al administrador una cuenta e intente nuevamente",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              actions: [
                ButtonBar(
                  children: [
                    ButtonWidget(
                      height: 15,
                      width: 25,
                      circular: 10,
                      color: Colors.redAccent,
                      namebutton: "Cerrar",
                      function: (){
                        Navigator.pop(context);
                      },
                    )
                  ],
                )
              ],
            )
        );
      }
    }
  }
}
