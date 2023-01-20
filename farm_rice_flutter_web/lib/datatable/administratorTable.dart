import 'package:farm_rice_flutter_web/class/administratorClass.dart';
import 'package:farm_rice_flutter_web/componentes/dataAdministratorTable.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:flutter/material.dart';

class AdministradorPage extends StatefulWidget{
  const AdministradorPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AdministradorPageState();
}

class _AdministradorPageState extends State<AdministradorPage>{

  Future<List<Administrador>> _listAdministrador;
  final Endpoints _endpoints = Endpoints();

  @override
  void initState() {
    _listAdministrador = _endpoints.getAdministrador();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Administradores"),
        backgroundColor: const Color(0xff329437),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/fondo_de_pantalla.jpg'),
              fit: BoxFit.fill),
        ),
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        child: FutureBuilder(
          future: _listAdministrador,
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
                ],
                source: resouceDataAdmin(snapshot.data),
                rowsPerPage: 8,
                columnSpacing: 50,
                header: const Text("Administradores", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), softWrap: true),
                sortAscending: false,
              );
            } else if(snapshot.hasError){
              return const Center(child: Text("Error en la carga de los datos, espera un momento o reinicia la pagina..."));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}