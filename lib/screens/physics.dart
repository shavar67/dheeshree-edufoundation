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
      appBar: AppBar(
        title: Text("Physics"),
        backgroundColor: Colors.blue.shade900,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40),
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
                      Navigator.of(context).pushNamed(MyRoutes.physicsQuestions, arguments: { 
                        'subject': "physics",
                        'chapter': snapshot.data[index].name
                      }
                    );
                    },
                    child: Container(
                      margin: EdgeInsets.zero,
                      color: index%2==0 ? Colors.grey.shade300 : Colors.grey.shade50,
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