// ignore_for_file: unused_element, camel_case_types

import 'package:farm_rice_flutter_web/class/classUserTable.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class resouceDataUser extends DataTableSource {
  resouceDataUser(this._listLec, this.context);
  final List<UserTable> _listLec;
  final BuildContext context;

  final Endpoints _endpoints = Endpoints();

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
        DataCell(Text(user.dni)),
        DataCell(Text(user.name)),
        DataCell(Text(user.lastname)),
        DataCell(Text(user.phone)),
        DataCell(Text(user.email)),
        DataCell(Text(user.fiscalName)),
        DataCell(Text(user.direction)),
        DataCell(Text(user.rolId)),
        DataCell(Text(user.status)),
        DataCell(ButtonBar(
          buttonPadding: const EdgeInsets.all(0.5),
          alignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context)=>AlertDialog(
                        title: const Text("Datos personales"),
                        content: SizedBox(
                          height: 200,
                          width: 400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15),
                              Text('Nombres completos: ${user.name} ${user.lastname}'),
                              const SizedBox(height: 5),
                              Text('Email: ${user.email}'),
                              const SizedBox(height: 5),
                              Text('C.I.: ${user.dni}  | Telefono: ${user.phone}'),
                              const SizedBox(height: 5),
                              Text('Direccion.: ${user.direction}'),
                              const SizedBox(height: 5),
                              Text('Rol.: ${user.rolId}  |  Estado: ${user.status}'),
                            ],
                          ),
                        ),
                        actions: [],
                      )
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), backgroundColor: const Color(0xff329437),
                    alignment: Alignment.center),
                child: const Icon(Icons.remove_red_eye_rounded,
                )),
            ElevatedButton(
                onPressed: () {
                  int n = int.parse(user.userID);
                  _endpoints.deleteUserData(n);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Fila eliminada. Actualizar pagina"),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.only(bottom: 30),
                  ));
                },
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), backgroundColor: Colors.red,
                    alignment: Alignment.center),
                child: const Icon(Icons.delete,
                )),
          ],)),
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