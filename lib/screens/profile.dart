// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Update Profile")
      ),
      body: Center(
        child: Text(
          "Page under construction...",
          style: TextStyle(
            fontSize: 22,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2
          ),
        ),
      )
    );
  }
}