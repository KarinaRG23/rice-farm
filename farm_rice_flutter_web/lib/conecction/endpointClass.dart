// ignore_for_file: missing_return, body_might_complete_normally_nullable, avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'package:farm_rice_flutter_web/class/administratorClass.dart';
import 'package:farm_rice_flutter_web/class/classUserTable.dart';
import 'package:farm_rice_flutter_web/class/classInventoryTable.dart';
import 'package:farm_rice_flutter_web/class/classLotTable.dart';
import 'package:farm_rice_flutter_web/class/insumosClass.dart';
import 'package:farm_rice_flutter_web/class/laborsClass.dart';
import 'package:farm_rice_flutter_web/class/productClass.dart';
import 'package:farm_rice_flutter_web/class/rolClass.dart';
import 'package:farm_rice_flutter_web/class/trabajadoresClass.dart';
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

  Future<List<User>> dataUser() async {
    List<User> listUser = [];
    var email = await preferences.getEmail();
    var password = await preferences.getPassword();

    var urlLogin = 'http://159.223.205.198:8080/auth/login';
    var dataLogin = {"email": email, "password": password};
    var dataEncoding = jsonEncode(dataLogin);
    var dataHeader = {HttpHeaders.contentTypeHeader: "application/json"};

    final response = await http.post(Uri.parse(urlLogin), body: dataEncoding, headers: dataHeader);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      listUser.add(User(jsonData['response']['user_rol'], jsonData['response']['username']));
      userPreferences.setToken(jsonData['response']['token']);
    }
    return listUser;
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

  Future<bool> setUserData(String dni, String name, String password,String lastname, String phone,
      String email, String namef, String direction, int rol) async {
    var url = 'http://159.223.205.198:8080/person';
    var dataBody = {
      "identificacion": dni,
      "nombres": name,
      "apellidos": lastname,
      "telefono": phone,
      "email": email,
      "nombrefiscal": namef,
      "direccionfiscal": direction,
      "password":password,
      "rolid": rol,
    };
    var dataEncoding = jsonEncode(dataBody);
    var dataHeader = {HttpHeaders.contentTypeHeader: "application/json"};
    final response = await http.post(Uri.parse(url), body: dataEncoding, headers: dataHeader);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    }else{
      return false;
    }
  }

  Future<bool> deleteUserData(int idUser)async{
    var url ="http://159.223.205.198:8080/person/delete/$idUser";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode ==200){
      return true;
    }else if(response.statusCode != 200){
      return false;
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
            x['idcategoria'].toString(), x['nombre'], x['descripcion'],
            x['portada'], x['decreated'].toString(), x['ruta'], x['status'].toString()));
      }
      return listInventoryTable;
    }
  }

  Future<List<Insumos>> getInsumos() async {
    var token = await userPreferences.getToken();
    List<Insumos> listInsumos = [];
    var url = 'http://159.223.205.198:8080/insumos';
    var dataHeader ={HttpHeaders.authorizationHeader: "Bearer $token"};
    final response = await http.get(Uri.parse(url), headers: dataHeader);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      for (var x in jsonData['response']){
        listInsumos.add(Insumos(x['codigo'].toString(), x['nombre'], x['descripcion'], x['costo'], x['f_registro']));
      }
      return listInsumos;
    }
  }

  Future<bool> setInsumos(String descripcion, String costo, String date, String nombre) async {
    var token = await userPreferences.getToken();
    var url = 'http://159.223.205.198:8080/insumos';
    var dataHeader ={HttpHeaders.authorizationHeader: "Bearer $token"};
    var dataBody = {
      "descripcion": descripcion,
      "costo": costo,
      "f_registro": date,
      "nombre": nombre
    };
    var dataEncoding = jsonEncode(dataBody);
    final response = await http.post(Uri.parse(url), body: dataEncoding, headers: dataHeader);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    }else{
      return false;
    }
  }

  Future<bool> deleteInsumos(int id) async {
    var token = await userPreferences.getToken();
    var dataheader = {HttpHeaders.authorizationHeader: "Bearer $token"};
    var url = 'http://159.223.205.198:8080/insumos/delete/$id';
    final response = await http.get(Uri.parse(url), headers: dataheader);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    }else{
      return false;
    }
  }

  //
  Future<List<Rol>> getRolUser() async {
    List<Rol> listRol = [];
    var url = 'http://159.223.205.198:8080/rol';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      for (var x in jsonData['response']) {
        listRol.add(Rol(x['idrol'].toString(), x['nombrerol'], x['descripcion'], x['status'].toString()));
      }
      return listRol;
    }
  }
  Future<List<Administrador>> getAdministrador() async {
    List<Administrador> listAdministrador = [];
    var url = 'http://159.223.205.198:8080/person/admin';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      for (var x in jsonData['response']) {
        listAdministrador.add(
            Administrador(x['idpersona'].toString(), x['identificacion'], x['nombres'], x['apellidos'], x['telefono'],
                x['email'], x['nombrefiscal'], x['direccionfiscal'], x['rolid'].toString(), x['status'].toString()));
      }
      return listAdministrador;
    }
  }

  //
  Future<List<Produccion>> getProduccion() async {
    List<Produccion> lisProduccion = [];
    var url = 'http://159.223.205.198:8080/Produccion';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      for (var x in jsonData['response']) {}
      return lisProduccion;
    }
  }

  Future<List<Trabajador>> getTrabajador() async {
    List<Trabajador> lisTrabajador = [];
    var url = 'http://159.223.205.198:8080/Trabajadores';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      for (var x in jsonData['response']) {
        lisTrabajador.add(Trabajador(x['codigo'].toString(), x['dni'], x['nombres'],
            x['email'], x['telefono'], x['direccion'], x['salario']));
      }
      return lisTrabajador;
    }
  }

  Future<bool> deleteUserDataTrabajador(int idUser)async{
    var url ="http://159.223.205.198:8080/Trabajadores/delete/$idUser";
    final response = await http.get(Uri.parse(url));
    if(response.statusCode ==200){
      return true;
    }else if(response.statusCode != 200){
      return false;
    }
  }

  Future<List<Labores>> getLabores() async {
    var token = await userPreferences.getToken();
    List<Labores> listLabores = [];
    var url = 'http://159.223.205.198:8080/Labores';
    var headers = {HttpHeaders.authorizationHeader: "Bearer $token"};
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      for (var x in jsonData['response']) {
        listLabores.add(Labores(x['codigo'].toString(), x['nombre'], x['descripcion']));
      }
      return listLabores;
    }
  }

  Future<List<LoteTable>> getLotes() async {
    var token = await userPreferences.getToken();
    List<LoteTable> listLote = [];
    var url = 'http://159.223.205.198:8080/lote';
    var headers = {HttpHeaders.authorizationHeader: "Bearer $token"};
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      for (var x in jsonData['response']) {
        listLote.add(LoteTable(x['codigo'].toString(), x['numero_lote'], x['area'],
            x['etapa'], x['inversion'].toString(), x['costo'].toString(), x['total'].toString()));
      }
      return listLote;
    }
  }

  Future<bool> deleteLotes(int id) async {
    var token = await userPreferences.getToken();
    var url = 'http://159.223.205.198:8080/lote/delete/$id';
    var headers = {HttpHeaders.authorizationHeader: "Bearer $token"};
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return true;
    }else{
      return false;
    }
  }
}