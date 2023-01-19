import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences{
  String nameUser = 'name';
  String tokenUser = 'token';
  String rolUser = 'rol';
  String emailUser = 'email';

  SharedPreferences preferences;

  setName(String name) async{
    preferences = await SharedPreferences.getInstance();
    preferences.setString(nameUser, name);
  }

  setToken(String token) async{
    preferences = await SharedPreferences.getInstance();
    preferences.setString(tokenUser, token);
  }
  setEmail(String correo) async{
    preferences = await SharedPreferences.getInstance();
    preferences.setString(emailUser, correo);
  }
  setRol(String rol) async{
    preferences = await SharedPreferences.getInstance();
    preferences.setString(rolUser, rol);
  }

  Future<String> getName() async {
    preferences = await SharedPreferences.getInstance();
    final result = preferences.getString(nameUser);
    return result;
  }

  Future<String> getToken() async {
    preferences = await SharedPreferences.getInstance();
    final result = preferences.getString(tokenUser);
    return result;
  }

  Future<String> getEmail() async {
    preferences = await SharedPreferences.getInstance();
    final result = preferences.getString(emailUser);
    return result;
  }

  Future<String> getRol() async {
    preferences = await SharedPreferences.getInstance();
    final result = preferences.getString(rolUser);
    return result;
  }
}