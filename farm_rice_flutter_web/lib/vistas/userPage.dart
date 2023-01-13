// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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

      body: Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}