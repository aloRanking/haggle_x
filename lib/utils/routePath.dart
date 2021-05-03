import 'package:get/get.dart';
import 'package:haggle_x/screen/country_screen.dart';
import 'package:haggle_x/screen/haggle_screen.dart';
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
      transition: Transition.downToUp),
    GetPage(
      name: '/registerView',
      page: () => RegisterScreen(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
      name: '/verifyView',
      page: () => VerifyScreen(),
    ),
    GetPage(
      name: '/setupView',
      page: () => SetupScreen(),
    ),
    GetPage(
      name: '/haggleView',
      page: () => HaggleScreen(),
      transition: Transition.zoom,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: '/countryView',
      page: () => CountrySelectionScreen(),
    ),
  ];
}