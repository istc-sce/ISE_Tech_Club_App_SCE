import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/question_parser.dart';

class QuestionCreator extends StatelessWidget {
  final QuestionPaper topicName;
  final Color color;

  const QuestionCreator({Key key, this.topicName, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: createQuestions(topicName.questions, topicName.url,color),
    );
  }
}

List<Widget> createQuestions(List<String> questions,List url,Color color) {
  return new List<Widget>.generate(questions.length, (int index) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: MaterialButton(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        height: 60,
        onPressed: () async {
          if(await canLaunch(url[index])){
            await launch(url[index]);
          }
        },
        color: color,
        child: Text(questions[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
      ),
    );
  });
}




