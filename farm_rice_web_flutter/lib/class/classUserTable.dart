// ignore_for_file: file_names
import 'dart:convert';

List<UserTable> userTableFromJson(String str) =>
    List<UserTable>.from(json.decode(str).map((x) => UserTable.fromJson(x)));

String userTableToJson(List<UserTable> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserTable{
  int userID;
  String dni;
  String name;
  String lastname;
  String phone;
  String email;
  String salt;
  String fiscalName;
  String direction;
  String rolId;
  String decreated;
  int status;

  bool selected = false;

  UserTable(
      {this.userID,
      this.dni,
      this.name,
      this.lastname,
      this.phone,
      this.email,
      this.fiscalName,
      this.direction,
      this.rolId,
      this.status});


  Map<String, dynamic> toJson(){
    return{
      "idpersona": userID,
      "identificacion":dni,
      "nombres": name,
      "apellidos": lastname,
      "telefono": phone,
      "email": email,
      "nombrefiscal": fiscalName,
      "direccionfiscal": direction,
      "rolid": rolId,
      "status": status,
    };
  }

  factory UserTable.fromJson(Map<String, dynamic> json) {
    return UserTable(
        userID: json['idpersona'],
        dni: json['identificacion'],
        name: json['nombres'],
        lastname: json['apellidos'],
        phone:json['telefono'],
        email:json['email'],
        fiscalName:json['nombrefiscal'],
        direction:json['direccionfiscal'],
        rolId:json['rolid'],
        status:json['status']
    );
  }
}