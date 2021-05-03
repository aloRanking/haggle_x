import 'package:get/get.dart';
import 'package:haggle_x/screen/country_screen.dart';
import 'package:haggle_x/screen/dashboard_screen.dart';
import 'package:haggle_x/screen/login_screen.dart';
import 'package:haggle_x/screen/register_screen.dart';
import 'package:haggle_x/screen/setup_screen.dart';
import 'package:haggle_x/screen/splash_screen.dart';
import 'package:haggle_x/screen/verify_screen.dart';

class RouterPath {
  static final route = [
    GetPage(
      name: '/splashView',
      page: () => SplashScreen(),

    ),
    GetPage(
      name: '/loginView',
      page: () => LoginScreen(),

    ),
    GetPage(
      name: '/registerView',
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: '/verifyView',
      page: () => VerifyScreen(),
    ),
    GetPage(
      name: '/setupView',
      page: () => SetupScreen(),
    ),
    GetPage(
      name: '/dashboardView',
      page: () => DashboardScreen(),
    ),
    GetPage(
      name: '/countryView',
      page: () => CountrySelectionScreen(),
    ),
  ];
}