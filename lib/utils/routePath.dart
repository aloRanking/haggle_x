import 'package:get/get.dart';
import 'package:haggle_x/screen/splash_screen.dart';

class RouterPath {
  static final route = [
    GetPage(
      name: '/splashView',
      page: () => SplashScreen(),
    ),
   /* GetPage(
      name: '/dashboardView',
      page: () => DashboardScreen(),
    ),
    GetPage(
      name: '/loginView',
      page: () => LoginScreen(),
    ),
    GetPage(
      name: '/registerView',
      page: () => RegisterScreen(),
    ),*/
  ];
}