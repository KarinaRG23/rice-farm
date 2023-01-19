// ignore_for_file: file_names
import 'package:farm_rice_flutter_web/class/classUserTable.dart';
import 'package:farm_rice_flutter_web/componentes/dataUserTable.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Future<List<UserTable>> _lisTableUser;
  final Endpoints _endpoints = Endpoints();
  List itemRolOpen = ['Administrador', 'Trabajador', 'Usuario'];
  List itemEstadoOpen = ['Activo', 'Inactivo'];

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
                  source: resouceDataUser(snapshot.data),
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
                                content:SizedBox(
                                  height: 300,
                                  width: 600,
                                  child: Column(
                                    children: [],
                                  ),
                                ),
                                actions: [
                                  ButtonBar(
                                    alignment: MainAxisAlignment.end,
                                    children: [],
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
                        label: const Text("")
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton.icon(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                            backgroundColor: Colors.red
                        ),
                        icon: const Icon(Icons.picture_as_pdf, size: 30),
                        label: const Text("")
                    ),
                    const SizedBox(width: 15),
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
}