// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:farm_rice_flutter_web/class/userClass.dart';
import 'package:farm_rice_flutter_web/componentes/buttonWidget.dart';
import 'package:farm_rice_flutter_web/componentes/textWidget.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:farm_rice_flutter_web/datatable/administratorTable.dart';
import 'package:farm_rice_flutter_web/datatable/communityPage.dart';
import 'package:farm_rice_flutter_web/datatable/insumosPage.dart';
import 'package:farm_rice_flutter_web/datatable/lotsPage.dart';
import 'package:farm_rice_flutter_web/datatable/productionPage.dart';
import 'package:farm_rice_flutter_web/datatable/rolPage.dart';
import 'package:farm_rice_flutter_web/datatable/userPage.dart';
import 'package:farm_rice_flutter_web/datatable/workedPage.dart';
import 'package:farm_rice_flutter_web/vistas/login.dart';
import 'package:farm_rice_flutter_web/DontUsed/notification.dart';
import 'package:farm_rice_flutter_web/vistas/shoppingCart.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget{
  const Dashboard({Key key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>{

  Future<List<User>> _listDataUser;
  final Endpoints _endpoints = Endpoints();

  @override
  void initState() {
    _listDataUser =_endpoints.dataUser();
    super.initState();
  }

  Widget _datosUser(List<User> data){
    Widget _infor;
    for(var x in data){
      _infor = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text(x.nombre),
          Text(x.roller),
        ],
      );
    }
    return _infor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hacienda La Esperanza"),
        leading: const Image(image: AssetImage("images/rice.png")),
        leadingWidth: 35,
        backgroundColor: const Color(0xff329437),
        actions: [
          const Icon(Icons.account_circle),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FutureBuilder(
                    future: _listDataUser,
                    builder:(context, snapshot){
                      if(snapshot.hasData){
                        return _datosUser(snapshot.data);
                      }else if(snapshot.hasError){
                        return const Center(
                          child: Text("Cargando datos"),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    }
                ),
              ),
            ],
          ),
          const SizedBox(width: 30),
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const ShoppingCart()));
          }, icon: const Icon(Icons.shopping_cart)),
          const SizedBox(width: 15),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const TextString(text: "Cierre de sesion"),
                      content: const Text(
                          "¿Estas seguro de querer cerrar sesion"),
                      actions: [
                        ButtonBar(
                          children: [
                            ButtonWidget(
                                function: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) =>
                                          const LoginPage()));
                                },
                                color: Colors.redAccent,
                                width: 15,
                                height: 10,
                                circular: 5,
                                namebutton: "Cerrar"),
                            ButtonWidget(
                                function: () {
                                  Navigator.pop(context);
                                },
                                color: Colors.blue.shade600,
                                width: 15,
                                height: 10,
                                circular: 5,
                                namebutton: "No"),
                          ],
                        )
                      ],
                    ));
              },
              icon: const Icon(Icons.logout)),
          const SizedBox(width: 20),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/fondo_de_pantalla.jpg'),
              fit: BoxFit.fill),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 100, right: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => const UserPage()));
                        },
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: SizedBox(
                            height: 200,
                            width: 100,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Image.asset("images/usuario.png")
                                ),
                                const Expanded(
                                    flex: 1,
                                    child: Text("Usuario", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => const RolPage()));
                        },
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: SizedBox(
                            height: 200,
                            width: 100,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Image.asset("images/roles.png")
                                ),
                                const Expanded(
                                    flex: 1,
                                    child: Text("Roles", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => const WorkedPage()));
                        },
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: SizedBox(
                            height: 200,
                            width: 100,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Image.asset("images/trabajadores.png")
                                ),
                                const Expanded(
                                    flex: 1,
                                    child: Text("Trabajadores", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => const AdministradorPage()));
                        },
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: SizedBox(
                            height: 200,
                            width: 100,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Image.asset("images/administrator.png")
                                ),
                                const Expanded(
                                    flex: 1,
                                    child: Text("Administradores", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => const InsumosPage()));
                        },
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: SizedBox(
                            height: 200,
                            width: 100,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Image.asset("images/insumos.png")
                                ),
                                const Expanded(
                                    flex: 1,
                                    child: Text("Insumos", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => const LotsPage()));
                        },
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: SizedBox(
                            height: 200,
                            width: 100,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Image.asset("images/lotes.png")
                                ),
                                const Expanded(
                                    flex: 1,
                                    child: Text("Lotes", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => const LaboresPage()));
                        },
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: SizedBox(
                            height: 200,
                            width: 100,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Image.asset("images/labores.png")
                                ),
                                const Expanded(
                                    flex: 1,
                                    child: Text("Labores", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) => const ProductionPage()));
                        },
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: SizedBox(
                            height: 200,
                            width: 100,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Image.asset("images/produccion.png")
                                ),
                                const Expanded(
                                    flex: 1,
                                    child: Text("Produccion", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}