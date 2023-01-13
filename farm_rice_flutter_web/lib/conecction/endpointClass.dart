// ignore_for_file: missing_return

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:farm_rice_flutter_web/class/userClass.dart';
import 'package:farm_rice_flutter_web/temporalClass/sharedPreferences.dart';
import 'package:http/http.dart' as http;

class Endpoints{
  Preferences preferences = Preferences();

  //CONNECTION LOGIN WITH ENDPOINT SESSION
  Future<bool> logIn(String email, String password) async {
    var urlLogin = 'http://159.223.205.198:8080/auth/login';
    var dataLogin = {"email": email, "password": password};
    var dataEncoding = jsonEncode(dataLogin);
    var dataHeader = {HttpHeaders.contentTypeHeader: "application/json"};
    final response = await http.post(Uri.parse(urlLogin), body: dataEncoding, headers: dataHeader);
    if (response.statusCode == 200) {
      return true;
    } else if(response.statusCode != 200){
      return false;
    }
  }

  Future<List<User>> dataUser() async {
    var email = await preferences.getEmail();
    var password = await preferences.getPassword();
    List<User> listUser = [];

    var urlLogin = 'http://159.223.205.198:8080/auth/login';
    var dataLogin = {"email": email, "password": password};
    var dataEncoding = jsonEncode(dataLogin);
    var dataHeader = {HttpHeaders.contentTypeHeader: "application/json"};
    final response = await http.post(Uri.parse(urlLogin), body: dataEncoding, headers: dataHeader);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for(var x in json['response']){
        listUser.add(User(x['username'], x['correo'], x['token'], x['user_rol']));
      }
      return listUser;
    }
  }

}