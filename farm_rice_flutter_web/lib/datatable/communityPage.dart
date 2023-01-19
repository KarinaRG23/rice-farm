import 'package:farm_rice_flutter_web/class/laborsClass.dart';
import 'package:farm_rice_flutter_web/componentes/dataLaborsTable.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {

  Future<List<Labores>> _listLabores;
  final Endpoints _endpoints = Endpoints();

  @override
  void initState() {
    _listLabores = _endpoints.getLabores();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Labores"),
        backgroundColor: const Color(0xff329437),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        child: FutureBuilder(
            future: _listLabores,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return PaginatedDataTable(
                  columns: const<DataColumn>[
                    DataColumn(label: Center(child: Text('Codigo', style: TextStyle(fontWeight: FontWeight.bold)))),
                    DataColumn(label: Center(child: Text('Nombre', style: TextStyle(fontWeight: FontWeight.bold)))),
                    DataColumn(label: Center(child: Text('Descripcion', style: TextStyle(fontWeight: FontWeight.bold)))),
                    DataColumn(label: Center(child: Text('Acciones', softWrap: true, style: TextStyle(fontWeight: FontWeight.bold)))),
                  ],
                  source: resouceDataLab(snapshot.data),
                  rowsPerPage: 8,
                  columnSpacing: 250,
                  header: const Text("Labores", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), softWrap: true),
                  sortAscending: false,
                  actions: [
                    ElevatedButton.icon(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                            backgroundColor: const Color(0xff329437)
                        ),
                        icon: const Icon(Icons.group_add, size: 30 ),
                        label: const Text("")
                    ),
                    const SizedBox(width: 5),
                  ],
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