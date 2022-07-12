import 'package:edufoundation_app/constants/routes/route_constants.dart';
import 'package:edufoundation_app/constants/routes/router.dart';
import 'package:edufoundation_app/screens/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: splashScreen,
    home: Splash(),
    onGenerateRoute: AppRouter.generateRoute,
  ));
}
