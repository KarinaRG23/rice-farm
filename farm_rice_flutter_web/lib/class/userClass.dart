// ignore_for_file: file_names

class User{
  String nombre;
  String correo;
  String roller;

  User(this.correo, this.roller, this.nombre);

  Map<String, dynamic>toJson(){
    return {
      "correo":correo,
      "user_rol":roller,
      "username":nombre
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
