import 'package:farm_rice_web_flutter/class/classUserTable.dart';
import 'package:farm_rice_web_flutter/endepoints/endpointClass.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show PaginatedDataTable;

class UserDataNotifier with ChangeNotifier {
  UserDataNotifier() {
    fetchData();
  }

  List<UserTable> get userModel => _userModel;

  // SORT COLUMN INDEX...

  int get sortColumnIndex => _sortColumnIndex;

  set sortColumnIndex(int sortColumnIndex) {
    _sortColumnIndex = sortColumnIndex;
    notifyListeners();
  }

  // SORT ASCENDING....

  bool get sortAscending => _sortAscending;

  set sortAscending(bool sortAscending) {
    _sortAscending = sortAscending;
    notifyListeners();
  }

  int get rowsPerPage => _rowsPerPage;

  set rowsPerPage(int rowsPerPage) {
    _rowsPerPage = rowsPerPage;
    notifyListeners();
  }

  // -------------------------------------- INTERNALS --------------------------------------------

  var _userModel = <UserTable>[];

  int _sortColumnIndex;
  bool _sortAscending = true;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  Future<void> fetchData() async {
    _userModel = await Endpoints.fetchData();
    notifyListeners();
  }
}
