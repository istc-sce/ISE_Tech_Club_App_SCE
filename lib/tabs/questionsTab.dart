import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:isetechclub/hive/question_model.dart';
import 'package:isetechclub/topic_model/topic_model.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hive_flutter/hive_flutter.dart';

class QuestionCreator extends StatefulWidget {
  final TopicModel topicModel;
  final Color color;
  final String hiveBox;

  const QuestionCreator({this.color, this.topicModel, this.hiveBox});
  @override
  _QuestionCreatorState createState() => _QuestionCreatorState();
}

class _QuestionCreatorState extends State<QuestionCreator> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    ascCall();
  }

//  Future<void> ascCall() async {
//    await loadBoxes();
//  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff251293),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<QuestionModel>(widget.hiveBox).listenable(),
              builder: (context, Box<QuestionModel> box, _) {
                if (box.values.isEmpty)
                  return Center(
                    child: Text("Question list is empty"),
                  );
                return Column(
                  children: [
                    StepProgressIndicator(
                      totalSteps: widget.topicModel.questionName.length,
                      currentStep: Hive.box<QuestionModel>(widget.hiveBox).values.where((element) => element.isChecked.contains(true)).length,
                      size: 36,
                      selectedColor: Colors.black,
                      unselectedColor: Colors.grey[200],
                      customStep: (index, color, _) => color == Colors.black
                          ? Container(
                        color: color,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      )
                          : Container(
                        color: color,
                        child: Icon(
                          Icons.remove,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: widget.topicModel.questionName.length,
                          itemBuilder: (context, index) {
                            QuestionModel res = box.getAt(index);
                            return Row(
                              children: [
                                Checkbox(
                                  value: res.isChecked[index],
                                  onChanged: (newValue) {
                                    res.isChecked[index] = !res.isChecked[index];
                                    res.save();
                                  },
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(13.0),
                                    child: MaterialButton(
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      height: 60,
                                      onPressed: () async {
                                        if (await canLaunch(
                                            widget.topicModel.url[index])) {
                                          await launch(widget.topicModel.url[index]);
                                        }
                                      },
                                      color: widget.color,
                                      child: Text(widget.topicModel
                                          .questionName[index],
                                        style: TextStyle(color: Colors.white,
                                          fontWeight: FontWeight.bold,),),
                                    ),
                                  ),
                                ),

                              ],);
                          }),
                    ),
                  ],
                );
              }));
  }
}

//ListView.builder(
//itemCount: Hive.box<QuestionModel>(widget.hiveBox).getAt(1).questionName.length,
//itemBuilder: (context, index) {
//QuestionModel res = box.getAt(index);
//return Row(
//children: [
//Checkbox(
//value: res.isChecked[index],
//onChanged: (newValue) {
//res.isChecked[index] = !res.isChecked[index];
//res.save();
//},
//),
//Expanded(
//child: Padding(
//padding: const EdgeInsets.all(13.0),
//child: MaterialButton(
//elevation: 2,
//shape: RoundedRectangleBorder(
//borderRadius: BorderRadius.circular(18),
//),
//height: 60,
//onPressed: () async {
//if(await canLaunch(res.url[index])){
//await launch(res.url[index]);
//}
//},
//color: widget.color,
//child: Text(res.questionName[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),),
//),
//),
//),
//
//],
//);
//}
//),







