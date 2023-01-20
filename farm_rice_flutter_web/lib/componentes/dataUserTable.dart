// ignore_for_file: unused_element, camel_case_types

import 'package:farm_rice_flutter_web/class/classUserTable.dart';
import 'package:flutter/material.dart';

class resouceDataUser extends DataTableSource {
  resouceDataUser(this._listLec);
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), backgroundColor: const Color(0xff329437),
                    alignment: Alignment.center),
                child: const Icon(Icons.remove_red_eye_rounded,
                )),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), backgroundColor: Colors.red,
                    alignment: Alignment.center),
                child: const Icon(Icons.edit,
                )),
            ElevatedButton(
                onPressed: () {},
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