import 'package:flutter/material.dart';
import 'package:isetechclub/schemeData.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:url_launcher/url_launcher.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  NotesData thirdSem = NotesData(3, ['Data Structures','Analog & Digital Electronics', 'Computer Organization','Software Engineering','Discrete Mathematics'], ['https://drive.google.com/drive/folders/1zEIG2Y2AIscKkuoSt7Kpx3-Gm03qb4ua?usp=sharing','https://drive.google.com/drive/folders/1dTlmo4w5V6hh3Y-rDL0aB_YBqRv_0FDF?usp=sharing','https://drive.google.com/drive/folders/1JvaqHGNLdXhqStYVdFHBMTM37vgjpC0d?usp=sharing','https://drive.google.com/drive/folders/1kCku6G6rEWKQnH8CWEGLqXsJl_j4dkMf?usp=sharing', 'https://drive.google.com/drive/folders/1nn7pGZbDtI4qI0xKfa-nFGD6NSmCSbAY?usp=sharing']);

  NotesData fourthSem = NotesData(4, ['Design Analysis of Algorithm','Operating System','Micro-controller & Micro-processor','Object Oriented Concepts','Data Communications'], ['https://drive.google.com/drive/folders/1DChej1By7ZHhsok8DSY3P8UCgVExapA_?usp=sharing','https://drive.google.com/drive/folders/1EsuRE3XDHIJiwHP5nNhj0LWsMr-SHKRe?usp=sharing','https://drive.google.com/drive/folders/1J4UHQdSHiZzsvfFN4Uz6qr66hWki8BiN?usp=sharing','https://drive.google.com/drive/folders/1l8ifLw3LFNlJFdB7GXQ_-N6BPIO40dsU?usp=sharing','https://drive.google.com/drive/folders/1Z2gPsYFi4PDbCuW42oz6tiBa614Df_ff?usp=sharing']);
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
                topCardWidget: topCardWidget(thirdSem.semester),
                bottomCardWidget: bottomCardWidget(thirdSem.subjectNames,thirdSem.pdfURL),
              ),
              SizedBox(height: 30),
              SlimyCard(
                topCardWidget: topCardWidget(fourthSem.semester),
                bottomCardWidget: bottomCardWidget(fourthSem.subjectNames,fourthSem.pdfURL),
              ),
            ],
          );
        }),
      ),
    );
  }
}

Widget topCardWidget(int semester) {
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
        width: 70,
        child: Center(
          child: Text(
            semester.toString(),
            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 1,
            ),
          ],
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

