import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:isetechclub/hive/hive_names.dart';
import 'package:isetechclub/hive/load_hiveBox.dart';
import 'package:isetechclub/tabs/questionsTab.dart';
import 'package:isetechclub/topic_model/topic_model.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';


class ProgrammingScreen extends StatefulWidget {
  @override
  _ProgrammingScreenState createState() => _ProgrammingScreenState();
}

class _ProgrammingScreenState extends State<ProgrammingScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 6,
          initialIndex: 0,
          child: Scaffold(
            body: TabBarView(
              children: [
                QuestionCreator(topicModel: array,hiveBox:HiveBoxes.array,color: Colors.cyan,),
                QuestionCreator(topicModel: matrix,hiveBox:HiveBoxes.matrix,color: Colors.redAccent,),
                QuestionCreator(topicModel: string,hiveBox:HiveBoxes.string,color: Colors.deepOrangeAccent,),
                QuestionCreator(topicModel: linkedList,hiveBox:HiveBoxes.linkedList,color: Colors.green,),
                QuestionCreator(topicModel: binaryTree,hiveBox:HiveBoxes.binaryTree,color: Colors.deepPurpleAccent,),
                QuestionCreator(topicModel: bitManipulation,hiveBox:HiveBoxes.bitManipulation,color: Colors.pink,),
              ],
            ),
            backgroundColor: Color(0xff251293),
            appBar: AppBar(
              backgroundColor: Color(0xff251293),
              elevation: 0,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top:12.0,left: 12),
                child: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(text: 'Array'),
                    Tab(text: 'Matrix',),
                    Tab(text: 'String',),
                    Tab(text: 'Linked List',),
                    Tab(text: 'Binary Tree',),
                    Tab(text: 'Bit Manipulation',),
                  ],
                  labelColor: Colors.white,
                  indicator: RectangularIndicator(
                    horizontalPadding: 4,
                    verticalPadding: 7,
                    color: Colors.white,
                    bottomLeftRadius: 100,
                    bottomRightRadius: 100,
                    topLeftRadius: 100,
                    topRightRadius: 100,
                    paintingStyle: PaintingStyle.stroke,
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}


