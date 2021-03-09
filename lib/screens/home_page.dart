import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class _HomeState extends State<Home>{
  Future<ImageJSON> _futureImage;

  @override
  void initState() {
    super.initState();
    _futureImage = getImageJSON('https://nstserver.herokuapp.com/nst', 'Dog1', 'Kandinsky');
  }

  @override
  Widget build(BuildContext context) {
    var photo = Provider.of<Sources>(context).photo;
    var style = Provider.of<Sources>(context).style;
    var photoName = photo.substring(21, photo.length-4);
    var styleName = style.substring(21, style.length-4);

    return Scaffold(
        appBar: AppBar(
          title: Text('NST'),
          centerTitle: true,
        ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //making outermost wrapper equal to
          //100% width and vertical height
          child:Stack(
            children: <Widget>[
              Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(30.0),
                  child: new Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Card(
                          child: new Image.asset(photo, height: 300.0, fit: BoxFit.cover),
                        ),
                        new Card(
                          child: new Image.asset(style, height: 300.0, fit: BoxFit.cover),
                        ),
                      ]
                  ),
                ),
              ),// main content wrapper

              Positioned(

                  left:40, right:40, bottom:30,

                  child:Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                      children: <Widget>[
                      Container(
                          width: 50.0,
                          height: 50.0,
                          child: FloatingActionButton(
                            heroTag: "phototBtn",
                            elevation: 10.0,
                            onPressed: (){
                              // _navigateAndDisplaySelectionPhoto(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PhotosPage()),
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
                            onPressed: (){
                              Provider.of<Sources>(context, listen: false).changeImgURL(
                                'http' + photoName + '-' + styleName + '.jpg'
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RequestsPage(photoName, styleName)),
                              );
                            },
                            backgroundColor: Colors.indigo.shade200,
                            child: Icon(Icons.upgrade_rounded, size: 30.0),
                          )
                        ),

                        Container(
                            width: 50.0,
                            height: 50.0,
                            child: FloatingActionButton(
                              heroTag: "paintingsBtn",
                              elevation: 10.0,
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PaintingsPage()),
                                );
                              },
                              backgroundColor: Colors.indigo.shade200,
                              child: Icon(Icons.brush),
                            )
                        ),

                        // Add more buttons here
                      ],),
                  )
              ), // our floating action button wrapper
            ],
          ),
      ),
    );
  }
}
