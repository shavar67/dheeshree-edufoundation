// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../constants/route_constants.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  bool _isVisible = false;
  final _formKey = GlobalKey<FormState>();

  var email = "tony@starkindustries.com";

  showOnSuccess() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.showSuccess('Successfully logged in..');
      // await Future.delayed(Duration(seconds:1));
      // Navigator.pushReplacementNamed(context, 'home');

      //this is for debugging stage only. Above is the correct one to be used
      await Navigator.of(context).pushReplacementNamed(home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/login.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Container(
            margin: const EdgeInsets.fromLTRB(40, 50, 20, 40),
            child: const Text(
              'Welcome\nBack',
              style: TextStyle(
                color: Colors.white,
                fontSize: 56.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.45,
                left: 30,
                right: 30),
            child: Form(
              key: _formKey,
              child: Column(
                // Text fields to input email and password for signing in
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email cannot be empty";
                      } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      } else if (value.length < 8) {
                        return "Password has to be 8 characters or more";
                      }
                      return null;
                    },
                    obscureText: !_isVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                          icon: _isVisible
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility)),
                      hintText: 'Password',
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Button for sign in
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xff4c505b),
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Color(0xff4c505b),
                        radius: 30,
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () async {
                            showOnSuccess();
                          },
                          icon: Icon(Icons.arrow_forward),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Button for Sign up
                      TextButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, MyRoutes.register);
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),

                      // Button for Forget Password
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
