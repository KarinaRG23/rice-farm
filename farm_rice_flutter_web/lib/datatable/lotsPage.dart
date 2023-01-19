
import 'package:flutter/material.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:farm_rice_flutter_web/class/classLotTable.dart';
class LotsPage extends StatefulWidget {
  const LotsPage({Key key}) : super(key: key);

  @override
  State<LotsPage> createState() => _LotsPageState();
}

class _LotsPageState extends State<LotsPage> {
  Future<List<LotTable>> _listLotTable;
  Endpoints endpoints = Endpoints();
  List itemNumLot = ['1','2','3','4','5'];
  List itemEstadoLot = ['Producción','Sin Producción'];

  @override
  void initState() {
    super.initState();
    //_listLotTable = endpoints.getLotData();
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
                  child: FutureBuilder<List<LotTable>>(
                      future: _listLotTable,
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
                            //source: resourceLotData(snapshot.data??[]),
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
                          scrollable: true,
                          title: const Text("REGISTRAR LOTE",
                              textAlign: TextAlign.center, style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)),
                          content: SizedBox(
                            height: 480,
                            width: 375,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.description),
                                    hintText: 'Nombre del lote',
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
                                    prefixIcon: Icon(Icons.location_on_rounded),
                                    hintText: 'Area',
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
                                    prefixIcon: Icon(Icons.fact_check_sharp),
                                    hintText: 'Etapa',
                                    contentPadding: EdgeInsets.all(24),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black, width: 3), borderRadius: BorderRadius.all(Radius.circular(10))),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                DropdownButton(
                                  hint: const Text("Seleccione el numero del lote: "),
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 35,
                                  isExpanded: true,
                                  underline: Container(),
                                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                                  onChanged: (value){
                                    setState((){
                                    });
                                  },
                                  items: itemNumLot.map((valueItem){
                                    return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem)
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(height: 15),
                                DropdownButton(
                                  hint: const Text("Seleccione el Estado: "),
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 35,
                                  isExpanded: true,
                                  underline: Container(),
                                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                                  onChanged: (value){
                                    setState((){
                                    });
                                  },
                                  items: itemEstadoLot.map((valueItem){
                                    return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem)
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(height: 15),
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
                        'AÑADIR LOTE',
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