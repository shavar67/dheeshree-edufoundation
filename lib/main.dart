import 'package:edufoundation_app/screens/biology.dart';
import 'package:edufoundation_app/screens/chemistry.dart';
import 'package:edufoundation_app/screens/maths.dart';
import 'package:flutter/material.dart';
import 'package:edufoundation_app/utils/home.dart';
import 'package:edufoundation_app/screens/login.dart';
import 'package:edufoundation_app/screens/physics.dart';
import 'package:edufoundation_app/screens/register.dart';
import 'package:edufoundation_app/utils/routes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/' : (context) => MyLogin(),
      MyRoutes.register : (context) => MyRegister(),
      MyRoutes.home : (context) => Home(),
      MyRoutes.physics : (context) => Physics(),
      MyRoutes.chemistry : (context) => Chemistry(),
      MyRoutes.maths : (context) => Maths(),
      MyRoutes.biology : (context) => Biology(),
    },
  ));
}