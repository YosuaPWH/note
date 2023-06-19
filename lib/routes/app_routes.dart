import 'package:note/routes/route_names.dart';
import 'package:note/screens/input_screen.dart';
import 'package:note/screens/main_screen.dart';
import 'package:note/screens/splash_screen.dart';

class AppRoutes {
  static final routes = {
    RouteNames.splashScreen: (context) => const SplashScreen(),
    RouteNames.mainScreen: (context) => const MainScreen(),
    RouteNames.inputScreen: (context) => const InputScreen()
  };
}
