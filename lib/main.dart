import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:haggle_x/controllers/authentication_controller.dart';
import 'package:haggle_x/utils/graphql_config.dart';
import 'package:haggle_x/utils/routePath.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

void main() async {
  await initHiveForFlutter();
  Get.put(AuthenticationController());

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
      child: GraphQLProvider(
        client: graphQLConfiguration.client,
        child: GetMaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xff2E1963),
            fontFamily: 'Grotesque',
            primarySwatch: Colors.blue,
          ),
          getPages: RouterPath.route,
          initialRoute: '/dashboardView',
        ),
      ),
    );
  }
}

