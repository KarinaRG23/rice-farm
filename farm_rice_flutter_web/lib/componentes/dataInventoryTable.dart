import 'package:farm_rice_flutter_web/class/classInventoryTable.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class resouceDataInv extends DataTableSource {
  resouceDataInv(this._listLec);
  final List<InventoryTable> _listLec;

  void _sort<T>(Comparable<T> Function(InventoryTable d) getField, bool ascending){
    _listLec.sort((InventoryTable a, InventoryTable b){
      if(!ascending){
        final InventoryTable c = a;
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
    final InventoryTable inv = _listLec[index];
    return DataRow.byIndex(
      index: index,
      selected: inv.selected,
      cells: <DataCell>[
        DataCell(Center(child: Text(inv.codigo))),
        DataCell(Center(child: Text(inv.name))),
        DataCell(Center(child: Text(inv.descripcion))),
        DataCell(Center(child: Text(inv.portada))),
        DataCell(Center(child: Text(inv.fechregistro))),
        DataCell(Center(child: Text(inv.ruta))),
        DataCell(Center(child: Text(inv.status))),
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