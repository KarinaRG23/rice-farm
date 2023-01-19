import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reportes"),
        backgroundColor: const Color(0xff329437),
      ),
      body: Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}