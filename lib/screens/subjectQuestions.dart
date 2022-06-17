// ignore_for_file: no_logic_in_create_state

import 'dart:async';
import 'package:edufoundation_app/services/apiCall.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Questions extends StatefulWidget {
  final String subjectName;
  
  final String chapterName;

  final String difficulty;

  final int time;

  final int noOfQues;

  const Questions({ Key? key, required this.subjectName, required this.chapterName, required this.difficulty, required this.time, required this.noOfQues }) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState(
    subjectName: subjectName, 
    chapterName: chapterName,
    time: time,
    noOfQues: noOfQues,
    difficulty: difficulty
  );
}

class _QuestionsState extends State<Questions> {

  String subjectName;
  String chapterName;
  int time;
  int noOfQues;
  String difficulty;

  _QuestionsState({required this.subjectName, required this.chapterName, 
  required this.difficulty, required this.time, required this.noOfQues});

  late Duration duration = Duration(seconds: time*60);

  Timer? timer;
  @override
  void initState(){
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  reduceTime(){
    const reduceSeconds = 1;

    setState((){
      final seconds = duration.inSeconds - reduceSeconds;

      duration = Duration(seconds: seconds);
    });
    
    if(duration.inSeconds == 0){
      Fluttertoast.showToast(  
        msg: 'Practice Session Completed',  
        toastLength: Toast.LENGTH_SHORT,  
        gravity: ToastGravity.BOTTOM,  
        backgroundColor: Colors.lightGreen,  
        textColor: Colors.white  
      );  
      Navigator.pop(context);
    }
  }

  startTimer(){
    timer = Timer.periodic(Duration(seconds: 1), (_) => reduceTime());
  }

  Widget showTimer(){
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours.remainder(60));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Text(
      "$hours:$minutes:$seconds",
      style: TextStyle(
        fontSize: 20.0,
        letterSpacing: 1.2
      ),
    );
  }
  
  bool showHint = false;
  bool showAnswer = false;

  ApiCall ac = ApiCall();

  @override
  Widget build(BuildContext context) {
    int level;

    (difficulty.toLowerCase() == "easy") ? level = 1 : ((difficulty.toLowerCase() == "medium") ? level = 2 : level = 3);

    bool showRightWrong = false;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          chapterName,
          
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: showTimer()
            )
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        color: Colors.white70,
        child: FutureBuilder(
          future: ac.getQuestions(subjectName, chapterName, noOfQues, level),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              return Center(
                child: Text("Loading Questions..."),
              );
            }
            else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    padding: EdgeInsets.all(22.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[850],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${index+1}. ${snapshot.data[index].ques}",
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),  
                        ),
                        SizedBox(height: 15.0,),
                        TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                          ),
                          onPressed: (){
                            
                          },
                          child: Text(
                              "a. ${snapshot.data[index].op1}",
                              style: TextStyle(
                                color: Colors.grey[200],
                                fontSize: 16.0,
                              ),
                          ),
                        ),
                        
                        TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero)
                          ),
                          onPressed: (){
                            
                          },
                          child: Text(
                              "b. ${snapshot.data[index].op2}",
                              style: TextStyle(
                                color: Colors.grey[200],
                                fontSize: 16.0,
                              ),
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero)
                          ),
                          onPressed: (){
                            
                          },
                          child: Text(
                              "c. ${snapshot.data[index].op3}",
                              style: TextStyle(
                                color: Colors.grey[200],
                                fontSize: 16.0,
                              ),
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero)
                          ),
                          onPressed: (){
                            
                          },
                          child: Text(
                              "d. ${snapshot.data[index].op4}",
                              style: TextStyle(
                                color: Colors.grey[200],
                                fontSize: 16.0,
                              ),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        //Add expansion panel to hint text and show answer
                        InkWell(
                          onTap: (){
                            setState(() {
                              showHint = !showHint;
                            });
                          },
                          child: Text(
                            "Hint Text",
                            style: TextStyle(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0,),
                        showHint?Text(
                          "${snapshot.data[index].hint}",
                          style: TextStyle(
                            color: Colors.grey.shade200,
                          ),
                        ):Text(""),
                        SizedBox(height: 12.0,),
                        InkWell(
                          onTap: (){
                            setState(() {
                              showAnswer = !showAnswer;
                            });
                          },
                          child: Text(
                            "Show Answer",
                            style: TextStyle(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0,),
                        showAnswer?Text(
                          "${snapshot.data[index].correctAns}",
                          style: TextStyle(
                            color: Colors.grey.shade200,
                          ),
                        ):Text(""),
                      ],
                    ),
                  );
                },
              );
            }
          }
        ),
      ) 
    );
  }
}