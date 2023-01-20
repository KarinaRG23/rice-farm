// ignore_for_file: camel_case_types

import 'package:farm_rice_flutter_web/class/rolClass.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class resouceDataRol extends DataTableSource {
  resouceDataRol(this._listLec, this.context);
  final List<Rol> _listLec;
  final BuildContext context;

  final Endpoints _endpoints = Endpoints();

  void _sort<T>(Comparable<T> Function(Rol d) getField, bool ascending){
    _listLec.sort((Rol a, Rol b){
      if(!ascending){
        final Rol c = a;
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
    final Rol user = _listLec[index];
    return DataRow.byIndex(
      index: index,
      selected: user.selected,
      cells: <DataCell>[
        DataCell(Center(child: Text(user.idRol))),
        DataCell(Center(child: Text(user.nombreRol))),
        DataCell(Center(child: Text(user.description))),
        DataCell(Center(child: user.status == "1" ? const Text("Activo") : const Text("Inactivo"))),
        DataCell(Center(child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(), backgroundColor: const Color(0xff329437),
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.center,
                ),
                child: const Icon(Icons.remove_red_eye_rounded,
                )),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Fila eliminada. Actualizar pagina"),
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.only(bottom: 30),
                  ));
                },
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