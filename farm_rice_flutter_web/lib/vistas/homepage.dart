// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:farm_rice_flutter_web/class/userClass.dart';
import 'package:farm_rice_flutter_web/componentes/buttonWidget.dart';
import 'package:farm_rice_flutter_web/componentes/textWidget.dart';
import 'package:farm_rice_flutter_web/conecction/endpointClass.dart';
import 'package:farm_rice_flutter_web/temporalClass/userPreferences.dart';
import 'package:farm_rice_flutter_web/vistas/communityPage.dart';
import 'package:farm_rice_flutter_web/vistas/inventoryPage.dart';
import 'package:farm_rice_flutter_web/vistas/login.dart';
import 'package:farm_rice_flutter_web/vistas/lotsPage.dart';
import 'package:farm_rice_flutter_web/vistas/productionPage.dart';
import 'package:farm_rice_flutter_web/vistas/reportPage.dart';
import 'package:farm_rice_flutter_web/vistas/userPage.dart';
import 'package:farm_rice_flutter_web/vistas/workedPage.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> menuItems = [
    "Inicio",
    "Usuarios",
    "Trabajadores",
    "Inventario",
    "Reportes",
    "Lotes",
    "Labores",
    "Produccion"
  ];

  final List<IconData> menuIcons = [
    Icons.home,
    Icons.person_rounded,
    Icons.work,
    Icons.inventory,
    Icons.receipt,
    Icons.warehouse,
    Icons.engineering,
    Icons.production_quantity_limits
  ];

  DateTime date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  LatLng center = LatLng(-1.8618428155254074, -79.97772697324605);
  late MapController mapController;
  int selectedMenuItem = 0;
  bool sideBarOpen = false;
  late PageController pageController;
  int month = 0;
  //Future<List<User>> listDataUSer;
  Endpoints point = Endpoints();
  UserPreferences preferences = UserPreferences();

  String? name ='', correo ='', rol = '';

  Future<void> getDataEmail() async{
    final e = await preferences.getEmail();
    setState(() => correo = e);
  }
  Future<void> getDataRol() async{
    final r = await preferences.getRol();
    setState(() => rol = r);
  }
  Future<void> getDataName() async{
    final n = await preferences.getName();
    setState(() => name = n);
  }

  Widget datosUser(List<User>? data) {
    late Widget mostrar;
    for (var x in data!) {
      mostrar = SizedBox(
        height: 200,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle, size: 80),
            const SizedBox(height: 15),
            Text('${x.nombre}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('${x.roller}',
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal)),
            Text('${x.correo}',
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal)),
            const Text("__________________________",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
            const SizedBox(height: 20),
          ],
        ),
      );
    }
    return mostrar;
  }

  @override
  void initState() {
    super.initState();
    //listDataUSer = point.dataUser();
    getDataName();
    getDataRol();
    getDataEmail();
    //print("${date.day} / $month${date.month} / ${date.year}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          backgroundColor: const Color(0xff329437),
          child: ListView(padding: const EdgeInsets.all(0), children: [
            /*FutureBuilder<List<User>>(
                future: listDataUSer,
                builder: (ctx, snapshot) {
                  if (snapshot.hasData) {
                    return datosUser(snapshot.data);
                  } else if (snapshot.hasError) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return const Center(child: CircularProgressIndicator());
                }),*/
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.account_circle, size: 80),
                  const SizedBox(height: 15),
                  Text('$name',
                      style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('$rol',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal)),
                  Text('$correo',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal)),
                  const Text("__________________________",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            ListTile(
              title: const Text("Inicio"),
              leading: const Icon(Icons.home, size: 25),
              onTap: () {
                Navigator.pop(context, (ctx) => const HomePage());
              },
            ),
            ListTile(
              title: const Text("Usuarios"),
              leading: const Icon(Icons.account_circle, size: 25),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const UserPage()));
              },
            ),
            ListTile(
              title: const Text("Trabajadores"),
              leading: const Icon(Icons.work, size: 25),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const WorkedPage()));
              },
            ),
            ListTile(
              title: const Text("Inventario"),
              leading: const Icon(Icons.inventory, size: 25),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const InventoryPage()));
              },
            ),
            ListTile(
              title: const Text("Reportes"),
              leading: const Icon(Icons.info_sharp, size: 25),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const ReportPage()));
              },
            ),
            ListTile(
              title: const Text("Lotes"),
              leading: const Icon(Icons.warehouse, size: 25),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const LotsPage()));
              },
            ),
            ListTile(
              title: const Text("Labores"),
              leading: const Icon(Icons.engineering, size: 25),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const CommunityPage()));
              },
            ),
            ListTile(
              title: const Text("Produccion"),
              leading: const Icon(Icons.production_quantity_limits_outlined,
                  size: 25),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => const ProductionPage()));
              },
            ),
          ])),
      appBar: AppBar(
        title: const Text("Farm Rice"),
        backgroundColor: const Color(0xff329437),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          const SizedBox(width: 20),
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
        padding:
            const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: const SizedBox(
                      height: 300,
                      width: 400,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: const SizedBox(
                      height: 300,
                      width: 400,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: const SizedBox(
                  height: 300,
                  width: 800,
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
