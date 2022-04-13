// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:edufoundation_app/screens/dashboard.dart';
import 'package:edufoundation_app/examList.dart';
import 'package:edufoundation_app/screens/profile.dart';
import 'package:edufoundation_app/screens/statistics.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  List<Widget> _selectedPage = [
    Dashboard(),
    ExamList(),
    Profile(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[100],
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            label: 'Exam',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
      body: Container(
        child: _selectedPage.elementAt(_selectedIndex)
      ),
    );
  }
}