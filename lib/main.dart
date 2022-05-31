import 'package:edufoundation_app/screens/biology.dart';
import 'package:edufoundation_app/screens/chemistry.dart';
import 'package:edufoundation_app/screens/maths.dart';
import 'package:edufoundation_app/screens/splashScreen.dart';
import 'package:edufoundation_app/screens/subjectQuestions.dart';
import 'package:flutter/material.dart';
import 'package:edufoundation_app/utils/bottomBar.dart';
import 'package:edufoundation_app/screens/login.dart';
import 'package:edufoundation_app/screens/physics.dart';
import 'package:edufoundation_app/screens/register.dart';
import 'package:edufoundation_app/utils/routes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: MyRoutes.splashScreen,
    routes: {
      // '/' : (context) => MyLogin(),
      '/' : (context) => Splash(),
      // MyRoutes.register : (context) => MyRegister(),
      MyRoutes.home : (context) => BottomBar(),
      MyRoutes.physics : (context) => Physics(),
      MyRoutes.chemistry : (context) => Chemistry(),
      MyRoutes.maths : (context) => Maths(),
      MyRoutes.biology : (context) => Biology(),
      MyRoutes.physicsQuestions : (context) => Questions(subjectName: "", chapterName: ""),
      MyRoutes.chemistryQuestions : (context) => Questions(subjectName: "", chapterName: ""),
      MyRoutes.mathsQuestions : (context) => Questions(subjectName: "", chapterName: ""),
      MyRoutes.biologyQuestions : (context) => Questions(subjectName: "", chapterName: ""),
    },
  ));
}