// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/route_constants.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    /**
     * !! to use our new [AppRouter class]
     * !! 1. use the [Navigator.of(context).pushNamed(route_constant)]
     */
    Navigator.of(context).pushReplacementNamed(home);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/splash_background.png'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              width * 0.1, height * 0.25, width * 0.1, width * 0.90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                'EduFoundation',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Colors.white70,
                  letterSpacing: 1.5,
                ),
              ),
              SpinKitFadingCircle(
                color: Colors.white,
                size: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
