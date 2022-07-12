import 'package:flutter/material.dart';

import '../../screens/splashScreen.dart';
import '../../utils/bottomBar.dart';
import '../route_constants.dart';

///
/// !! FOLLOW THIS TEMPLATE TO UPDATE YOUR ROUTES
///  * *  whenever you want to declare a new route,
///  * * do the following below.
///  !! 1. create a route constant in the new [route_constant.dart] file
///  !! 2. do not use static variables
///  !! 3. using the new route constant,
///  !! 4. create a new switch case
///  !! 5. return a material route and have that return your desired screen
///  !!
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const BottomBar());

      default:
        return MaterialPageRoute(builder: (_) => const Splash());
    }
  }
}
