import 'package:edufoundation_app/screens/subjectQuestions.dart';
import 'package:flutter/material.dart';

class SelectTimerDiff extends StatefulWidget {
  final String subjectName;
  final String chapterName;

  const SelectTimerDiff({Key? key, required this.subjectName, required this.chapterName}):super(key: key);

  @override
  State<SelectTimerDiff> createState() => _SelectTimerDiffState(
    subjectName: subjectName,
    chapterName: chapterName
  );
}

class _SelectTimerDiffState extends State<SelectTimerDiff> {
  String subjectName;
  String chapterName;
  _SelectTimerDiffState({required this.subjectName, required this.chapterName});

  final _formKey = GlobalKey<FormState>();
  int time = 0;
  int noOfQues = 0;
  String difficulty = "";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10, height*0.2, 10, 20),
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Timer : ',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        time = 10;
                      });
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.green),
                      backgroundColor:  MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.green,
                            width: 2
                          ),
                        ),
                      )
                    ), 
                    child: Text(
                      '10 mins',
                    ),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        time = 15;
                      });
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.green),
                      backgroundColor:  MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.green,
                            width: 2
                          ),
                        ),
                      )
                    ), 
                    child: Text(
                      '15 mins',
                    ),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        time = 20;
                      });
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.green),
                      backgroundColor:  MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.green,
                            width: 2
                          ),
                        ),
                      )
                    ), 
                    child: Text(
                      '20 mins',
                    ),
                  ),
                ]
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [  
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        time = 25;
                      });
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.green),
                      backgroundColor:  MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.green,
                            width: 2
                          ),
                        ),
                      )
                    ), 
                    child: Text(
                      '25 mins',
                    ),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        time = 30;
                      });
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.green),
                      backgroundColor:  MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.green,
                            width: 2
                          ),
                        ),
                      )
                    ), 
                    child: Text(
                      '30 mins',
                    ),
                  )
                ],
              ),
              SizedBox(height: 40,),
              Text(
                'Number of Questions : ',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      setState((){
                        noOfQues = 10;
                      });
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.green),
                      backgroundColor:  MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.green,
                            width: 2
                          ),
                        ),
                      )
                    ), 
                    child: Text(
                      '10 ques',
                    ),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: (){
                      setState((){
                        noOfQues = 20;
                      });
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.green),
                      backgroundColor:  MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.green,
                            width: 2
                          ),
                        ),
                      )
                    ), 
                    child: Text(
                      '20 ques',
                    ),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: (){
                      setState((){
                        noOfQues = 30;
                      });
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.green),
                      backgroundColor:  MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.green,
                            width: 2
                          ),
                        ),
                      )
                    ), 
                    child: Text(
                      '30 ques',
                    ),
                  ),
                ]
              ),
              SizedBox(height: 40,),
              Text(
                'Difficulty : ',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 18,
                ),
              ),
              
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        difficulty = "Easy";
                      });
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.green),
                      backgroundColor:  MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.green,
                            width: 2
                          ),
                        ),
                      )
                    ), 
                    child: Text(
                      'Easy',
                    ),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        difficulty= "Medium";
                      });
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.green),
                      backgroundColor:  MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.green,
                            width: 2
                          ),
                        ),
                      )
                    ), 
                    child: Text(
                      'Medium',
                    ),
                  ),
                  SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        difficulty = "Hard";
                      });
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.green),
                      backgroundColor:  MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.green,
                            width: 2
                          ),
                        ),
                      )
                    ), 
                    child: Text(
                      'Hard',
                    ),
                  ),
                ]
              ),
              SizedBox(height: 40,),
              Text(
                'Duration of practice : $time',
              ),
              
              SizedBox(height: 20,),
              Text(
                'Number of Questions to attend : $noOfQues',
              ),

              SizedBox(height: 20,),
              Text(
                'Difficulty of Questions : $difficulty',
              ),
              Spacer(),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Questions(
                          subjectName: subjectName,
                          chapterName: chapterName,
                          time: time,
                          noOfQues: noOfQues,
                          difficulty: difficulty,
                        ),),);
                  }, 
                child: Text(
                  'Start Practice',
        
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}