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
  Future<bool> logIn(String email, String password) async {
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

  Future<void> dataUser() async {
    //List<User> listUser = [];
    var email = await preferences.getEmail();
    var password = await preferences.getPassword();
    var urlLogin = 'http://159.223.205.198:8080/auth/login';
    var dataLogin = {"email": email, "password": password};
    var dataEncoding = jsonEncode(dataLogin);
    var dataHeader = {HttpHeaders.contentTypeHeader: "application/json"};
    final response = await http.post(Uri.parse(urlLogin), body: dataEncoding, headers: dataHeader);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      print(jsonData);
      /*for(var x in jsonData){
        listUser.add(User(x['correo'], x['user_rol'], x['username']));
        userPreferences.setToken(x['token']);
      }*/
      userPreferences.setEmail(jsonData['response']['correo']);
      userPreferences.setRol(jsonData['response']['user_rol']);
      userPreferences.setName(jsonData['response']['username']);
      userPreferences.setToken(jsonData['response']['token']);
      //return listUser;
    }
  }

  //
  Future<List<UserTable>> getUserData() async {
    List<UserTable> listTable = [];
    var url = 'http://159.223.205.198:8080/person';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      for (var x in jsonData['response']) {
        listTable.add(UserTable(
            x['idpersona'].toString(), x['identificacion'], x['nombres'], x['apellidos'], x['telefono'],
            x['email'], x['nombrefiscal'], x['direccionfiscal'], x['rolid'].toString(), x['status'].toString()));
      }
      return listTable;
    }
  }

  Future<List<InventoryTable>> getInventoryData() async {
    List<InventoryTable> listInventoryTable = [];
    var url = 'http://159.223.205.198:8080/categoria';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      for (var x in jsonData['response']) {
        listInventoryTable.add(InventoryTable(
            x['idcategoria'].toString(),x['nombre'], x['descripcion'], x['portada'], x['decreated'].toString(), x['ruta'], x['status'].toString()));
      }
      return listInventoryTable;
    }
  }
  
  /*Future<List<WorkedTable>> getWorkedData() async {
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

  Future<List<LotTable>> getLotData() async {
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
  }*/
}
