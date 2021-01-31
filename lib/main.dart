import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'screens/home_page.dart';
import 'screens/sources.dart';

enum Themes {
  DARK, LIGHT, SYSTEM
}

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (_) => Sources(),
      child: new MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  // var photo = 'assets/images/Photos/Dog1.jpg';
  // var style = 'assets/images/Styles/Kandinsky.jpg';

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
        '/': (context) => Home(),
        // '/photo': (context) => PhotosPage(),
        // '/style': (context) => PaintingsPage(),
        // '/review': (context) => ReviewPage(),
      },
    );
  }
}