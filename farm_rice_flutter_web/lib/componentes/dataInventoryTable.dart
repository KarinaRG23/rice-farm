import 'package:farm_rice_flutter_web/class/classInventoryTable.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class resourceInventoryData extends DataTableSource {
  resourceInventoryData(this._listLect);
  final List<InventoryTable> _listLect;

  void _sort<T>(Comparable<T> getField(InventoryTable d), bool ascending) {
    _listLect.sort((InventoryTable a, InventoryTable b) {
      if (!ascending) {
        final InventoryTable c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  final int _selectCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _listLect.length) return null;
    final InventoryTable lectura = _listLect[index];
    return DataRow.byIndex(
      index: index,
      selected: lectura.selected,
      cells: <DataCell>[
        DataCell(Center(child: Text(lectura.name, style: const TextStyle(fontWeight: FontWeight.bold)))),
        DataCell(Center(child: Text(lectura.name, softWrap: true))),
        DataCell(Center(child: Text(lectura.descripcion, softWrap: true))),
        DataCell(Center(child: Text(lectura.costo, softWrap: true))),
        DataCell(Center(child: Text(lectura.fechregistro, softWrap: true))),
        DataCell(Center(child: Text(lectura.status.toString(), softWrap: true))),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _listLect.length;
  @override
  int get selectedRowCount => _selectCount;
}