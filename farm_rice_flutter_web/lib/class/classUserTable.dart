// ignore_for_file: file_names
class UserTable{
  final int? userID;
  final String? dni;
  final String? name;
  final String? lastname;
  final String? phone;
  final String? email;
  String? salt;
  final String? fiscalName;
  final String? direction;
  final String? rolId;
  String? decreated;
  final int? status;

  bool selected = false;

  UserTable(
      this.userID, this.dni, this.name, this.lastname, this.phone, this.email,
      this.fiscalName, this.direction, this.rolId, this.status);


  Map<String, dynamic> toJson(Map<String, dynamic> json){
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
}