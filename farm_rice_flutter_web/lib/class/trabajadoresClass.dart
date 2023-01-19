class Trabajador{
  String id;
  String nombre;
  String dni;
  String telefono;
  String direccion;
  String email;
  String salarario;

  bool selected = false;

  Trabajador(this.id, this.dni, this.nombre, this.email, this.telefono, this.direccion,
      this.salarario);
}