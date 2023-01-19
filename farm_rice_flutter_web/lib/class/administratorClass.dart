class Administrador{
  String userID;
  String dni;
  String name;
  String lastname;
  String phone;
  String email;
  String fiscalName;
  String direction;
  String rolId;
  String status;

  bool selected = false;

  Administrador(
      this.userID, this.dni, this.name, this.lastname, this.phone, this.email,
      this.fiscalName, this.direction, this.rolId, this.status);
}