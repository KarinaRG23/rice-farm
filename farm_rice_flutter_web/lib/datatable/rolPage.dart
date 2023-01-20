// ignore_for_file: unrelated_type_equality_checks
import 'package:farm_rice_flutter_web/class/rolClass.dart';
import 'package:farm_rice_flutter_web/componentes/dataRolTable.dart';
import 'package:farm_rice_flutter_web/componentes/editTextField.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:farm_rice_flutter_web/vistas/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RolPage extends StatefulWidget{
  const RolPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RolPageState();
}

class _RolPageState extends State<RolPage>{
  Future<List<Rol>> _listRolUser;
  final Endpoints _endpoints = Endpoints();


  @override
  void initState() {
    _listRolUser = _endpoints.getRolUser();
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
          future: _listRolUser,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return Card(
                  child: PaginatedDataTable(
                    columns: const<DataColumn>[
                        DataColumn(label: Center(child: Text('Id', style: TextStyle(fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('Nombre de rol', style: TextStyle(fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('Descripcion', style: TextStyle(fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('Estado', style: TextStyle(fontWeight: FontWeight.bold)))),
                        DataColumn(label: Center(child: Text('Acciones', softWrap: true, style: TextStyle(fontWeight: FontWeight.bold)))),
                      ],
                    source: resouceDataRol(snapshot.data, context),
                    rowsPerPage: 8,
                    columnSpacing: 170,
                    header: const Text("Roles de usuario", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), softWrap: true),
                    sortAscending: false,
                    actions: [
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
                  ),
                );
              }else if(snapshot.hasError){
                return const Center(child: Text("Datos cargando, por favor espere o reinicie la pagina"));
              }
              return const Center(child: CircularProgressIndicator());
            }
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}