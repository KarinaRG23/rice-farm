import 'package:farm_rice_flutter_web/class/trabajadoresClass.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class resourceWorkedData extends DataTableSource {
  resourceWorkedData(this._listLect, this.context);
  final List<Trabajador> _listLect;
  final BuildContext context;

  final Endpoints _endpoints = Endpoints();

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
        DataCell(Center(child: Text("\$${trabajador.salarario}", softWrap: true))),
        DataCell(Center(child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context)=>AlertDialog(
                        title: const Text("Datos Trabajadores"),
                        content: SizedBox(
                          height: 150,
                          width: 400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15),
                              Text('Nombres completos: ${trabajador.nombre} | C.I. ${trabajador.dni}'),
                              const SizedBox(height: 5),
                              Text('Email.: ${trabajador.email}'),
                              const SizedBox(height: 5),
                              Text('Direccion: ${trabajador.direccion}  | Telefono: ${trabajador.telefono}'),
                              const SizedBox(height: 5),
                              Text('Salario: \$${trabajador.salarario}'),
                            ],
                          ),
                        ),
                        actions: [],
                      )
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.center),
                child: const Icon(Icons.remove_red_eye_rounded,
                )),
            ElevatedButton(
                onPressed: () {
                  int id = int.parse(trabajador.id);
                  _endpoints.deleteUserDataTrabajador(id);
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
  int get rowCount => _listLect.length;
  @override
  int get selectedRowCount => _selectCount;
}