import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:isetechclub/contact.dart';
import 'package:isetechclub/hive/hive_names.dart';
import 'package:isetechclub/hive/question_model.dart';
import 'package:isetechclub/programming.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'event_screen.dart';
import 'hive/load_hiveBox.dart';
import 'homePage.dart';
import 'notesScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(QuestionModelAdapter());
  await Hive.openBox<QuestionModel>(HiveBoxes.array);
  await Hive.openBox<QuestionModel>(HiveBoxes.string);
  await Hive.openBox<QuestionModel>(HiveBoxes.matrix);
  await Hive.openBox<QuestionModel>(HiveBoxes.bitManipulation);
  await Hive.openBox<QuestionModel>(HiveBoxes.binaryTree);
  await Hive.openBox<QuestionModel>(HiveBoxes.linkedList);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        unselectedWidgetColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyHome(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/notes': (context) => NotesScreen(),
        '/events' : (context) => EventScreen(),
        '/programming' : (context) => ProgrammingScreen(),
        '/contact' : (context) => ContactPage(),
      },
    );
  }
}


class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _currentIndex = 0;
  PageController _pageController;


  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    for(int i=0; i<14;i++)
      loadBoxes();
  }



  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
    Hive.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        iconSize: 17,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        backgroundColor: Colors.white,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Home',style: TextStyle(color: Colors.black),),
              icon: Icon(Icons.home,color: Colors.black,)
          ),
          BottomNavyBarItem(
              title: Text('ISE Notes',style: TextStyle(color: Colors.black),),
              icon: Icon(Icons.note,color: Colors.black,)
          ),
          BottomNavyBarItem(
              title: Text('Events',style: TextStyle(color: Colors.black),),
              icon: Icon(Icons.event,color: Colors.black,)
          ),
          BottomNavyBarItem(
              title: Text('Programming',style: TextStyle(color: Colors.black),),
              icon: Icon(Icons.code,color: Colors.black,)
          ),
          BottomNavyBarItem(
              title: Text('Contact',style: TextStyle(color: Colors.black),),
              icon: Icon(Icons.contact_page,color: Colors.black,)
          ),
        ],
      ),
        backgroundColor: Colors.black,
        body: SizedBox.expand(
          child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  children:<Widget>[
                    HomePage(),
                    NotesScreen(),
                    EventScreen(),
                    ProgrammingScreen(),
                    ContactPage(),
                  ],
                ),
        ),
        );
  }
}




