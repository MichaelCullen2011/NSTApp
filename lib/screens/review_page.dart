import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  final String photo;
  final String style;
  ReviewPage({this.photo, this.style});

  @override
  _ReviewPage createState() {
    return _ReviewPage();
  }
}

class _ReviewPage extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget.photo);
    debugPrint(widget.style);
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Selections'),
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            new Text("Select a photo and painting to combine"),
            new Image(image: AssetImage(widget.photo)),
            new Image(image: AssetImage(widget.style)),
          ]

        )
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.check),
          backgroundColor: Colors.indigo.shade200,
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
