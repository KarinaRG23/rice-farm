import 'package:farm_rice_flutter_web/class/trabajadoresClass.dart';
import 'package:farm_rice_flutter_web/vistas/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:farm_rice_flutter_web/componentes/dataWorkedTable.dart';
class WorkedPage extends StatefulWidget {
  const WorkedPage({Key key}) : super(key: key);

  @override
  State<WorkedPage> createState() => _WorkedPageState();
}

class _WorkedPageState extends State<WorkedPage> {
  Future<List<Trabajador>> _listWorkedTable;
  final Endpoints _endpoints = Endpoints();

  @override
  void initState() {
    super.initState();
    _listWorkedTable = _endpoints.getTrabajador();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trabajadores"),
        backgroundColor: const Color(0xff329437),
      ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/fondo_de_pantalla.jpg'),
                fit: BoxFit.fill),
          ),
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
          child:FutureBuilder(
              future: _listWorkedTable,
              builder: ((context, snapshot) {
                if(snapshot.hasData){
                  return PaginatedDataTable(
                    columns: const [
                      DataColumn(label: Text("Codigo", style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("Cedula", style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("Nombres", style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("Email", style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("Telefono", style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("Direccion", style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("Salario", style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text("Acciones", style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                    source: resourceWorkedData(snapshot.data, context),
                    rowsPerPage: 8,
                    columnSpacing: 80,
                    header: const Text("Lista de trabajadores", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), softWrap: true),
                    sortAscending: false,
                    actions: [
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
                  );
                }
                else if(snapshot.hasError){
                  return const Center(child: Text("Cargando datos de trabajadores, espere por favor o refresque la pagina"));
                }
                return const Center(child: CircularProgressIndicator());
              })
          ),
        )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}