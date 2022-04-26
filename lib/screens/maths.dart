import 'package:edufoundation_app/services/apiCall.dart';
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
        padding: EdgeInsets.only(top: 40),
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