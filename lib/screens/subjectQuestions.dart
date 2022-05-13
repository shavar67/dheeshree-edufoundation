import 'dart:convert';

import 'package:edufoundation_app/constants/databaseLinks.dart';
import 'package:edufoundation_app/services/apiCall.dart';
import 'package:edufoundation_app/utils/questions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Questions extends StatefulWidget {
  const Questions({ Key? key }) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {

  bool showHint = false;
  bool showAnswer = false;

  Future<List<Question>> getQuestions(String subjectName, String chapterName) async {
         
    // const String url = questionLink;
      var response = await http.get(Uri.parse("https://edu-foundation-bnqyscf9q-kudos-dot-com.vercel.app/api/question/getchapter/$subjectName/$chapterName?page=1&limit=10"));
      var responseBody = json.decode(response.body);
      var responseQuestions = responseBody['result'];
      List<Question> questions = [];
      for(var question in responseQuestions){
        Question q = Question(question['question'], question['option1'], question['option2'], 
          question['option3'], question['option4'], question['correct_answer'], question['hints']);
        questions.add(q);
      }
    return questions;  
  }

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as Map;
    String subject = arg['subject'];
    String ch = arg['chapter'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ch,
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        color: Colors.white70,
        child: FutureBuilder(
          future: getQuestions(subject, ch),
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
                        Text(
                          "a. ${snapshot.data[index].op1}",
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 15.0,),
                        Text(
                          "b. ${snapshot.data[index].op2}",
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 15.0,),
                        Text(
                          "c. ${snapshot.data[index].op3}",
                          style: TextStyle(
                            color: Colors.grey[200],
                          ),
                        ),
                        SizedBox(height: 15.0,),
                        Text(
                          "d. ${snapshot.data[index].op4}",
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 16.0,
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
      ),
    );
  }
}