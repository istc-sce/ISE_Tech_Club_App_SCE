import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final databaseReference = FirebaseFirestore.instance;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff251293),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:30.0,top:18),
              child: Text('Ongoing Events',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: databaseReference.collection("event").snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) return new Text("There is no expense");
                    return new ListView(children: getEventData(snapshot));
                  }),
            ),
          ],
        )
        ),
    );
  }
}



getEventData (AsyncSnapshot<QuerySnapshot> snapshot) {
  return snapshot.data.docs
      .map((doc) => Padding(
    padding: const EdgeInsets.only(left:25.0,right: 25,top: 25,bottom: 12),
    child: new Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(doc['posterURL']),
          ),
          SizedBox(height: 10,),
          Text(doc['name'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
          SizedBox(height: 10,),
          Text(doc['date'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(doc['description'],style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
          ),
          SizedBox(height: 10,),
          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.deepPurple,
            child: Text('Register',style: TextStyle(color: Colors.white),),
            onPressed: () async {
              if(await canLaunch(doc['registrationURL'])){
                await launch(doc['registrationURL']);
              }
            },
          ),
        ],
      ),
    ),
  )
  ).toList();
}
