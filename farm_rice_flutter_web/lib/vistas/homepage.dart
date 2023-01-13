// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:farm_rice_flutter_web/componentes/buttonWidget.dart';
import 'package:farm_rice_flutter_web/componentes/menuItems.dart';
import 'package:farm_rice_flutter_web/componentes/textWidget.dart';
import 'package:farm_rice_flutter_web/vistas/login.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> menuItems = ["Inicio", "Usuarios", "Trabajadores", "Inventario", "Reportes", "Lotes", "Labores", "Produccion"];

  final List<IconData> menuIcons = [
    Icons.home, Icons.person_rounded, Icons.work, Icons.inventory,
    Icons.receipt, Icons.warehouse, Icons.engineering, Icons.production_quantity_limits
  ];

  DateTime date = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  LatLng center = LatLng(-1.8618428155254074, -79.97772697324605);
  MapController? mapController;
  int selectedMenuItem = 0;
  bool sideBarOpen = false;
  PageController? pageController;

  int month = 0;

  @override
  void initState() {
    super.initState();
    print("${date.day} / $month${date.month} / ${date.year}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xff329437),
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Container(
              height: 200,
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.account_circle, size: 80),
                  SizedBox(height: 15),
                  Text("Arturo Negreiros", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("Administrador", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                  Text("__________________________", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                  SizedBox(height: 20),
                ],
              ),
            ),
            ListTile(
              title: const Text("Inicio"),
              leading: const Icon(Icons.home, size: 25),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Usuarios"),
              leading: const Icon(Icons.account_circle, size: 25),
              onTap: (){},
            ),
            ListTile(
              title: const Text("Trabajadores"),
              leading: const Icon(Icons.work, size: 25),
              onTap: (){},
            ),
            ListTile(
              title: const Text("Inventario"),
              leading: const Icon(Icons.inventory, size: 25),
              onTap: (){},
            ),
            ListTile(
              title: const Text("Reportes"),
              leading: const Icon(Icons.info_sharp, size: 25),
              onTap: (){},
            ),
            ListTile(
              title: const Text("Lotes"),
              leading: const Icon(Icons.warehouse, size: 25),
              onTap: (){},
            ),
            ListTile(
              title: const Text("Labores"),
              leading: const Icon(Icons.engineering, size: 25),
              onTap: (){},
            ),
            ListTile(
              title: const Text("Produccion"),
              leading: const Icon(Icons.production_quantity_limits_outlined, size: 25),
              onTap: (){},
            ),
          ]
        ),
      ),
      appBar: AppBar(
        title: const Text("Farm Rice"),
        backgroundColor: const Color(0xff329437),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.notifications)
          ),
          const SizedBox(width: 20),
          IconButton(
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (ctx)=> AlertDialog(
                      title: const TextString(text: "Cierre de sesion"),
                      content: const Text("¿Estas seguro de querer cerrar sesion"),
                      actions: [
                        ButtonBar(
                          children: [
                            ButtonWidget(
                                function: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const LoginPage()));
                                },
                                color: Colors.redAccent,
                                width: 15,
                                height: 10,
                                circular: 5,
                                namebutton: "Cerrar"
                            ),
                            ButtonWidget(
                                function: (){
                                  Navigator.pop(context);
                                },
                                color: Colors.blue.shade600,
                                width: 15,
                                height: 10,
                                circular: 5,
                                namebutton: "No"
                            ),
                          ],
                        )
                      ],
                    )
                );
              },
              icon: const Icon(Icons.logout)
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
