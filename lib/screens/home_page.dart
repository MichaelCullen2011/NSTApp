import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'photos_page.dart';
import 'paintings_page.dart';
import 'sources.dart';

class Home extends StatefulWidget {
  String photo = 'assets/images/Photos/Dog1.jpg';
  String style = 'assets/images/Styles/Kandinsky.jpg';

  Home({this.photo, this.style});

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    var photo = Provider.of<Sources>(context).photo;
    var style = Provider.of<Sources>(context).style;
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
              SingleChildScrollView(
                child: new Column(
                  children: <Widget>[
                    new Image.asset(photo),
                    new Image.asset(style),
                  ]
                ),
              ), // main content wrapper

              Positioned(
                  left:100, right:100, bottom:20,
                  //position to button:20

                  child:Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      //align buttoms to the right
                      children: <Widget>[

                        Container(
                            margin:EdgeInsets.only(right:20),
                            child: FloatingActionButton(
                              heroTag: "phototBtn",
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
                        ), //button first

                        Container(
                            margin:EdgeInsets.only(right:20),
                            child: FloatingActionButton(
                              heroTag: "confirmBtn",
                              onPressed: (){
                                //action code for button 2
                              },
                              backgroundColor: Colors.indigo.shade200,
                              child: Icon(Icons.check),
                            )
                        ), // button second

                        Container(
                            child: FloatingActionButton(
                              heroTag: "paintingsBtn",
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PaintingsPage()),
                                );
                              },
                              backgroundColor: Colors.indigo.shade200,
                              child: Icon(Icons.brush),
                            )
                        ), // button third

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