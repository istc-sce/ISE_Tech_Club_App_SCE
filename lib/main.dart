import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:isetechclub/contact.dart';
import 'package:isetechclub/programming.dart';
import 'package:isetechclub/team.dart';


import 'homePage.dart';
import 'notesScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MyHome(),
    initialRoute: '/',
    routes: {
      '/notes': (context) => NotesScreen(),
    });
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
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        iconSize: 17,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        backgroundColor: Color(0xff251293),
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Home',style: TextStyle(color: Colors.white),),
              icon: Icon(Icons.home,color: Colors.white,)
          ),
          BottomNavyBarItem(
              title: Text('Notes',style: TextStyle(color: Colors.white),),
              icon: Icon(Icons.note,color: Colors.white,)
          ),
          BottomNavyBarItem(
              title: Text('Programming',style: TextStyle(color: Colors.white),),
              icon: Icon(Icons.code,color: Colors.white,)
          ),
          BottomNavyBarItem(
              title: Text('Team',style: TextStyle(color: Colors.white),),
              icon: Icon(Icons.wc,color: Colors.white,)
          ),
          BottomNavyBarItem(
              title: Text('Contact',style: TextStyle(color: Colors.white),),
              icon: Icon(Icons.contact_page,color: Colors.white,)
          ),
        ],
      ),
        backgroundColor: Color(0xff251293),
        body: SizedBox.expand(
          child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  children:<Widget>[
                    HomePage(),
                    NotesScreen(),
                    ProgrammingScreen(),
                    TeamScreen(),
                    ContactPage(),
                  ],
                ),
        ),
        );
  }
}




