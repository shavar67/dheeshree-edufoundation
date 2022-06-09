import 'package:edufoundation_app/screens/subjectQuestions.dart';
import 'package:edufoundation_app/services/apiCall.dart';
import 'package:edufoundation_app/utils/routes.dart';
import 'package:flutter/material.dart';

class Physics extends StatefulWidget {
  const Physics({ Key? key }) : super(key: key);

  @override
  State<Physics> createState() => _PhysicsState();
}

class _PhysicsState extends State<Physics> {
  
  ApiCall ac = new ApiCall();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Physics"),
        backgroundColor: Color(0xffC71585),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        // padding: EdgeInsets.only(top: 40),
        color: Colors.white,
        child: FutureBuilder(
          future: ac.getChapters("physics"),
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
                          subjectName: "physics",
                          chapterName: snapshot.data[index].name,
                        ),),);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: index%2==0 ? Color.fromARGB(253, 226, 80, 173) : Colors.grey.shade50,
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
                        snapshot.data[index].name,
                        style: TextStyle(
                          fontSize: 18.0,
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