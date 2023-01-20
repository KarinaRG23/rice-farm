import 'package:farm_rice_flutter_web/class/insumosClass.dart';
import 'package:farm_rice_flutter_web/componentes/dataInsumsTable.dart';
import 'package:flutter/material.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';

class InsumosPage extends StatefulWidget {
  const InsumosPage({Key key}) : super(key: key);

  @override
  State<InsumosPage> createState() => _InsumosPageState();
}

class _InsumosPageState extends State<InsumosPage> {
  Future<List<Insumos>> _listInsumosTable;
  final Endpoints _endpoints = Endpoints();


  @override
  void initState() {
    _listInsumosTable = _endpoints.getInsumos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Insumos"),
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
            future: _listInsumosTable,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return PaginatedDataTable(
                  columns: const<DataColumn>[
                    DataColumn(label: Text("Código", style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Nombre", style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Descripción", style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Costo", style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Registro", style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Acciones", style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  source: resouceDataIns(snapshot.data),
                  rowsPerPage: 8,
                  columnSpacing: 150,
                  header: const Text("Insumos", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), softWrap: true),
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
                                height: 400,
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
                                    ButtonBar(
                                      alignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton.icon(
                                            onPressed: (){},
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                              backgroundColor: const Color(0xff329437)
                                            ),
                                            icon: const Icon(Icons.save),
                                            label: const Text("Guardar"))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                            backgroundColor: const Color(0xff329437)
                        ),
                        icon: const Icon(Icons.paste_rounded, size: 30 ),
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