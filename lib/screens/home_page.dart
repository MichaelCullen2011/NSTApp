import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'photos_page.dart';
import 'paintings_page.dart';
import 'sources.dart';
import 'requests.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  Future<ImageJSON> _futureImage;
  Future<Widget> _futureWidget;
  bool isSwitched = true;

  @override
  void initState() {
    super.initState();
    // _futureImage = getImageJSON('http://192.168.1.25:5000/nst', 'Dog1', 'Kandinsky', 'false');
    _futureImage = getImageJSON('https://nstserver.herokuapp.com/nst', 'Dog1', 'Kandinsky', 'false');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var photo = Provider.of<Sources>(context).photo;
    _futureWidget = chooseImage(photo);
  }

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

    return Scaffold(
      appBar: AppBar(
        title: Text('NST'),
        centerTitle: true,
      ),
      body: FutureBuilder<Image>(
        future: _futureWidget,
        builder: (BuildContext context, AsyncSnapshot<Image> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            Provider.of<Sources>(context, listen: false)
                                .changeNstLite(value);
                          });
                        }
                      )
                    ),
                    Center(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(30.0),
                        child: new Column(
                            children: <Widget>[
                              new Card(
                                child: snapshot.data,
                                // child: new Image(image: FileImage(File(photo)), height: 300.0, fit: BoxFit.cover),
                              ),
                              new Card(
                                child: new Image.asset(
                                    style, height: 300.0, fit: BoxFit.cover),
                              ),
                            ]
                        ),
                      ),
                    ),
                    Positioned(
                        left: 40, right: 40, bottom: 30,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  width: 50.0,
                                  height: 50.0,
                                  child: FloatingActionButton(
                                    heroTag: "phototBtn",
                                    elevation: 10.0,
                                    onPressed: () {
                                      // _navigateAndDisplaySelectionPhoto(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PhotosPage()),
                                      );
                                    },
                                    backgroundColor: Colors.indigo.shade200,
                                    child: Icon(Icons.photo),
                                  )
                              ),

                              Container(
                                  width: 60.0,
                                  height: 60.0,
                                  child: FloatingActionButton(
                                    heroTag: "confirmBtn",
                                    elevation: 10.0,
                                    onPressed: () {
                                      Provider.of<Sources>(
                                          context, listen: false).changeImgURL(
                                          'https' + photoName + '-' +
                                              styleName + '.jpg'
                                      );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>
                                            RequestsPage(
                                                photo, photoName, styleName, lite)),
                                      );
                                    },
                                    backgroundColor: Colors.indigo.shade200,
                                    child: Icon(
                                        Icons.upgrade_rounded, size: 30.0),
                                  )
                              ),

                              Container(
                                width: 50.0,
                                height: 50.0,
                                child: FloatingActionButton(
                                  heroTag: "paintingsBtn",
                                  elevation: 10.0,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          PaintingsPage()),
                                    );
                                  },
                                  backgroundColor: Colors.indigo.shade200,
                                  child: Icon(Icons.brush),
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

Future<Image> chooseImage(path) async {
  try {
    await rootBundle.load(path);
    return Image.asset(path, height: 300.0, fit: BoxFit.cover);
  } catch (e) {
    return Image(image: FileImage(File(path)), height: 300.0, fit: BoxFit.cover);
  }
}