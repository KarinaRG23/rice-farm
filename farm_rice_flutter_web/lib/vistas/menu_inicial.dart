// ignore_for_file: avoid_unnecessary_containers

import 'package:farm_rice_flutter_web/componentes/menuItems.dart';
import 'package:flutter/material.dart';

class InicialPage extends StatefulWidget {
  const InicialPage({Key key}) : super(key: key);

  @override
  State<InicialPage> createState() => _InicialPageState();
}

class _InicialPageState extends State<InicialPage> {
  final List<String> menuItems = ["Inicio", "Usuarios", "Trabajadores", "Inventario", "Reportes", "Lotes", "Labores", "Produccion"];

  final List<IconData> menuIcons = [
    Icons.home, Icons.person_rounded, Icons.work, Icons.inventory,
    Icons.receipt, Icons.warehouse, Icons.engineering, Icons.production_quantity_limits
  ];

  double xOffset = 60;
  double yOffset = 0;
  bool sideBarOpen = false;

  int selectedMenuItem = 0;

  void setSidebarState(){
    setState(() {
      xOffset = sideBarOpen ? 260 : 60;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff259128),
        child: Container(
          child: Stack(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 25, bottom: 20),
                      child: Container(
                        color: const Color(0xff259128),
                        child: Center(
                          child: Row(
                            children:<Widget>[
                              Container(
                                padding: const EdgeInsets.all(15),
                                  child: const Icon(Icons.account_circle,size: 30,)
                              ),
                              Container(
                                child: Column(
                                  children: const <Widget>[
                                    Text("Arturo Negreiros",
                                      softWrap: true,
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                    Text("Administrador",
                                      softWrap: true,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                        child: Expanded(
                            child: ListView.builder(
                              itemCount: menuItems.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: (){
                                  sideBarOpen = false;
                                  selectedMenuItem = index;
                                  setSidebarState();
                                },
                                child: MenuItemOption(
                                  itemText: menuItems[index],
                                  itemIcon: menuIcons[index],
                                  selected: selectedMenuItem,
                                  position: index,
                                ),
                              ),
                            )
                        )
                    ),
                    Container(child: const Text("SideBar3")),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  sideBarOpen =! sideBarOpen;
                  setSidebarState();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    transform: Matrix4.translationValues(xOffset, yOffset, 1),
                    width: double.maxFinite,
                    height: double.infinity,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: const <Widget>[
                              Expanded(
                                  child: Card(
                                    elevation: 10,
                                    child: SizedBox(
                                      height: 250,
                                      width: 200,
                                      child: Center(child: Text("Canvas")),
                                    ),
                                  )
                              ),
                              Expanded(
                                  child: Card(
                                    elevation: 10,
                                    child: SizedBox(
                                      height: 250,
                                      width: 200,
                                      child: Center(child: Text("Calendar")),
                                    ),
                                  )
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
