import 'package:edufoundation_app/screens/subjectQuestions.dart';
import 'package:edufoundation_app/services/apiCall.dart';
import 'package:edufoundation_app/utils/routes.dart';
import 'package:flutter/material.dart';

class SubjectChapters extends StatefulWidget {
  final String subjectName;

  const SubjectChapters({ Key? key, required this.subjectName }) : super(key: key);

  @override
  State<SubjectChapters> createState() => _SubjectChaptersState(
    subjectName: subjectName
  );
}

class _SubjectChaptersState extends State<SubjectChapters> {

  String subjectName;

  _SubjectChaptersState({required this.subjectName});
  
  ApiCall ac = new ApiCall();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(subjectName),
        backgroundColor: Colors.grey.shade900,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        // padding: EdgeInsets.only(top: 40),
        color: Colors.white,
        child: FutureBuilder(
          future: ac.getChapters(subjectName.toLowerCase()),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              return Center(
                child: Text("Loading Chapters..."),
              );
            }
            else{
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  return InkWell(
                    onTap: (){
                    //   Navigator.of(context).push(Questions(
                    //     subjectName: "physics", 
                    //     chapterName: snapshot.data[index].name
                    //   )
                    // );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Questions(
                          subjectName: subjectName,
                          chapterName: snapshot.data[index].name,
                        ),),);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: index%2==0 ? Color.fromARGB(255, 155, 152, 152) : Color.fromARGB(255, 223, 220, 220),
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
                        "${index+1}. ${snapshot.data[index].name}",
                        style: TextStyle(
                          fontSize: 18.0,
                          // color: index%2==0 ? Color.fromARGB(255, 247, 244, 244) : Color.fromARGB(175, 7, 7, 7) ,
                          color: index%2==0 ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2
                        ),
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