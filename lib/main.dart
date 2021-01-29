import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';

import 'screens/home_page.dart';
import 'screens/photos_page.dart';
import 'screens/paintings_page.dart';
import 'screens/review_page.dart';

enum Themes {
  DARK, LIGHT, SYSTEM
}

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  List<String> sources = [
    'assets/images/Photos/Dog1.jpg',
    'assets/images/Styles/Kandinsky.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NST Demo',
      theme: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
      ),
      darkTheme: new ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
      ),
      themeMode: ThemeMode.dark,

      initialRoute: '/',
      routes: {
        '/': (context) => Home(photo: sources[0], style: sources[1]),
        '/photo': (context) => PhotosPage(),
        '/style': (context) => PaintingsPage(),
        '/review': (context) => ReviewPage(),
      },
    );
  }
}