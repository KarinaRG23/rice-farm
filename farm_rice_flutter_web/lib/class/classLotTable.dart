// ignore_for_file: file_names

class LoteTable{
  String idlote;
  String nombrelote;
  String numerolote;
  String area;


  bool selected = false;

  LoteTable(this.idlote, this.nombrelote, this.numerolote, this.area);

  Map<String, dynamic> toJson(){
    return{
      "idlote": idlote,
      "nomlote":nombrelote,
      "numlote": numerolote,
      "area": area
    };
  }
}