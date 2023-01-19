// ignore_for_file: unused_element

import 'package:farm_rice_flutter_web/class/insumosClass.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class resouceDataIns extends DataTableSource {
  resouceDataIns(this._listLec);
  final List<Insumos> _listLec;

  void _sort<T>(Comparable<T> Function(Insumos d) getField, bool ascending){
    _listLec.sort((Insumos a, Insumos b){
      if(!ascending){
        final Insumos c = a;
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
    final Insumos ins = _listLec[index];
    return DataRow.byIndex(
      index: index,
      selected: ins.selected,
      cells: <DataCell>[
        DataCell(Center(child: Text(ins.codigo))),
        DataCell(Center(child: Text(ins.nombre))),
        DataCell(Center(child: Text(ins.descripcion))),
        DataCell(Center(child: Text("\$${ins.costo}"))),
        DataCell(Center(child: Text(ins.fecharegistro))),
        DataCell(Center(child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {

                },
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