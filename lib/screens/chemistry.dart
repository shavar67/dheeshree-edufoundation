import 'dart:convert';

import 'package:edufoundation_app/utils/chapters.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:edufoundation_app/constants/databaseLinks.dart';
class Chemistry extends StatefulWidget {
  const Chemistry({ Key? key }) : super(key: key);

  @override
  State<Chemistry> createState() => _ChemistryState();
}

class _ChemistryState extends State<Chemistry> {
  

  Future<List<Chapter>> getChapters() async {
      
      const String url = chemistryChapters;
      
        var response = await http.get(Uri.parse(url));
        var responseBody = json.decode(response.body);
        var responseChapters = responseBody['result'];
        List<Chapter> chapters = [];
        for(var chapter in responseChapters){
          Chapter ch = Chapter(chapter['name']);
          chapters.add(ch);
        }
      return chapters;
      
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chemistry"),
        backgroundColor: Colors.pink.shade900,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40),
        color: Colors.white,
        child: FutureBuilder(
          future: getChapters(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              return Center(
                child: Text("Loading Chapters..."),
              );
            }
            else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    margin: EdgeInsets.zero,
                    color: index%2==0 ? Colors.grey.shade300 : Colors.grey.shade50,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Text(
                      snapshot.data[index].name,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}