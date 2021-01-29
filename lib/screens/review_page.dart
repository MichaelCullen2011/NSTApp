import 'package:flutter/material.dart';
import 'photos_page.dart';
import 'paintings_page.dart';


class ReviewPage extends StatefulWidget {
  final String photo;
  final String style;
  ReviewPage({this.photo, this.style});

  @override
  _ReviewPage createState() => _ReviewPage();
}

class _ReviewPage extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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

class Sources {
  final String photo;
  final String style;

  Sources(this.photo, this.style);
}
