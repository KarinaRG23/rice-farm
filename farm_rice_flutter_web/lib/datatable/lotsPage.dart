
import 'package:farm_rice_flutter_web/componentes/dataLoteTable.dart';
import 'package:flutter/material.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:farm_rice_flutter_web/class/classLotTable.dart';
class LotsPage extends StatefulWidget {
  const LotsPage({Key key}) : super(key: key);

  @override
  State<LotsPage> createState() => _LotsPageState();
}

class _LotsPageState extends State<LotsPage> {
  Future<List<LoteTable>> _listLotTable;
  final Endpoints endpoints = Endpoints();

  @override
  void initState() {
    super.initState();
    _listLotTable = endpoints.getLotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lotes"),
        backgroundColor: const Color(0xff329437),
      ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*0.03,
                right: 15, left: 15, bottom: 40),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  child: FutureBuilder(
                      future: _listLotTable,
                      builder: ((context, snapshot) {
                        if(snapshot.hasData){
                          return PaginatedDataTable(
                            columns: const [
                              DataColumn(label: Text("Codigo", style: TextStyle(fontWeight: FontWeight.bold))),
                              DataColumn(label: Text("Nombre", style: TextStyle(fontWeight: FontWeight.bold))),
                              DataColumn(label: Text("Lote", style: TextStyle(fontWeight: FontWeight.bold))),
                              DataColumn(label: Text("Area", style: TextStyle(fontWeight: FontWeight.bold))),
                              DataColumn(label: Text("Acciones", style: TextStyle(fontWeight: FontWeight.bold))),
                            ],
                            source: resouceDataLote(snapshot.data),
                            rowsPerPage: 8,
                            columnSpacing: 150,
                            header: const Text("Lotes", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), softWrap: true),
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
                        }
                        else if(snapshot.hasError){
                          return const Center(child: Text("Datos cargando, espere en la pagina o refresque la misma"));
                        }
                        return const Center(child: CircularProgressIndicator());
                      })
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}