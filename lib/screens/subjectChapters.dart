import 'package:edufoundation_app/screens/selectTimerDiff.dart';
import 'package:edufoundation_app/services/apiCall.dart';
import 'package:flutter/material.dart';

class SubjectChapters extends StatefulWidget {
  final String subjectName;

  const SubjectChapters({Key? key, required this.subjectName})
      : super(key: key);

  @override
  State<SubjectChapters> createState() => _SubjectChaptersState();
}

class _SubjectChaptersState extends State<SubjectChapters> {
  ApiCall ac = ApiCall();

  Future getSubjectData() async {
    return ac.getChapters(widget.subjectName.toLowerCase());
  }

  @override
  void initState() {
    // TODO: implement initState
    getSubjectData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.subjectName),
        backgroundColor: Colors.grey.shade900,
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      body: Container(
        // padding: EdgeInsets.only(top: 40),
        color: Colors.white,
        child: FutureBuilder(
          future: getSubjectData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => SelectTimerDiff(
                            subjectName: widget.subjectName,
                            chapterName: snapshot.data[index].name,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: index % 2 == 0
                            ? Color.fromARGB(255, 155, 152, 152)
                            : Color.fromARGB(255, 223, 220, 220),
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
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: Text(
                        "${index + 1}. ${snapshot.data[index].name}",
                        style: TextStyle(
                            fontSize: 18.0,
                            // color: index%2==0 ? Color.fromARGB(255, 247, 244, 244) : Color.fromARGB(175, 7, 7, 7) ,
                            color: index % 2 == 0 ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2),
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
