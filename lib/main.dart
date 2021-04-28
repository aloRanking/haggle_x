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
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null)
          FocusManager.instance.primaryFocus.unfocus();
      },
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff2E1963),
          fontFamily: 'Grotesque',

          primarySwatch: Colors.blue,
        ),

        getPages: RouterPath.route,
        initialRoute: '/dashboardView',
      ),
    );
  }
}

