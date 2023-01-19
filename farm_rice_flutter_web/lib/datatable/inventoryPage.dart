import 'package:farm_rice_flutter_web/componentes/dataInventoryTable.dart';
import 'package:flutter/material.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:farm_rice_flutter_web/class/classInventoryTable.dart';
class InventoryPage extends StatefulWidget {
  const InventoryPage({Key key}) : super(key: key);

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  Future<List<InventoryTable>> _listInventoryTable;
  final Endpoints endpoints = Endpoints();


  @override
  void initState() {
    _listInventoryTable = endpoints.getInventoryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventario"),
        backgroundColor: const Color(0xff329437),
      ),
        body: Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
          child: FutureBuilder(
            future: _listInventoryTable,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return PaginatedDataTable(
                  columns: const<DataColumn>[
                    DataColumn(label: Text("Código")),
                    DataColumn(label: Text("Nombre")),
                    DataColumn(label: Text("Descripción")),
                    DataColumn(label: Text("Portada")),
                    DataColumn(label: Text("Fch-Registro")),
                    DataColumn(label: Text("ruta")),
                    DataColumn(label: Text('Estado', softWrap: true)),
                    DataColumn(label: Text('Acciones', softWrap: true)),
                  ],
                  source: resouceDataInv(snapshot.data),
                  rowsPerPage: 8,
                  columnSpacing: 40,
                  header: const Text("Lista de Insumos", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), softWrap: true),
                  sortAscending: false,
                  actions: [
                    ElevatedButton.icon(
                        onPressed: (){
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              title: const Text("REGISTRAR INSUMO",
                                  textAlign: TextAlign.center, style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)),
                              content: SizedBox(
                                height: 480,
                                width: 375,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const TextField(
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.paste_rounded),
                                        hintText: 'Nombre Insumo',
                                        contentPadding: EdgeInsets.all(24),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black, width: 3), borderRadius: BorderRadius.all(Radius.circular(10))),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    const TextField(
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.paste_rounded),
                                        hintText: 'Descripción',
                                        contentPadding: EdgeInsets.all(24),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black, width: 3), borderRadius: BorderRadius.all(Radius.circular(10))),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    const TextField(
                                      keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.access_time_filled_rounded),
                                        hintText: 'Fecha de registro',
                                        contentPadding: EdgeInsets.all(24),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black, width: 3), borderRadius: BorderRadius.all(Radius.circular(10))),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    const TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.monetization_on_rounded),
                                        hintText: 'Costo',
                                        contentPadding: EdgeInsets.all(24),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black, width: 3), borderRadius: BorderRadius.all(Radius.circular(10))),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10, top: 30),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("GUARDAR", style: TextStyle(fontSize: 33, fontWeight: FontWeight.w700, color: Colors.green)),
                                          ElevatedButton.icon(
                                            onPressed: (){},
                                            icon: const Icon(Icons.save_rounded, size: 50),
                                            label:const Text(""),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green,
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                                                padding: const EdgeInsets.all(8)
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5)
                        ),
                        icon: const Icon(Icons.paste_rounded, size: 30 ),
                        label: const Text("")
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton.icon(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5)
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