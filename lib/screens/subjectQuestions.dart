// ignore_for_file: no_logic_in_create_state, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:edufoundation_app/services/apiCall.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  final String subjectName;

  final String chapterName;

  final String difficulty;

  final int time;

  final int noOfQues;

  const Questions(
      {Key? key,
      required this.subjectName,
      required this.chapterName,
      required this.difficulty,
      required this.time,
      required this.noOfQues})
      : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState(
      subjectName: subjectName,
      chapterName: chapterName,
      time: time,
      noOfQues: noOfQues,
      difficulty: difficulty);
}

class _QuestionsState extends State<Questions> {
  String subjectName;
  String chapterName;
  int time;
  int noOfQues;
  String difficulty;

  _QuestionsState(
      {required this.subjectName,
      required this.chapterName,
      required this.difficulty,
      required this.time,
      required this.noOfQues});

  late Duration duration = Duration(seconds: time * 60);

  Timer? timer;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  // void getQ() async {
  //   List<Question> questionsList = [];
  //   questionsList = await ac.getQuestions(subjectName, chapterName, noOfQues, difficulty);
  //   print(questionsList);
  // }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  reduceTime() {
    const reduceSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds - reduceSeconds;

      duration = Duration(seconds: seconds);
    });

    if (duration.inSeconds == 0) {
      Navigator.pop(context);
    }
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => reduceTime());
  }

  Widget showTimer() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours.remainder(60));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Text(
      "$hours:$minutes:$seconds",
      style: TextStyle(fontSize: 20.0, letterSpacing: 1.2),
    );
  }

  ApiCall ac = ApiCall();

  bool showHint = false;
  bool showAnswer = false;
  bool answerTapped = false;
  bool showRightWrong = false;

  int quesIndex = 0;

  void prevQuestion() {
    setState(() {
      quesIndex--;
    });
  }

  void nextQuestion() {
    setState(() {
      quesIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            chapterName,
          ),
          actions: [
            Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: showTimer())),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          color: Colors.white70,
          child: FutureBuilder(
              future: ac.getQuestions(
                  subjectName, chapterName, noOfQues, difficulty),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: Text("Loading Questions..."),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
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
                              "${index + 1}. ${snapshot.data[index].ques}",
                              style: TextStyle(
                                color: Colors.grey[200],
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextButton(
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                              ),
                              onPressed: () {},
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
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero)),
                              onPressed: () {},
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
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero)),
                              onPressed: () {},
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
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero)),
                              onPressed: () {},
                              child: Text(
                                "d. ${snapshot.data[index].op4}",
                                style: TextStyle(
                                  color: Colors.grey[200],
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            //Add expansion panel to hint text and show answer
                            InkWell(
                              onTap: () {
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
                            SizedBox(
                              height: 12.0,
                            ),
                            showHint
                                ? Text(
                                    "${snapshot.data[index].hint}",
                                    style: TextStyle(
                                      color: Colors.grey.shade200,
                                    ),
                                  )
                                : Text(""),
                            SizedBox(
                              height: 12.0,
                            ),
                            InkWell(
                              onTap: () {
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
                            SizedBox(
                              height: 12.0,
                            ),
                            showAnswer
                                ? Text(
                                    "${snapshot.data[index].correctAns}",
                                    style: TextStyle(
                                      color: Colors.grey.shade200,
                                    ),
                                  )
                                : Text(""),
                          ],
                        ),
                      );
                    },
                  );
                }
              }),
        )

        //UI to display for questions
        // body: Container(
        //   color: Colors.white,
        //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children: [
        //       Text(
        //         "Question ${quesIndex+1}.",
        //         style: TextStyle(
        //           color: Color.fromARGB(255, 22, 22, 22),
        //           letterSpacing: 1.2,
        //           fontSize: 20,
        //           fontWeight: FontWeight.w500
        //         ),
        //       ),
        //       SizedBox(height: 15,),
        //       Text(
        //         "${_questions[quesIndex]['ques']}",
        //         style: TextStyle(
        //           color: Colors.black,
        //           letterSpacing: 1.2,
        //           fontSize: 18,
        //           fontWeight: FontWeight.w400,
        //         ),
        //       ),
        //       SizedBox(height: 20),
        //       ElevatedButton(
        //         onPressed: (){},
        //         style: ButtonStyle(
        //           backgroundColor: answerTapped ? (showRightWrong ? MaterialStateProperty.all(Colors.green) : MaterialStateProperty.all(Colors.red) ) : MaterialStateProperty.all(Color.fromARGB(255, 231, 229, 229)),
        //           foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 22, 22, 22))
        //         ),
        //         child: Text(
        //           "a. ${_questions[quesIndex]['op1']}"
        //         ),
        //       ),
        //       ElevatedButton(
        //         onPressed: (){},
        //         style: ButtonStyle(
        //           backgroundColor: answerTapped ? (showRightWrong ? MaterialStateProperty.all(Colors.green) : MaterialStateProperty.all(Colors.red) ) : MaterialStateProperty.all(Color.fromARGB(255, 231, 229, 229)),
        //           foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 22, 22, 22))
        //         ),
        //         child: Text(
        //           "b. ${_questions[quesIndex]['op2']}"
        //         ),
        //       ),
        //       ElevatedButton(
        //         onPressed: (){
        //           answerTapped = true;
        //         },
        //         style: ButtonStyle(
        //           backgroundColor: answerTapped ? (showRightWrong ? MaterialStateProperty.all(Colors.green) : MaterialStateProperty.all(Colors.red) ) : MaterialStateProperty.all(Color.fromARGB(255, 231, 229, 229)),
        //           foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 22, 22, 22))
        //         ),
        //         child: Text(
        //           "c. ${_questions[quesIndex]['op3']}"
        //         ),
        //       ),
        //       ElevatedButton(
        //         onPressed: (){
        //           answerTapped = true;
        //         },
        //         style: ButtonStyle(
        //           backgroundColor: answerTapped ? (showRightWrong ? MaterialStateProperty.all(Colors.green) : MaterialStateProperty.all(Colors.red) ) : MaterialStateProperty.all(Color.fromARGB(255, 231, 229, 229)),
        //           foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 22, 22, 22))
        //         ),
        //         child: Text(
        //           "d. ${_questions[quesIndex]['op4']}"
        //         ),
        //       ),
        //       SizedBox(height: 20,),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           TextButton(
        //             onPressed: (){},
        //             style: ButtonStyle(
        //               padding: MaterialStateProperty.all(EdgeInsets.zero),
        //               foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 22, 22, 22))
        //           ),
        //             child: Text(
        //               "Hint",
        //             ),
        //           ),
        //           TextButton(
        //             onPressed: (){},
        //             style: ButtonStyle(
        //               padding: MaterialStateProperty.all(EdgeInsets.zero),
        //               foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 22, 22, 22))
        //           ),
        //             child: Text(
        //               "Show Answer",
        //             ),
        //           ),
        //         ]
        //       ),
        //       Spacer(),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           quesIndex>0 ?
        //            IconButton(
        //             onPressed: (){
        //               prevQuestion();
        //             },
        //             icon: Icon(
        //               Icons.arrow_back_rounded,
        //               color: Colors.grey
        //             ),
        //           ) : Container(),
        //           quesIndex < _questions.length-1 ?
        //           IconButton(
        //             onPressed: (){
        //               nextQuestion();
        //             },
        //             icon: Icon(
        //               Icons.arrow_forward_rounded,
        //               color: Colors.grey
        //             ),
        //           ) :
        //           Container()
        //         ],
        //       ),
        //     ],
        //   ),
        // )
        );
  }
}

final _questions = [
  {
    'ques': 'Adipisicing amet voluptate excepteur cillum.',
    'op1': 'Adipisicing',
    'op2': 'voluptate',
    'op3': 'excepteur',
    'op4': 'cillum',
  },
  {
    'ques':
        'Dolor ad pariatur enim excepteur dolor excepteur fugiat ut eiusmod ipsum et minim dolor occaecat.',
    'op1': 'pariatur',
    'op2': 'excepteur',
    'op3': 'eiusmod',
    'op4': 'fugiat',
  },
  {
    'ques':
        'Tempor velit commodo ipsum fugiat laboris excepteur nostrud elit deserunt qui consequat consequat.',
    'op1': 'deserunt',
    'op2': 'ipsum',
    'op3': 'Tempor',
    'op4': 'commodo',
  }
];
