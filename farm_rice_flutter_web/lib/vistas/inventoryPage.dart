import 'package:flutter/material.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:farm_rice_flutter_web/componentes/dataInventoryTable.dart';
import 'package:farm_rice_flutter_web/class/classInventoryTable.dart';
class InventoryPage extends StatefulWidget {
  const InventoryPage({Key? key}) : super(key: key);

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  late Future<List<InventoryTable>?> _listInventoryTable;
  Endpoints endpoints = Endpoints();

  @override
  void initState() {
    super.initState();
    _listInventoryTable = endpoints.getInventoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventario"),
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
                  child: FutureBuilder<List<InventoryTable>?>(
                      future: _listInventoryTable,
                      builder: ((context, snapshot) {
                        if(snapshot.hasData){
                          return PaginatedDataTable(
                            columns: const [
                              DataColumn(label: Text("Codigo")),
                              DataColumn(label: Text("Nombre")),
                              DataColumn(label: Text("Descripción")),
                              DataColumn(label: Text("costo")),
                              DataColumn(label: Text("Fch-Registro")),
                              DataColumn(label: Text("Estado")),
                            ],
                            source: resourceInventoryData(snapshot.data??[]),
                          );
                        }
                        else if(snapshot.hasError){
                          return const Center(child: CircularProgressIndicator());
                        }
                        return const Center(child: CircularProgressIndicator());
                      })
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
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
                                                primary: Colors.green,
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
                          );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        primary: Colors.green),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                      child: const Text(
                        'AÑADIR INSUMO',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight:
                            FontWeight.bold,
                            color: Colors.white),
                      ),
                    ))
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