import 'package:edufoundation_app/services/apiCall.dart';
import 'package:flutter/material.dart';

class Chemistry extends StatefulWidget {
  const Chemistry({ Key? key }) : super(key: key);

  @override
  State<Chemistry> createState() => _ChemistryState();
}

class _ChemistryState extends State<Chemistry> {
  
  ApiCall ac = new ApiCall();
  
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
          future: ac.getChapters("chemistry"),
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