import 'package:farm_rice_flutter_web/class/trabajadoresClass.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class resourceWorkedData extends DataTableSource {
  resourceWorkedData(this._listLect);
  final List<Trabajador> _listLect;

  void _sort<T>(Comparable<T> Function(Trabajador d) getField, bool ascending) {
    _listLect.sort((Trabajador a, Trabajador b) {
      if (!ascending) {
        final Trabajador c = a;
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
    final Trabajador trabajador = _listLect[index];
    return DataRow.byIndex(
      index: index,
      selected: trabajador.selected,
      cells: <DataCell>[
        DataCell(Center(child: Text(trabajador.id, style: const TextStyle(fontWeight: FontWeight.bold)))),
        DataCell(Center(child: Text(trabajador.dni, softWrap: true))),
        DataCell(Center(child: Text(trabajador.nombre, softWrap: true))),
        DataCell(Center(child: Text(trabajador.email, softWrap: true))),
        DataCell(Center(child: Text(trabajador.telefono, softWrap: true))),
        DataCell(Center(child: Text(trabajador.direccion, softWrap: true))),
        DataCell(Center(child: Text(trabajador.salarario, softWrap: true))),
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
  int get rowCount => _listLect.length;
  @override
  int get selectedRowCount => _selectCount;
}