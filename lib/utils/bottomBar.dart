// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:edufoundation_app/screens/dashboard.dart';
import 'package:edufoundation_app/screens/examList.dart';
import 'package:edufoundation_app/screens/profile.dart';
import 'package:edufoundation_app/screens/statistics.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({ Key? key }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
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
        // backgroundColor: Colors.grey.shade200,
        backgroundColor: Colors.transparent,
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/open-book.png'),
              size: 30,
            ),
            label: 'Exam',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
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