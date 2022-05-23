import 'package:flutter/material.dart';
import 'package:edufoundation_app/utils/routes.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, MyRoutes.physics);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.pink[800],
                    ),
                    height: 175,
                    width: 125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage('assets/physics_icon.png'),
                          color: Colors.white,
                          size: 80,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Physics",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, MyRoutes.chemistry);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red[800],
                    ),
                    height: 175,
                    width: 125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage('assets/chemistry_icon.png'),
                          color: Colors.white,
                          size: 80,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Chemistry",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, MyRoutes.maths);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[800],
                    ),
                    height: 175,
                    width: 125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage('assets/maths_icon.png'),
                          color: Colors.white,
                          size: 80,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Maths",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, MyRoutes.biology);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green[800],
                    ),
                    height: 175,
                    width: 125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage('assets/bio_icon.png'),
                          color: Colors.white,
                          size: 80,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Biology",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}