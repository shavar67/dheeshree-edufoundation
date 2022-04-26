import 'dart:convert';

import 'package:edufoundation_app/constants/databaseLinks.dart';
import 'package:edufoundation_app/utils/chapters.dart';
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
}