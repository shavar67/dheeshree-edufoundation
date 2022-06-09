import 'package:flutter/material.dart';

class ExamList extends StatelessWidget {
  const ExamList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        height: 200,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              height: 150,
              width: 150,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                  Spacer(flex: 2,),
                  Text(
                    "Engineering",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[800],
                      letterSpacing: 1.3
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 15,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              height: 150,
              width: 150,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                  Spacer(flex: 2,),
                  Text(
                    "Medical",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[800],
                      letterSpacing: 1.3
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              height: 150,
              width: 150,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                  Spacer(flex: 2,),
                  Text(
                    "Others",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[800],
                      letterSpacing: 1.3
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 15,),
          ],
        ),
      ),
    );
  }
}