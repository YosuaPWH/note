import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note/routes/route_names.dart';
import 'package:flutter/scheduler.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  navigateToMain(BuildContext context) async {
    Timer(
        const Duration(seconds: 3),
        () async => await Navigator.pushReplacementNamed(
            context, RouteNames.mainScreen));
  }

  @override
  Widget build(BuildContext context) {
    navigateToMain(context);
    return Scaffold(
      body: Center(child: SvgPicture.asset('assets/icons/vector.svg')),
    );
  }
}
