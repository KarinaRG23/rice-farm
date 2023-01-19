// ignore_for_file: file_names

class User{
  String nombre;
  String jwt;
  String correo;
  String roller;

  User(this.correo, this.roller, this.nombre, this.jwt);

  Map<String, dynamic>toJson(Map<String, dynamic> json){
    return {
      "username":nombre,
      "correo":correo,
      "token":jwt,
      "user_rol":roller
    };
  }

  /*factory User.fromJson(Map<String, dynamic> json) {
    return User(
      correo: json['correo'],
      roller: json['user_rol'],
      nombre: json['username'],
      jwt: json['token']
    );
  }*/
}
