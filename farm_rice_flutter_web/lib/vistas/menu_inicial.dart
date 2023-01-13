// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:farm_rice_flutter_web/componentes/menuItems.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class InicialPage extends StatefulWidget {
  const InicialPage({Key? key}) : super(key: key);

  @override
  State<InicialPage> createState() => _InicialPageState();
}

class _InicialPageState extends State<InicialPage> {
  final List<String> menuItems = ["Inicio", "Usuarios", "Trabajadores", "Inventario", "Reportes", "Lotes", "Labores", "Produccion"];

  final List<IconData> menuIcons = [
    Icons.home, Icons.person_rounded, Icons.work, Icons.inventory,
    Icons.receipt, Icons.warehouse, Icons.engineering, Icons.production_quantity_limits
  ];

  DateTime date = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);


  double xOffset = 60;
  double yOffset = 0;
  LatLng center = LatLng(-1.8618428155254074, -79.97772697324605);
  MapController? mapController;

  bool sideBarOpen = false;
  int selectedMenuItem = 0;

  int month = 0;

  void setSidebarState(){
    setState(() {
      xOffset = sideBarOpen ? 250 : 60;
    });
  }


  @override
  void initState() {
    print("${date.day} / $month"+"${date.month} / ${date.year}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff259128),
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
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
                                  sideBarOpen =! sideBarOpen;
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
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  sideBarOpen = false;
                  setSidebarState();
                },
                child: AnimatedContainer(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 200),
                  transform: Matrix4.translationValues(xOffset, yOffset, 1),
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 20, right: 5, left: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Card(
                              elevation: 5,
                              child: SizedBox(
                                height: 250,
                                width: 500,
                                child: Container(
                                    child: SfCartesianChart(
                                        primaryXAxis: CategoryAxis(),
                                        series: <ChartSeries<ChartData, String>>[
                                          BarSeries<ChartData, String>(
                                              dataSource: <ChartData>[
                                                ChartData('Goldin Finance 117', 597),
                                                ChartData('Ping An Finance Center', 599),
                                                ChartData('Makkah Clock Royal Tower', 601),
                                                ChartData('Shanghai Tower', 632),
                                                ChartData('Burj Khalifa', 828)],
                                              xValueMapper: (ChartData data, _) => data.x,
                                              yValueMapper: (ChartData data, _) => data.y
                                          ),
                                        ]
                                    )
                                ),
                              ),
                            ),
                            Card(
                              elevation: 5,
                              child: SizedBox(
                                height: 250,
                                width: 500,
                                child: DatePickerDialog(
                                    initialDate: date,
                                    firstDate: date,
                                    lastDate: date,
                                  initialCalendarMode: DatePickerMode.day,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 350,
                        width: 600,
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Card(
                          elevation: 5,
                          child: SizedBox(
                            child: Image.asset("images/img.png"),
                          ),
                        ),
                      )
                    ],
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

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
