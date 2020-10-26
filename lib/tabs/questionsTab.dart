import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:isetechclub/hive/load_hiveBox.dart';
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
    bool alertVisibility = false;
    return Scaffold(
      backgroundColor: Color(0xff251293),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<QuestionModel>(widget.hiveBox).listenable(),
              builder: (context, Box<QuestionModel> box, _) {
                if (box.values.isEmpty)
                  return Center(
                    child: Text("Question list is empty"),
                  );
                if(Hive.box<QuestionModel>(widget.hiveBox).values.where((element) => element.isChecked.contains(true)).length==widget.topicModel.questionName.length) {
                  return Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height/2,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      child: Column(
                        children: [
                          SizedBox(height: 70,),
                          Image.asset('images/completed.png',height: 150,width: 300,),
                          SizedBox(height: 30,),
                          Text('You\'ve completed the ${widget.topicModel.topicName} module!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
                          SizedBox(height: 30,),
                          Text('Click the button below to practice again',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54),textAlign: TextAlign.center,),
                          SizedBox(height: 30,),
                          MaterialButton(
                            minWidth: 150.0,
                            height: 60,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.white70,),
                            color: Colors.deepPurpleAccent,
                            onPressed: () {
                              loadBoxes();
                              Hive.box<QuestionModel>(widget.hiveBox).getAt(0).isChecked[0] = false;
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StepProgressIndicator(
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







