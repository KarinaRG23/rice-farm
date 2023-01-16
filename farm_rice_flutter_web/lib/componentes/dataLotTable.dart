import 'package:farm_rice_flutter_web/class/classLotTable.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class resourceLotData extends DataTableSource {
  resourceLotData(this._listLect);
  final List<LotTable> _listLect;

  void _sort<T>(Comparable<T> getField(LotTable d), bool ascending) {
    _listLect.sort((LotTable a, LotTable b) {
      if (!ascending) {
        final LotTable c = a;
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
    final LotTable lectura = _listLect[index];
    return DataRow.byIndex(
      index: index,
      selected: lectura.selected,
      cells: <DataCell>[
        DataCell(Center(child: Text(lectura.nombrelote, style: const TextStyle(fontWeight: FontWeight.bold)))),
        DataCell(Center(child: Text(lectura.nombrelote, softWrap: true))),
        DataCell(Center(child: Text(lectura.numerolote, softWrap: true))),
        DataCell(Center(child: Text(lectura.area, softWrap: true))),
        DataCell(Center(child: Text(lectura.etapa, softWrap: true))),
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