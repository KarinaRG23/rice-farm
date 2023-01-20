// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:farm_rice_flutter_web/class/insumosClass.dart';
import 'package:farm_rice_flutter_web/componentes/dataInsumsTable.dart';
import 'package:flutter/material.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:intl/intl.dart';

class InsumosPage extends StatefulWidget {
  const InsumosPage({Key key}) : super(key: key);

  @override
  State<InsumosPage> createState() => _InsumosPageState();
}

class _InsumosPageState extends State<InsumosPage> {
  Future<List<Insumos>> _listInsumosTable;
  final Endpoints _endpoints = Endpoints();

  final _date = TextEditingController();
  final _name = TextEditingController();
  final _descripcion = TextEditingController();
  final _costo = TextEditingController();

  bool _register = false;

  DateTime _selectedDate;


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
                  source: resouceDataIns(snapshot.data, context),
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
                                height: 375,
                                width: 375,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextField(
                                      controller: _name,
                                      keyboardType: TextInputType.name,
                                      decoration: const InputDecoration(
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
                                    TextField(
                                      controller: _descripcion,
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
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
                                    TextField(
                                      controller: _date,
                                      onTap: () async {
                                        DateTime pickedDate = await showDatePicker(
                                            context: context, initialDate: DateTime.now(),
                                            firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                            lastDate: DateTime(2101)
                                        );

                                        if(pickedDate != null ){
                                          print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                          String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(pickedDate);
                                          setState(() {
                                            _date.text = formattedDate;
                                          });
                                        }else{
                                          print("Date is not selected");
                                        }
                                      },
                                      keyboardType: TextInputType.datetime,
                                      decoration: const InputDecoration(
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
                                    TextField(
                                      controller: _costo,
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
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
                                            onPressed: (){
                                              _insumosRegisterUser();
                                            },
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

  _insumosRegisterUser()async{
    String nombres, fecha, costo, descrip;
    nombres = _name.text;
    fecha = _date.text;
    costo =_costo.text;
    descrip = _descripcion.text;

    if(nombres.isEmpty && fecha.isEmpty && costo.isEmpty && descrip.isEmpty  ){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No pueden existir campos vacios en el registro, intente nuevamente"),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 30),
      ));
    }else{
      _register = await _endpoints.setInsumos(descrip, costo, fecha, nombres);
      if(_register == true){
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Registro exitoso"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 30),
        ));
      }else if(_register == false){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Fallo del servidor al registrar"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 30),
        ));
      }
    }

  }
}