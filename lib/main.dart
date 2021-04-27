import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_x/utils/routePath.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff2E1963),
        fontFamily: 'Grotesque',

        primarySwatch: Colors.blue,
      ),

      getPages: RouterPath.route,
      initialRoute: '/splashView',
    );
  }
}

