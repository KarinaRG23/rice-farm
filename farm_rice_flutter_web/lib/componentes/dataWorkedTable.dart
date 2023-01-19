import 'package:farm_rice_flutter_web/class/classWorkedTable.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class resourceWorkedData extends DataTableSource {
  resourceWorkedData(this._listLect);
  final List<WorkedTable> _listLect;

  void _sort<T>(Comparable<T> Function(WorkedTable d) getField, bool ascending) {
    _listLect.sort((WorkedTable a, WorkedTable b) {
      if (!ascending) {
        final WorkedTable c = a;
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
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _listLect.length) return null;
    final WorkedTable lectura = _listLect[index];
    return DataRow.byIndex(
      index: index,
      selected: lectura.selected,
      cells: <DataCell>[
        DataCell(Center(child: Text('${lectura.dni}', style: const TextStyle(fontWeight: FontWeight.bold)))),
        DataCell(Center(child: Text('${lectura.name}', softWrap: true))),
        DataCell(Center(child: Text('${lectura.lastname}', softWrap: true))),
        DataCell(Center(child: Text('${lectura.phone}', softWrap: true))),
        DataCell(Center(child: Text('${lectura.email}', softWrap: true))),
        DataCell(Center(child: Text('${lectura.fiscalName}', softWrap: true))),
        DataCell(Center(child: Text('${lectura.direccion}', softWrap: true))),
        DataCell(Center(child: Text('${lectura.salario}', softWrap: true))),
        DataCell(Center(child: Text('${lectura.rolId}', softWrap: true))),
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