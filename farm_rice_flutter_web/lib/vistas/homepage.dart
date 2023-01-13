// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:farm_rice_flutter_web/componentes/buttonWidget.dart';
import 'package:farm_rice_flutter_web/componentes/listWidget.dart';
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
      drawer: const Drawer(
        backgroundColor: Color(0xff329437),
        child: ListWidget(),
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
      body: Container(
        padding: const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: const SizedBox(
                      height: 300,
                      width: 400,
                      child: Center(
                          child: CircularProgressIndicator()
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: const SizedBox(
                  height: 300,
                  width: 800,
                  child: Center(
                      child: CircularProgressIndicator()
                  ),
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
