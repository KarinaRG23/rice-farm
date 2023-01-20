// ignore_for_file: file_names, avoid_print, use_build_context_synchronously
import 'dart:collection';

import 'package:farm_rice_flutter_web/class/classUserTable.dart';
import 'package:farm_rice_flutter_web/componentes/dataUserTable.dart';
import 'package:farm_rice_flutter_web/componentes/editTextField.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

import '../vistas/dashboard.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Future<List<UserTable>> _lisTableUser;
  final Endpoints _endpoints = Endpoints();
  bool registerUser = false;

  String rolSelectItem;
  List<String> listRolItem = ["Cliente", "Supervisor", "Vendedor", "Recursos Humanos"];

  final _cedula = TextEditingController();
  final _telefono = TextEditingController();
  final _nombres = TextEditingController();
  final _apellidos = TextEditingController();
  final _correo = TextEditingController();
  final _nombreFiscal = TextEditingController();
  final _direccion = TextEditingController();
  final _password = TextEditingController();
  final _estado = TextEditingController();

  bool _obscureText = true;

  List itemRolOpen = ["Supervisor", "Cliente", "Vendedor", "Recursos humanos"];
  Map mapRole = {"Supervisor":1, "Cliente":2, "Vendedor":3, "Recursos Humanos":2};

  @override
  void initState() {
    _lisTableUser = _endpoints.getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Usuarios"),
          backgroundColor: const Color(0xff329437),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/fondo_de_pantalla.jpg'),
                fit: BoxFit.fill),
          ),
          child: FutureBuilder(
            future: _lisTableUser,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return PaginatedDataTable(
                  columns: const<DataColumn>[
                    DataColumn(label: Text('Id', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Cedula', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Nombres', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Apellidos', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Telefono', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('E-mail', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Nombre fiscal', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Direccion fiscal', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Rol', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Estado', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Opciones de usuario', softWrap: true, style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  source: resouceDataUser(snapshot.data, context),
                  rowsPerPage: 8,
                  columnSpacing: 25,
                  header: const Text("Lista de usuarios", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), softWrap: true),
                  sortAscending: false,
                  actions: [
                    ElevatedButton.icon(
                        onPressed: (){
                          showDialog(
                              context: context,
                              builder: (context)=> AlertDialog(
                                title: const Text("REGISTRO DE NUEVO USUARIO"),
                                titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                contentPadding: const EdgeInsets.all(5),
                                content:StatefulBuilder(
                                  builder: (BuildContext context, StateSetter setState){
                                    return SizedBox(
                                      height: 350,
                                      width: 600,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: EditTextField(
                                                  icon: const Icon(Icons.credit_card),
                                                  textInputType: TextInputType.number,
                                                  formatter:[
                                                    FilteringTextInputFormatter.digitsOnly,
                                                    LengthLimitingTextInputFormatter(10)
                                                  ],
                                                  textEditingController: _cedula,
                                                  hintext: 'Cedula',
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Expanded(
                                                child: EditTextField(
                                                  hintext: "Telefono",
                                                  formatter:[
                                                    LengthLimitingTextInputFormatter(10)
                                                  ],
                                                  icon: const Icon(Icons.phone),
                                                  textInputType: TextInputType.text,
                                                  textEditingController: _telefono,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: EditTextField(
                                                  icon: const Icon(Icons.person),
                                                  textInputType: TextInputType.text,
                                                  textEditingController: _nombres,
                                                  hintext: 'Nombres',
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Expanded(
                                                child: EditTextField(
                                                  hintext: "Apellidos",
                                                  icon: const Icon(Icons.person),
                                                  textInputType: TextInputType.text,
                                                  textEditingController: _apellidos,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: EditTextField(
                                                    textEditingController: _correo,
                                                    textInputType: TextInputType.emailAddress,
                                                    icon: const Icon(Icons.email),
                                                    hintext: "Correo"
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Expanded(
                                                child: TextField(
                                                  controller: _password,
                                                  obscureText: _obscureText,
                                                  keyboardType: TextInputType.visiblePassword,
                                                  decoration: InputDecoration(
                                                    prefixIcon: const Icon(Icons.lock),
                                                    suffixIcon: GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          _obscureText = !_obscureText;
                                                        });
                                                      },
                                                      child: Icon(
                                                          _obscureText
                                                              ? Icons.visibility
                                                              : Icons.visibility_off,
                                                          size: 30),
                                                    ),
                                                    hintText: 'Contraseña',
                                                    contentPadding: const EdgeInsets.all(24),
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    border: const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.white, width: 3),
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(10))),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: EditTextField(
                                                  icon: const Icon(Icons.location_city),
                                                  textInputType: TextInputType.text,
                                                  textEditingController: _nombreFiscal,
                                                  hintext: 'Nombre fiscal',
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Expanded(
                                                child: EditTextField(
                                                  hintext: "Direccion fiscal",
                                                  icon: const Icon(Icons.location_city),
                                                  textInputType: TextInputType.text,
                                                  textEditingController: _direccion,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey, width: 2),
                                                borderRadius: BorderRadius.circular(5)),
                                            child: DropdownButton(
                                              hint: const Text("Seleccione el rol"),
                                              icon: const Icon(Icons.arrow_drop_down),
                                              iconSize: 35,
                                              isExpanded: true,
                                              isDense: true,
                                              underline: Container(),
                                              value: rolSelectItem,
                                              style: const TextStyle(fontSize: 20, color: Colors.grey),
                                              onChanged: (value) {
                                                setState(() {
                                                  rolSelectItem = value;
                                                });
                                              },
                                              alignment: AlignmentDirectional.centerStart,
                                              items: listRolItem.map((valueItem) {
                                                return DropdownMenuItem(value: valueItem, child: Text(valueItem));
                                              }).toList(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                ),
                                actions: [
                                  ButtonBar(
                                    alignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton.icon(
                                          onPressed: (){
                                            _registerUser();
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                                              backgroundColor: const Color(0xff329437)
                                          ),
                                          icon: const Icon(Icons.save),
                                          label: const Text("Agregar usuario", softWrap: true,)
                                      ),
                                      const SizedBox(width: 5),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const Dashboard()));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: const CircleBorder(), backgroundColor: const Color(
                                              0xFF1869C0),
                                              alignment: Alignment.center),
                                          child: const Icon(Icons.change_circle_rounded)),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.015),
                                    ],
                                  )
                                ],
                              )
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                            backgroundColor: const Color(0xff329437)
                        ),
                        icon: const Icon(Icons.person_add, size: 30 ),
                        label: const Text("Agregar nuevo usuario")
                    ),
                    const SizedBox(width: 2),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const UserPage()));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(), backgroundColor: const Color(
                            0xFF1869C0),
                            alignment: Alignment.center),
                        child: const Icon(Icons.change_circle_rounded)),
                    SizedBox(width: MediaQuery.of(context).size.width*0.015),
                  ],
                );
              } else if(snapshot.hasError){
                return const Center(child: Text("Error en la carga de los datos, espera un momento o reinicia la pagina..."));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  _registerUser()async{
    String dni, nombres, apellidos, password, correo, telefono, direccion, nombreF, role;
    int roler;

    dni = _cedula.text;
    nombres = _nombres.text;
    apellidos = _apellidos.text;
    correo = _correo.text;
    telefono = _telefono.text;
    password = _password.text;
    direccion = _direccion.text;
    nombreF = _nombreFiscal.text;
    role = rolSelectItem;

    if(dni.isEmpty && nombres.isEmpty && apellidos.isEmpty &&
        correo.isEmpty && telefono.isEmpty && direccion.isEmpty && nombreF.isEmpty &&
        password.isEmpty  ){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No pueden existir campos vacios en el registro, intente nuevamente"),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 30),
      ));
    }else{
      roler = mapRole[role];
      print(roler);
      registerUser = await _endpoints.setUserData(dni, nombres, password,apellidos, telefono, correo, nombreF, direccion, roler);
      if(registerUser == true){
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Registro exitoso"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 30),
        ));
      }else if(registerUser == false){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Fallo del servidor al registrar"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 30),
        ));
      }
    }

  }
}