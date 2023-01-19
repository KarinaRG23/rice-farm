import 'dart:convert';

String inventoryTableToJson(List<InventoryTable> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InventoryTable{
  String codigo;
  String name;
  String descripcion;
  String portada;
  String fechregistro;
  String ruta;
  String status;

  bool selected = false;

  InventoryTable(
      this.codigo, this.name, this.descripcion, this.portada,
      this.fechregistro, this.ruta, this.status
      );

  Map<String, dynamic> toJson(){
    return{
      "codigo": codigo,
      "nombre": name,
      "descripcion": descripcion,
      "portada": portada,
      "fechregistro": fechregistro,
      "ruta": ruta,
      "status": status,
    };
  }
}