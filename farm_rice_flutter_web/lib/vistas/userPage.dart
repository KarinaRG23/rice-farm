// ignore_for_file: file_names

import 'package:farm_rice_flutter_web/class/classUserTable.dart';
import 'package:farm_rice_flutter_web/componentes/dataTable.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late final Future<List<UserTable>?> _listTable;
  Endpoints endpoints = Endpoints();

  @override
  void initState() {
    super.initState();
    _listTable = endpoints.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuarios"),
        backgroundColor: const Color(0xff329437),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder<List<UserTable>?>(
          future: _listTable,
          builder: ((context, snapshot) {
            if(snapshot.hasData){
              return PaginatedDataTable(
                columns: const [
                  DataColumn(label: Text("Cedula")),
                  DataColumn(label: Text("Nombres")),
                  DataColumn(label: Text("Apellidos")),
                  DataColumn(label: Text("Telf")),
                  DataColumn(label: Text("Email")),
                  DataColumn(label: Text("Lugar")),
                  DataColumn(label: Text("Direccion")),
                  DataColumn(label: Text("Rol")),
                  DataColumn(label: Text("Estado")),
                ], 
                source: resourceData(snapshot.data??[]),
                );
            }
            else if(snapshot.hasError){
              return const Center(child: CircularProgressIndicator());
            }          
            return const Center(child: CircularProgressIndicator());
          })
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}