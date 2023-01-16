// ignore_for_file: file_names
import 'package:farm_rice_flutter_web/class/classUserTable.dart';
import 'package:farm_rice_flutter_web/componentes/dataTable.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late Future<List<UserTable>?> _listTable;
  Endpoints endpoints = Endpoints();
  List itemRolOpen = ['Administrador','Trabajador', 'Usuario'];
  List itemEstadoOpen = ['Activo','Inactivo'];

  @override
  void initState() {
    super.initState();
    _listTable = endpoints.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuarios"),
        backgroundColor: const Color(0xff329437),
      ),

        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*0.03,
                right: 15, left: 15, bottom: 40),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  child: FutureBuilder<List<UserTable>?>(
                      future: _listTable,
                      builder: ((context, snapshot) {
                        if(snapshot.hasData){
                          return PaginatedDataTable(
                            columns: const [
                              DataColumn(label: Text("Cedula")),
                              DataColumn(label: Text("Nombres")),
                              DataColumn(label: Text("Apellidos")),
                              DataColumn(label: Text("Telf")),
                              DataColumn(label: Text("Email")),
                              DataColumn(label: Text("Lugar")),
                              DataColumn(label: Text("Direccion")),
                              DataColumn(label: Text("Rol")),
                              DataColumn(label: Text("Estado")),
                            ],
                            source: resourceData(snapshot.data??[]),
                          );
                        }
                        else if(snapshot.hasError){
                          return const Center(child: CircularProgressIndicator());
                        }
                        return const Center(child: CircularProgressIndicator());
                      })
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          scrollable: true,
                          title: const Text("REGISTRAR USUARIO",
                              textAlign: TextAlign.center, style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)),
                          content: SizedBox(
                            height: 780,
                            width: 375,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.card_membership_rounded),
                                    hintText: 'Cedula',
                                    contentPadding: EdgeInsets.all(24),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black, width: 3), borderRadius: BorderRadius.all(Radius.circular(10))),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                const TextField(
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.perm_identity_rounded),
                                    hintText: 'Nombres',
                                    contentPadding: EdgeInsets.all(24),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black, width: 3), borderRadius: BorderRadius.all(Radius.circular(10))),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                const TextField(
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.perm_identity_rounded),
                                    hintText: 'Apellidos',
                                    contentPadding: EdgeInsets.all(24),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black, width: 3), borderRadius: BorderRadius.all(Radius.circular(10))),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                const TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.mobile_friendly_rounded),
                                    hintText: 'Telefono',
                                    contentPadding: EdgeInsets.all(24),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black, width: 3), borderRadius: BorderRadius.all(Radius.circular(10))),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                const TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.email_rounded),
                                    hintText: 'Email',
                                    contentPadding: EdgeInsets.all(24),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black, width: 3), borderRadius: BorderRadius.all(Radius.circular(10))),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                const TextField(
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.location_on_rounded),
                                    hintText: 'Lugar',
                                    contentPadding: EdgeInsets.all(24),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black, width: 3), borderRadius: BorderRadius.all(Radius.circular(10))),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                const TextField(
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.location_on_rounded),
                                    hintText: 'Dirección',
                                    contentPadding: EdgeInsets.all(24),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black, width: 3), borderRadius: BorderRadius.all(Radius.circular(10))),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                DropdownButton(
                                  hint: const Text("Seleccione el Rol: "),
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 35,
                                  isExpanded: true,
                                  underline: Container(),
                                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                                  onChanged: (value){
                                    setState((){
                                    });
                                  },
                                  items: itemRolOpen.map((valueItem){
                                    return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem)
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(height: 15),
                                DropdownButton(
                                  hint: const Text("Seleccione el Estado: "),
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: 35,
                                  isExpanded: true,
                                  underline: Container(),
                                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                                  onChanged: (value){
                                    setState((){
                                    });
                                  },
                                  items: itemEstadoOpen.map((valueItem){
                                    return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem)
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(height: 15),
                                Container(
                                  padding: const EdgeInsets.only(left: 10, top: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("GUARDAR", style: TextStyle(fontSize: 33, fontWeight: FontWeight.w700, color: Colors.green)),
                                      ElevatedButton.icon(
                                        onPressed: (){},
                                        icon: const Icon(Icons.save_rounded, size: 50),
                                        label:const Text(""),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.green,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                                            padding: const EdgeInsets.all(8)
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        primary: Colors.green),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                      child: const Text(
                        'AÑADIR USUARIO',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight:
                            FontWeight.bold,
                            color: Colors.white),
                      ),
                    ))
              ],
            ),
          ),
        )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}