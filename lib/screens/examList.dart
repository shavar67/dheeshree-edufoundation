import 'package:flutter/material.dart';

class ExamList extends StatefulWidget {
  const ExamList({ Key? key }) : super(key: key);

  @override
  State<ExamList> createState() => _ExamListState();
}

class _ExamListState extends State<ExamList> {
  bool showEngList = true;
  bool showMedicalList = false;
  bool showOtherList = false;

  Widget engineeringExamList(){
    List engExams = ["JEE Main", "JEE Advanced", "WBJEE"];
    return Container(
      height: 500,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: engExams.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(252, 66, 65, 66),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 2.0, //extend the shadow
                  offset: Offset(
                    1.0, // Move to right 10  horizontally
                    1.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(
              engExams[index],
              style: TextStyle(
                fontSize: 18.0,
                color: Color.fromARGB(255, 248, 245, 245),
              ),
            ),
          ); 
        }
      ),
    );
  }
  
  Widget medicalExamList(){
    List medicalExams = ["NEET", "JIPMER", "AIIMS"];
    return Container(
      height: 500,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: medicalExams.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(252, 66, 65, 66),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 2.0, //extend the shadow
                  offset: Offset(
                    1.0, // Move to right 10  horizontally
                    1.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(
              medicalExams[index],
              style: TextStyle(
                fontSize: 18.0,
                color: Color.fromARGB(255, 248, 245, 245),
              ),
            ),
          ); 
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: [
                    InkWell(
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: (){
                        setState((){
                          showEngList = true;
                          showMedicalList = false;
                          showOtherList = false;
                        });
                        build(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        height: 100,
                        width: 120,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: Icon(
                                Icons.person,
                              ),
                            ),
                            SizedBox(height: 10,),
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
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: (){
                        setState((){
                          showEngList = false;
                          showMedicalList = true;
                          showOtherList = false;
                        });
                        build(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        height: 100,
                        width: 120,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: Icon(
                                Icons.person,
                              ),
                            ),
                            SizedBox(height: 10,),
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
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: (){
                        setState((){
                          showEngList = false;
                          showMedicalList = false;
                          showOtherList = true;
                        });
                        build(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        height: 100,
                        width: 120,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: Icon(
                                Icons.person,
                              ),
                            ),
                            SizedBox(height: 10,),
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
                    ),
                  ],
                ),
              ),
              
              showEngList ? engineeringExamList() : Container(),
              showMedicalList ? medicalExamList() : Container(),
              showOtherList ? Text("Other List") : Container(),
            ],
          ),
        ),
      ),
    );
  }
}