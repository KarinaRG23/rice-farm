// ignore_for_file: file_names

class User{
  String nombre;
  String jwt;
  String correo;
  String roller;


  User(this.nombre, this.correo, this.jwt, this.roller);

  Map<String, dynamic>toJson(Map<String, dynamic> json){
    return {
      "username":nombre,
      "correo":correo,
      "token":jwt,
      "user_rol":roller
    };
  }
}
