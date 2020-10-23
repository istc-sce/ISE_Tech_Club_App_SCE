import 'package:flutter/material.dart';
import 'package:isetechclub/data/question_parser.dart';
import 'package:isetechclub/tabs/questionsTab.dart';
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
                QuestionCreator(topicName: array,color: Colors.deepPurpleAccent,),
                QuestionCreator(topicName: matrix,color: Colors.pinkAccent,),
                QuestionCreator(topicName: string,color: Colors.cyan,),
                QuestionCreator(topicName: linkedList,color: Colors.green,),
                QuestionCreator(topicName: binaryTree,color: Colors.redAccent,),
                QuestionCreator(topicName: bitManipulation,color: Colors.deepOrangeAccent,),
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


