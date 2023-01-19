// ignore_for_file: file_names
import 'package:farm_rice_flutter_web/class/classUserTable.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  Future<List<UserTable>> _lisTableUser;
  final Endpoints _endpoints = Endpoints();
  List itemRolOpen = ['Administrador', 'Trabajador', 'Usuario'];
  List itemEstadoOpen = ['Activo', 'Inactivo'];

  @override
  void initState() {
    _lisTableUser = _endpoints.getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Usuarios"),
          backgroundColor: const Color(0xff329437),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
          child: FutureBuilder(
            future: _lisTableUser,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return PaginatedDataTable(
                  columns: const<DataColumn>[
                      DataColumn(label: Text('Id')),
                      DataColumn(label: Text('Cedula')),
                      DataColumn(label: Text('Nombres')),
                      DataColumn(label: Text('Apellidos')),
                      DataColumn(label: Text('Telefono')),
                      DataColumn(label: Text('E-mail')),
                      DataColumn(label: Text('Nombre fiscal')),
                      DataColumn(label: Text('Direccion fiscal')),
                      DataColumn(label: Text('Rol')),
                      DataColumn(label: Text('Estado')),
                      DataColumn(label: Text('Opciones de usuario', softWrap: true)),
                    ],
                  source: resouceData(snapshot.data),
                  rowsPerPage: 8,
                  columnSpacing: 40,
                  header: const Text("Lista de usuarios", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), softWrap: true),
                  sortAscending: false,
                  actions: [
                    ElevatedButton.icon(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5)
                        ),
                        icon: const Icon(Icons.person_add, size: 30 ),
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

}

class resouceData extends DataTableSource {
  resouceData(this._listLec);
  final List<UserTable> _listLec;

  void _sort<T>(Comparable<T> Function(UserTable d) getField, bool ascending){
    _listLec.sort((UserTable a, UserTable b){
      if(!ascending){
        final UserTable c = a;
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
    final UserTable user = _listLec[index];
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), backgroundColor: Colors.blue,
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