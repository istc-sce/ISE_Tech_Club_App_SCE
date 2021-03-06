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
      backgroundColor: Colors.black,
      body: StreamBuilder(
        initialData: false,
        stream: slimyCard.stream,
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: 100),
              SlimyCard(
                color: Colors.white,
                topCardHeight:200,
                topCardWidget: topCardWidget(physicsCycle.semester),
                bottomCardWidget: bottomCardWidget(physicsCycle.subjectNames,physicsCycle.pdfURL),
              ),
              SizedBox(height: 30),
              SlimyCard(
                color: Colors.white,
                topCardHeight:200,
                topCardWidget: topCardWidget(chemistryCycle.semester),
                bottomCardWidget: bottomCardWidget(chemistryCycle.subjectNames,chemistryCycle.pdfURL),
              ),
              SizedBox(height: 30),
              SlimyCard(
                color: Colors.white,
                topCardHeight:200,
                topCardWidget: topCardWidget(thirdSem.semester),
                bottomCardWidget: bottomCardWidget(thirdSem.subjectNames,thirdSem.pdfURL),
              ),
              SizedBox(height: 30),
              SlimyCard(
                color: Colors.white,
                topCardHeight:200,
                topCardWidget: topCardWidget(fourthSem.semester),
                bottomCardWidget: bottomCardWidget(fourthSem.subjectNames,fourthSem.pdfURL),
              ),
              SizedBox(height: 30),
              SlimyCard(
                color: Colors.white,
                topCardHeight:200,
                topCardWidget: topCardWidget(fifthSem.semester),
                bottomCardWidget: bottomCardWidget(fifthSem.subjectNames,fifthSem.pdfURL),
              ),
              SizedBox(height: 30),
              SlimyCard(
                color: Colors.white,
                topCardHeight:200,
                topCardWidget: topCardWidget(sixthSem.semester),
                bottomCardWidget: bottomCardWidget(sixthSem.subjectNames,sixthSem.pdfURL),
              ),
              SizedBox(height: 30),
              SlimyCard(
                color: Colors.white,
                topCardHeight:200,
                topCardWidget: topCardWidget(seventhSem.semester),
                bottomCardWidget: bottomCardWidget(seventhSem.subjectNames,seventhSem.pdfURL),
              ),
              SizedBox(height: 30),
              SlimyCard(
                color: Colors.white,
                topCardHeight:200,
                topCardWidget: topCardWidget(eigthSem.semester),
                bottomCardWidget: bottomCardWidget(eigthSem.subjectNames,eigthSem.pdfURL),
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
        style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold,),
      ),
      SizedBox(height: 15),
      Center(
        child: Text(
          semester.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold,),
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
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
          ),
        ),
        Divider(
          color: Colors.black,
        ),
      ],
    );
  });
}

