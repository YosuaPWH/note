import 'package:flutter/material.dart';
import 'package:note/constants/theme.dart';
import 'package:note/routes/app_routes.dart';
import 'package:note/routes/route_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: RouteNames.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}
