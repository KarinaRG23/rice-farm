// ignore_for_file: file_names

class User{
  final String? nombre;
  final String? jwt;
  final String? correo;
  final String? roller;


  User({this.nombre, this.correo, this.jwt, this.roller});

  Map<String, dynamic>toJson(Map<String, dynamic> json){
    return {
      "username":nombre,
      "correo":correo,
      "token":jwt,
      "user_rol":roller
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      correo: json['correo'],
      roller: json['user_rol'],
      nombre: json['username'],
      jwt: json['token']
    );
  }
}
