class InventoryTable{
  int insumoid;
  String name;
  String descripcion;
  String costo;
  String fechregistro;
  int status;

  bool selected = false;

  InventoryTable(
      this.insumoid, this.name, this.descripcion, this.costo,
      this.fechregistro, this.status
      );

  Map<String, dynamic> toJson(Map<String, dynamic> json){
    return{
      "idinsumo": insumoid,
      "nombre": name,
      "descripcion": descripcion,
      "costo": costo,
      "fechregistro": fechregistro,
      "status": status,
    };
  }
}