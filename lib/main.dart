import 'package:edufoundation_app/screens/selectTimerDiff.dart';
import 'package:edufoundation_app/screens/splashScreen.dart';
import 'package:edufoundation_app/screens/subjectChapters.dart';
import 'package:flutter/material.dart';
import 'package:edufoundation_app/utils/bottomBar.dart';
import 'package:edufoundation_app/utils/routes.dart';
// import 'package:edufoundation_app/screens/physics.dart';
// import 'package:edufoundation_app/screens/biology.dart';
// import 'package:edufoundation_app/screens/chemistry.dart';
// import 'package:edufoundation_app/screens/maths.dart';
// import 'package:edufoundation_app/screens/register.dart';
// import 'package:edufoundation_app/screens/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      // '/' : (context) => MyLogin(),

      '/' : (context) => Splash(),
      // MyRoutes.register : (context) => MyRegister(),
      MyRoutes.home : (context) => BottomBar(),
      // MyRoutes.physics : (context) => Physics(),
      // MyRoutes.chemistry : (context) => Chemistry(),
      // MyRoutes.maths : (context) => Maths(),
      // MyRoutes.biology : (context) => Biology(),
      MyRoutes.subjectChapters : (context) => SubjectChapters(subjectName: ""),
      MyRoutes.selectTimerDiff : (context) => SelectTimerDiff(subjectName: "", chapterName: ""),
      // MyRoutes.physicsQuestions : (context) => Questions(subjectName: "", chapterName: "", difficulty: '', noOfQues: 0, time: 0),
      // MyRoutes.chemistryQuestions : (context) => Questions(subjectName: "", chapterName: "", difficulty: '', noOfQues: 0, time: 0),
      // MyRoutes.mathsQuestions : (context) => Questions(subjectName: "", chapterName: "", difficulty: '', noOfQues: 0, time: 0),
      // MyRoutes.biologyQuestions : (context) => Questions(subjectName: "", chapterName: "", difficulty: '', noOfQues: 0, time: 0),
    },
  ));
}