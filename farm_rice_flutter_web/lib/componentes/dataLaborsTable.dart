// ignore_for_file: camel_case_types

import 'package:farm_rice_flutter_web/class/laborsClass.dart';
import 'package:flutter/material.dart';

class resouceDataLab extends DataTableSource {
  resouceDataLab(this._listLec);
  final List<Labores> _listLec;

  void _sort<T>(Comparable<T> Function(Labores d) getField, bool ascending){
    _listLec.sort((Labores a, Labores b){
      if(!ascending){
        final Labores c = a;
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
    final Labores lab = _listLec[index];
    return DataRow.byIndex(
      index: index,
      selected: lab.selected,
      cells: <DataCell>[
        DataCell(Center(child: Text(lab.id))),
        DataCell(Center(child: Text(lab.nombre))),
        DataCell(Center(child: Text(lab.descripcion))),
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.center),
                child: const Icon(Icons.edit,
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