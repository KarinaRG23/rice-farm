// ignore_for_file: file_names

class LotTable{
  int idlote;
  String nombrelote;
  String numerolote;
  String area;
  String etapa;
  int status;
  bool selected = false;

  LotTable(
      this.idlote, this.nombrelote, this.numerolote, this.area, this.etapa, this.status
      );

  Map<String, dynamic> toJson(Map<String, dynamic> json){
    return{
      "idlote": idlote,
      "nomlote":nombrelote,
      "numlote": numerolote,
      "area": area,
      "etapa": etapa,
      "status": status,
    };
  }
}