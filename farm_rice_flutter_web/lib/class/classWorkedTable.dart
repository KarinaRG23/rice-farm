// ignore_for_file: file_names

class WorkedTable{
  int userID;
  String dni;
  String name;
  String lastname;
  String phone;
  String email;
  String? salt;
  String fiscalName;
  String direccion;
  String salario;
  String rolId;
  String? decreated;
  int status;

  bool selected = false;

  WorkedTable(
      this.userID, this.dni, this.name, this.lastname, this.phone,
      this.email, this.fiscalName, this.direccion, this.salario, this.rolId, this.status
      );

  Map<String, dynamic> toJson(Map<String, dynamic> json){
    return{
      "idpersona": userID,
      "identificacion":dni,
      "nombres": name,
      "apellidos": lastname,
      "telefono": phone,
      "email": email,
      "nombrefiscal": fiscalName,
      "direccionfiscal": direccion,
      "direccionfiscal": salario,
      "rolid": rolId,
      "status": status,
    };
  }
}