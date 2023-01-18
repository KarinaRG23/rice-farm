import 'package:farm_rice_flutter_web/vistas/homepage.dart';
import 'package:flutter/material.dart';
import '../../../../IdeaProjects/farm_rice_web_flutter/lib/splash/splashBeforeLogin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}

