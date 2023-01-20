// ignore_for_file: camel_case_types

import 'package:farm_rice_flutter_web/class/classLotTable.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:flutter/material.dart';


class resouceDataLote extends DataTableSource {
  resouceDataLote(this._listLec, this.context);
  final List<LoteTable> _listLec;
  final BuildContext context;

  final Endpoints _endpoints = Endpoints();

  void _sort<T>(Comparable<T> Function(LoteTable d) getField, bool ascending){
    _listLec.sort((LoteTable a, LoteTable b){
      if(!ascending){
        final LoteTable c = a;
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
    final LoteTable lote = _listLec[index];
    return DataRow.byIndex(
      index: index,
      selected: lote.selected,
      cells: <DataCell>[
        DataCell(Center(child: Text(lote.idlote))),
        DataCell(Center(child: Text(lote.numerolote))),
        DataCell(Center(child: Text(lote.area))),
        DataCell(Center(child: Text(lote.etapa))),
        DataCell(Center(child: Text('\$${lote.inversion}'))),
        DataCell(Center(child: Text('\$${lote.coste}'))),
        DataCell(Center(child: Text('\$${lote.total}'))),
        DataCell(Center(child: ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context)=>AlertDialog(
                        title: const Text("Informacion por Lote"),
                        content: SizedBox(
                          height: 200,
                          width: 400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15),
                              Text('Id: ${lote.idlote}'),
                              const SizedBox(height: 5),
                              Text('Numero de lote: ${lote.numerolote}'),
                              const SizedBox(height: 5),
                              Text('Etapa: ${lote.etapa}'),
                              const SizedBox(height: 5),
                              Text('Area: ${lote.area}'),
                              const SizedBox(height: 5),
                              Text('Inversion: \$${lote.inversion}  | Coste: \$${lote.coste}'),
                              const SizedBox(height: 5),
                              Text('Total.: \$${lote.total}'),
                            ],
                          ),
                        ),
                        actions: [],
                      )
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(), backgroundColor: const Color(0xff329437),
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.center,
                ),
                child: const Icon(Icons.remove_red_eye_rounded,
                )),
            ElevatedButton(
                onPressed: () {
                  int id = int.parse(lote.idlote);
                  _endpoints.deleteLotes(id);
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