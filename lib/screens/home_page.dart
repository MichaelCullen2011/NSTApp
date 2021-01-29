import 'package:flutter/material.dart';
import 'package:todo_app/screens/schedule.dart';
import 'package:provider/provider.dart';

import 'photos_page.dart';
import 'paintings_page.dart';
import 'review_page.dart';
import 'schedule.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  int _currentIndex = 1;

  List<Widget> _children() => [
    new PhotosPage(),
    new ReviewPage(),
    new PaintingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = _children();
    return ChangeNotifierProvider(
      create: (context) => MySchedule(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('NST'),
          centerTitle: true,
        ),
        body: children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.indigo.shade200,
          onTap: onTabTapped,
          currentIndex: _currentIndex, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.photo),
              label: "Photos",
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.upgrade),
              label: "Selections",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.brush),
              label: "Paintings",
            )
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}


