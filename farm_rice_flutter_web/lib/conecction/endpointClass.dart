// ignore_for_file: missing_return, body_might_complete_normally_nullable, avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:farm_rice_flutter_web/class/classUserTable.dart';
import 'package:farm_rice_flutter_web/class/classWorkedTable.dart';
import 'package:farm_rice_flutter_web/class/classInventoryTable.dart';
import 'package:farm_rice_flutter_web/class/classLotTable.dart';
import 'package:farm_rice_flutter_web/class/userClass.dart';
import 'package:farm_rice_flutter_web/temporalClass/sharedPreferences.dart';
import 'package:farm_rice_flutter_web/temporalClass/userPreferences.dart';
import 'package:http/http.dart' as http;

class Endpoints {
  Preferences preferences = Preferences();
  UserPreferences userPreferences = UserPreferences();

  //CONNECTION LOGIN WITH ENDPOINT SESSION
  Future<bool?> logIn(String email, String password) async {
    var urlLogin = 'http://159.223.205.198:8080/auth/login';
    var dataLogin = {"email": email, "password": password};
    var dataEncoding = jsonEncode(dataLogin);
    var dataHeader = {HttpHeaders.contentTypeHeader: "application/json"};
    final response = await http.post(Uri.parse(urlLogin),
        body: dataEncoding, headers: dataHeader);
    if (response.statusCode == 200) {
      dataUser();
      return true;
    } else if (response.statusCode != 200) {
      return false;
    }
  }

  /*Future<List<User>> dataUser() async {
    var email = await preferences.getEmail();
    var password = await preferences.getPassword();
    List<User> listUser = [];
    var urlLogin = 'http://159.223.205.198:8080/auth/login';
    var dataLogin = {"email": email, "password": password};
    var dataEncoding = jsonEncode(dataLogin);
    var dataHeader = {HttpHeaders.contentTypeHeader: "application/json"};
    final response = await http.post(Uri.parse(urlLogin),
        body: dataEncoding, headers: dataHeader);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData['response']);
      for (var x in jsonData['response']){
        listUser.add(User.fromJson(jsonData['response']));
      }
      return listUser;
    }
  }*/

  Future<void> dataUser() async {
    var email = await preferences.getEmail();
    var password = await preferences.getPassword();

    var urlLogin = 'http://159.223.205.198:8080/auth/login';
    var dataLogin = {"email": email, "password": password};
    var dataEncoding = jsonEncode(dataLogin);
    var dataHeader = {HttpHeaders.contentTypeHeader: "application/json"};
    final response = await http.post(Uri.parse(urlLogin), body: dataEncoding, headers: dataHeader);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      print(jsonData['response']);

      userPreferences.setEmail(jsonData['response']['correo']);
      userPreferences.setRol(jsonData['response']['user_rol']);
      userPreferences.setName(jsonData['response']['username']);
      userPreferences.setToken(jsonData['response']['token']);

    }
  }

  //
  Future<List<UserTable>?> getUserData() async {
    var token = await preferences.getToken();
    List<UserTable> listTable = [];
    var url = 'http://159.223.205.198:8080/person';
    var dataPerson = {HttpHeaders.authorizationHeader: "Bearer $token"};
    final response = await http.get(Uri.parse(url), headers: dataPerson);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (var x in json['response']) {
        listTable.add(UserTable(
            x['idpersona'],
            x['identificacion'],
            x['nombres'],
            x['apellidos'],
            x['telefono'],
            x['email'],
            x['nombrefiscal'],
            x['direccionfiscal'],
            x['rolid'],
            x['status']));
      }
      return listTable;
    }
  }

  Future<List<WorkedTable>?> getWorkedData() async {
    var token = await preferences.getToken();
    List<WorkedTable> listWorkedTable = [];
    var url = 'http://159.223.205.198:8080/employee';
    var dataEmployee = {HttpHeaders.authorizationHeader: "Bearer $token"};
    final response = await http.get(Uri.parse(url), headers: dataEmployee);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (var x in json['response']) {
        listWorkedTable.add(WorkedTable(
            x['idpersona'],
            x['identificacion'],
            x['nombres'],
            x['apellidos'],
            x['telefono'],
            x['email'],
            x['nombrefiscal'],
            x['direccionfiscal'],
            x['salario'],
            x['rolid'],
            x['status']));
      }
      return listWorkedTable;
    }
  }

  Future<List<InventoryTable>?> getInventoryData() async {
    var token = await preferences.getToken();
    List<InventoryTable> listInventoryTable = [];
    var url = 'http://159.223.205.198:8080/supplies';
    var dataSupplies = {HttpHeaders.authorizationHeader: "Bearer $token"};
    final response = await http.get(Uri.parse(url), headers: dataSupplies);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (var x in json['response']) {
        listInventoryTable.add(InventoryTable(x['idinsumo'], x['nombre'],
            x['descripcion'], x['costo'], x['fechregistro'], x['status']));
      }
      return listInventoryTable;
    }
  }

  Future<List<LotTable>?> getLotData() async {
    var token = await preferences.getToken();
    List<LotTable> listLotTable = [];
    var url = 'http://159.223.205.198:8080/lots';
    var dataLots = {HttpHeaders.authorizationHeader: "Bearer $token"};
    final response = await http.get(Uri.parse(url), headers: dataLots);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (var x in json['response']) {
        listLotTable.add(LotTable(x['idlote'], x['nombrelote'], x['numerolote'],
            x['area'], x['etapa'], x['status']));
      }
      return listLotTable;
    }
  }
}
