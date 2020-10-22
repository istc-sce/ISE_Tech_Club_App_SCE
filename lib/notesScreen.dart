import 'package:flutter/material.dart';
import 'package:isetechclub/schemeData.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:url_launcher/url_launcher.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff251293),
      body: StreamBuilder(
        initialData: false,
        stream: slimyCard.stream,
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: 100),
              SlimyCard(
                topCardHeight:200,
                topCardWidget: topCardWidget(physicsCycle.semester),
                bottomCardWidget: bottomCardWidget(physicsCycle.subjectNames,physicsCycle.pdfURL),
              ),
              SizedBox(height: 30),
              SlimyCard(
                topCardHeight:200,
                topCardWidget: topCardWidget(chemistryCycle.semester),
                bottomCardWidget: bottomCardWidget(chemistryCycle.subjectNames,chemistryCycle.pdfURL),
              ),
              SizedBox(height: 30),
              SlimyCard(
                topCardHeight:200,
                topCardWidget: topCardWidget(thirdSem.semester),
                bottomCardWidget: bottomCardWidget(thirdSem.subjectNames,thirdSem.pdfURL),
              ),
              SizedBox(height: 30),
              SlimyCard(
                topCardHeight:200,
                topCardWidget: topCardWidget(fourthSem.semester),
                bottomCardWidget: bottomCardWidget(fourthSem.subjectNames,fourthSem.pdfURL),
              ),
              SizedBox(height: 30),
              SlimyCard(
                topCardHeight:200,
                topCardWidget: topCardWidget(fifthSem.semester),
                bottomCardWidget: bottomCardWidget(fifthSem.subjectNames,fifthSem.pdfURL),
              ),
              SizedBox(height: 30),
              SlimyCard(
                topCardHeight:200,
                topCardWidget: topCardWidget(sixthSem.semester),
                bottomCardWidget: bottomCardWidget(sixthSem.subjectNames,sixthSem.pdfURL),
              ),
            ],
          );
        }),
      ),
    );
  }
}

Widget topCardWidget(String semester) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        'SEMESTER',
        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,),
      ),
      SizedBox(height: 20),
      Container(
        height: 70,
        width: 100,
        child: Center(
          child: Text(
            semester.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),
          ),
        ),
      ),
    ],
  );
}

Widget bottomCardWidget(List<String> subjectNames,List url) {
  return ListView(
    children: createChildren(subjectNames,url),
  );
}

List<Widget> createChildren(List subjects,List url) {
  return new List<Widget>.generate(subjects.length, (int index) {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            if(await canLaunch(url[index])){
              await launch(url[index]);
            }
          },
          child: Text(
              subjects[index].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
          ),
        ),
        Divider(
          color: Colors.white70,
        ),
      ],
    );
  });
}

