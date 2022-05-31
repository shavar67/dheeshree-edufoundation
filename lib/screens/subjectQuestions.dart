// ignore_for_file: no_logic_in_create_state

import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:edufoundation_app/constants/databaseLinks.dart';
import 'package:edufoundation_app/services/apiCall.dart';
import 'package:edufoundation_app/utils/questions.dart';
import 'package:edufoundation_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Questions extends StatefulWidget {
  final String subjectName;
  
  final String chapterName;

  const Questions({ Key? key, required this.subjectName, required this.chapterName }) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState(
    subjectName: subjectName, 
    chapterName: chapterName
  );
}

class _QuestionsState extends State<Questions> {

  String subjectName;
  String chapterName;
  _QuestionsState({required this.subjectName, required this.chapterName});

  Duration duration = Duration(seconds: 1200);
  Timer? timer;
  @override
  void initState(){
    super.initState();
    // showStartDialog();
    print(subjectName + chapterName);
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  reduceTime(){
    final reduceSeconds = 1;

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

  showStartDialog(){
    return AlertDialog(
          title: Text("Do you want to start the practice?"),
          actions: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                foregroundColor: MaterialStateProperty.all(Colors.white)
              ),
              onPressed: () => Navigator.pop(context, 'Start'),
              child: Text('Start')
            )
          ],
        );
    // showDialog(
    //   context: context,
    //   builder: (context) => BackdropFilter(
    //     filter: ImageFilter.blur(
    //       sigmaX: 10,
    //       sigmaY: 10
    //     ),
    //     child: AlertDialog(
    //       title: Text("Do you want to start the practice?"),
    //       actions: [
    //         TextButton(
    //           style: ButtonStyle(
    //             backgroundColor: MaterialStateProperty.all(Colors.green),
    //             foregroundColor: MaterialStateProperty.all(Colors.white)
    //           ),
    //           onPressed: () => Navigator.pop(context, 'Start'),
    //           child: Text('Start')
    //         )
    //       ],
    //     ),
    //   )
    //   // builder: (context) => AlertDialog(
    //   //   content: Container(
    //   //     padding: EdgeInsets.symmetric(horizontal: height * 0.05, vertical: width * 0.6),
    //   //     child: Column(
    //   //       children: [
    //   //         Text(
    //   //           "Do you want to start the test?",
    //   //           textAlign: TextAlign.center,
    //   //           style: TextStyle(
    //   //             fontSize: 26.0,
    //   //             color: Colors.grey.shade700,
    //   //           ),
    //   //         ),
    //   //         SizedBox(height: 50,),
    //   //         ElevatedButton(
    //   //           style: ButtonStyle(
    //   //             backgroundColor: MaterialStateProperty.all(Colors.green)
    //   //           ),
    //   //           onPressed: (){
    //   //             Navigator.pop(context);
    //   //           }, 
    //   //           child: Text('Start')
    //   //         )
    //   //       ],
    //   //     ),
    //   //   ),
    //   // )
    // );
  }


  bool showHint = false;
  bool showAnswer = false;

  ApiCall ac = ApiCall();

  // Future<List<Question>> getQuestions(String subjectName, String chapterName) async {
         
  //   // const String url = questionLink;
  //     var response = await http.get(Uri.parse("https://edu-foundation-bnqyscf9q-kudos-dot-com.vercel.app/api/question/getchapter/$subjectName/$chapterName?page=1&limit=10"));
  //     var responseBody = json.decode(response.body);
  //     var responseQuestions = responseBody['result'];
  //     List<Question> questions = [];
  //     for(var question in responseQuestions){
  //       Question q = Question(question['question'], question['option1'], question['option2'], 
  //         question['option3'], question['option4'], question['correct_answer'], question['hints']);
  //       questions.add(q);
  //     }
  //   return questions;  
  // }

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
  
  @override
  Widget build(BuildContext context) {
    // var arg = ModalRoute.of(context)!.settings.arguments as Map;
    // String subject = arg['subject'];
    // String ch = arg['chapter'];
    bool showRightWrong = false;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          chapterName,
          
        ),
        // centerTitle: true,
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
          // future: getQuestions(subject, ch),
          future: ac.getQuestions(subjectName, chapterName),
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