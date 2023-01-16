import 'package:farm_rice_flutter_web/class/classUserTable.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class resourceData extends DataTableSource {
  resourceData(this._listLect);
  late List<UserTable> _listLect;

  void _sort<T>(Comparable<T> getField(UserTable d), bool ascending) {
    _listLect.sort((UserTable a, UserTable b) {
      if (!ascending) {
        final UserTable c = a;
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
    final UserTable lectura = _listLect[index];
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
        DataCell(Center(child: Text('${lectura.direction}', softWrap: true))),
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