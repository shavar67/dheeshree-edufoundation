import 'dart:convert';

import 'package:edufoundation_app/constants/databaseLinks.dart';
import 'package:edufoundation_app/utils/chapters.dart';
import 'package:edufoundation_app/utils/questions.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  Future<List<Chapter>> getChapters(String subjectName) async {

    const String url = chapterLink;
    
      var response = await http.get(Uri.parse(url+subjectName));
      var responseBody = json.decode(response.body);
      var responseChapters = responseBody['result'];
      List<Chapter> chapters = [];
      for(var chapter in responseChapters){
        Chapter ch = Chapter(chapter['name']);
        chapters.add(ch);
      }
    return chapters;  
  }  

  Future<List<Question>> getQuestions(String subjectName, String chapterName, int noOfQues, String difficulty) async {
    int level;
    difficulty.toLowerCase() == "easy" ? level = 1 : ((difficulty.toLowerCase() == "medium") ? level = 2 : level = 3);
    const String url = questionLink;
    chapterName = chapterName.replaceAll(' ', '%20');
    subjectName = subjectName.toLowerCase();
    var response = await http.get(Uri.parse("$url/$subjectName/$chapterName/$level?page=1&limit=6"));
    var responseBody = json.decode(response.body);
    var responseQuestions = responseBody['result'];
    List<Question> questions = [];

    for(var i in responseQuestions){
      Question q = Question(i['question'], i['questionImage'], i['option1'], i['option2'], 
        i['option3'], i['option4'], i['option1Image'], i['option2Image'], 
        i['option3Image'], i['option4Image']);
      
      print(q);
      questions.add(q);
    }

    return questions;  
  }

}