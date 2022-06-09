import 'package:edufoundation_app/services/apiCall.dart';
import 'package:edufoundation_app/utils/routes.dart';
import 'package:flutter/material.dart';
class Maths extends StatefulWidget {
  const Maths({ Key? key }) : super(key: key);

  @override
  State<Maths> createState() => _MathsState();
}

class _MathsState extends State<Maths> {
  
  ApiCall ac = new ApiCall();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maths"),
        backgroundColor: Colors.blue.shade900,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        // padding: EdgeInsets.only(top: 40),
        color: Colors.white,
        child: FutureBuilder(
          future: ac.getChapters("mathematics"),
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
                      Navigator.of(context).pushNamed(MyRoutes.mathsQuestions, arguments: { 
                        'subject': "mathematics",
                        'chapter': snapshot.data[index].name
                      }
                    );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: index%2==0 ? Color(0xff6699CC) : Colors.grey.shade50,
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