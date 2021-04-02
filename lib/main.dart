import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';

import 'dart:async';
import 'dart:io';

import 'screens/home_page.dart';
import 'screens/sources.dart';
import 'screens/photos_page.dart';
import 'screens/paintings_page.dart';
import 'screens/requests.dart';

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
  @override
  Widget build(BuildContext context) {
    var photo = Provider.of<Sources>(context).photo;
    var style = Provider.of<Sources>(context).style;
    var lite = Provider.of<Sources>(context).nstLite;

    File photoFile = new File(photo);
    File styleFile = new File(style);
    String photoFileName = photoFile.path.split('/').last;
    String styleFileName = styleFile.path.split('/').last;

    var photoName = photoFileName.substring(0, photoFileName.length - 4);
    var styleName = styleFileName.substring(0, styleFileName.length - 4);

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
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/photo': (context) => PhotosPage(),
        '/style': (context) => PaintingsPage(),
        '/request': (context) => RequestsPage(photo, photoName, styleName, lite),
      },
    );
  }
}