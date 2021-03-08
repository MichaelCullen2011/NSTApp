import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';


import 'sources.dart';
import 'requests.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPage createState() {
    return _LoadingPage();
  }
}

class _LoadingPage extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    var generated = Provider.of<Sources>(context).generated;
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Learning Page'),
        centerTitle: true,
      ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //making outermost wrapper equal to
          //100% width and vertical height
          child: Column(
            children: <Widget> [
              Text(
                  "The ML model is working on your image...",
                  textAlign: TextAlign.center,
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: 32,
                  ),
              ),
              Stack(
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
                              child: new Image.asset(generated, height: 200.0, fit: BoxFit.cover),
                            ),
                            // new Card(
                            //   child: new Image.asset(generated, height: 200.0, fit: BoxFit.cover),
                            // ),
                          ]
                      ),
                    ),
// LoadingBouncingGrid.square(
//   inverted: true,
//   borderColor: Colors.indigo.shade300,
//   borderSize: 8.0,
//   size: 120.0,
//   backgroundColor: Colors.indigo.shade200,
//   duration: Duration(milliseconds: 10),
// ),
                ),
              ],
           ),
          ],
        ),
      ),
    );
  }
}
