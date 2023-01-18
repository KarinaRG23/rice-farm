// ignore_for_file: file_names, camel_case_types

import 'package:farm_rice_web_flutter/app_level/models/data_notifier.dart';
import 'package:farm_rice_web_flutter/app_level/models/data_table_source.dart';
import 'package:farm_rice_web_flutter/app_level/widget/custom_dialog.dart';
import 'package:farm_rice_web_flutter/app_level/widget/custom_scaffold.dart';
import 'package:farm_rice_web_flutter/app_level/widget/other_details.dart';
import 'package:farm_rice_web_flutter/class/classUserTable.dart';
import 'package:farm_rice_web_flutter/components/customDataTable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return CustomScaffold(
      showAppBar: false,
      enableDarkMode: false,
      titleText: "Usuarios",
      child: ChangeNotifierProvider<UserDataNotifier>(
        create: (_)=> UserDataNotifier(),
        child: const _InternalWidget(),
      ),

    );
  }
}

class _InternalWidget extends StatelessWidget{
  const _InternalWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = context.watch<UserDataNotifier>();
    final _model = _provider.userModel;

    if(_model.isEmpty){
      return const SizedBox.shrink();
    }
    final _dtSource = UserDataTableSource(
      onRowSelect: (index) => _showDetails(context, _model[index]),
      userData: _model,
    );

    return CustomPaginatedTable(
      actions: <IconButton>[
        IconButton(
          splashColor: Colors.transparent,
          icon: const Icon(Icons.refresh),
          onPressed: () {
            _provider.fetchData();
            _showSBar(context, "Refresco exitoso");
          },
        ),
      ],
      dataColumns: _colGen(_dtSource, _provider),
      header: const Text("Listado de usuarios"),
      onRowChanged: (index) => _provider.rowsPerPage = index,
      rowsPerPage: _provider.rowsPerPage,
      showActions: true,
      source: _dtSource,
      sortColumnIndex: _provider.sortColumnIndex,
      sortColumnAsc: _provider.sortAscending,
    );

  }

  List<DataColumn> _colGen(
      UserDataTableSource _src,
      UserDataNotifier _provider,
      ) =>
      <DataColumn>[
        DataColumn(
          label: const Text('Id'),
          numeric: true,
          tooltip: 'Id',
          onSort: (colIndex, asc) {
            _sort<num>((user) => user.userID, colIndex, asc, _src, _provider);
          },
        ),
        const DataColumn(
          label: Text('Cedula'),
          tooltip: 'Cedula',
        ),
        DataColumn(
          label: const Text('Nombres'),
          tooltip: 'Nombres',
          onSort: (colIndex, asc) {
            _sort<String>((user) => user.name, colIndex, asc, _src, _provider);
          },
        ),
        DataColumn(
          label: const Text('Apellidos'),
          tooltip: 'Apellidos',
          onSort: (colIndex, asc) {
            _sort<String>((user) => user.lastname, colIndex, asc, _src, _provider);
          },
        ),
        const DataColumn(
          label: Text('Telefono'),
          tooltip: 'Telefono',
        ),
        DataColumn(
          label: const Text('E-mail'),
          tooltip: 'E-mail',
          onSort: (colIndex, asc) {
            _sort<String>((user) => user.email, colIndex, asc, _src, _provider);
          },
        ),
        const DataColumn(
          label: Text('Localidad fiscal'),
          tooltip: 'Localidad fiscal',
        ),
        const DataColumn(
          label: Text('Direccion fiscal'),
          tooltip: 'Direccion fiscal',
        ),
        const DataColumn(
          label: Text('RolId'),
          tooltip: 'RolId',
        ),
        const DataColumn(
          label: Text('Estado'),
          tooltip: 'Estado',
        ),
      ];

  void _sort<T>(
      Comparable<T> Function(UserTable user) getField,
      int colIndex,
      bool asc,
      UserDataTableSource _src,
      UserDataNotifier _provider,
      ) {
    _src.sort<T>(getField, asc);
    _provider.sortAscending = asc;
    _provider.sortColumnIndex = colIndex;
  }

  void _showSBar(BuildContext c, String textToShow) {
    ScaffoldMessenger.of(c).showSnackBar(
      SnackBar(
        content: Text(textToShow),
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  void _showDetails(BuildContext c, UserTable data) async =>
      await showDialog<bool>(
        context: c,
        builder: (_) => CustomDialog(
          showPadding: false,
          child: OtherDetails(data: data),
        ),
      );
}