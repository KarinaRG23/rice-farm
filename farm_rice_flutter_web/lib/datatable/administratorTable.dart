import 'package:farm_rice_flutter_web/class/administratorClass.dart';
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
                  DataColumn(label: Text('Opciones de usuario', softWrap: true, style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                source: resouceData(snapshot.data),
                rowsPerPage: 8,
                columnSpacing: 25,
                header: const Text("Lista de usuarios", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), softWrap: true),
                sortAscending: false,
                actions: [
                  ElevatedButton.icon(
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (context)=> AlertDialog(
                              title: const Text("REGISTRO DE NUEVO USUARIO"),
                              titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              contentPadding: const EdgeInsets.all(5),
                              content:SizedBox(
                                height: 300,
                                width: 600,
                                child: Column(
                                  children: [],
                                ),
                              ),
                              actions: const [
                                ButtonBar(
                                  alignment: MainAxisAlignment.end,
                                  children: [],
                                )
                              ],
                            )
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          backgroundColor: const Color(0xff329437)
                      ),
                      icon: const Icon(Icons.person_add, size: 30 ),
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
      ),
    );
  }
}

class resouceData extends DataTableSource {
  resouceData(this._listLec);
  final List<Administrador> _listLec;

  void _sort<T>(Comparable<T> Function(Administrador d) getField, bool ascending){
    _listLec.sort((Administrador a, Administrador b){
      if(!ascending){
        final Administrador c = a;
        a =b; b =c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  final int _selectCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if(index >= _listLec.length) return null;
    final Administrador user = _listLec[index];
    return DataRow.byIndex(
      index: index,
      selected: user.selected,
      cells: <DataCell>[
        DataCell(Center(child: Text(user.userID))),
        DataCell(Center(child: Text(user.dni))),
        DataCell(Center(child: Text(user.name))),
        DataCell(Center(child: Text(user.lastname))),
        DataCell(Center(child: Text(user.phone))),
        DataCell(Center(child: Text(user.email))),
        DataCell(Center(child: Text(user.fiscalName))),
        DataCell(Center(child: Text(user.direction))),
        DataCell(Center(child: Text(user.rolId))),
        DataCell(Center(child: Text(user.status))),
        DataCell(Center(child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), backgroundColor: const Color(0xff329437),
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.center),
                child: const Icon(Icons.remove_red_eye_rounded,
                )),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), backgroundColor: Colors.red,
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.center),
                child: const Icon(Icons.delete,
                )),
          ],))),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _listLec.length;
  @override
  int get selectedRowCount => _selectCount;
}