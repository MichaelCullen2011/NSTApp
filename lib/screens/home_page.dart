import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'photos_page.dart';
import 'paintings_page.dart';
import 'review_page.dart';
import 'camera_page.dart';

class Home extends StatefulWidget {
  final String photo;
  final String style;
  Home({this.photo, this.style});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;

  List<Widget> _children() => [
    new PhotosPage(),
    new ReviewPage(photo: widget.photo, style: widget.style),
    new PaintingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = _children();
    return Scaffold(
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
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}


