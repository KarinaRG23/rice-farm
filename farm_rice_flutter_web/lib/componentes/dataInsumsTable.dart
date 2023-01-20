// ignore_for_file: unused_element

import 'package:farm_rice_flutter_web/class/insumosClass.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class resouceDataIns extends DataTableSource {
  resouceDataIns(this._listLec, this.context);
  final List<Insumos> _listLec;
  final BuildContext context;

  final Endpoints _endpoints = Endpoints();

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
                onPressed: () {
                  int id = int.parse(ins.codigo);
                  _endpoints.deleteInsumos(id);
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