import 'package:flutter/material.dart';

_ReviewPage reviewPage;

class ReviewPage extends StatefulWidget {
  // final String photo;
  // final String style;
  // ReviewPage({this.photo, this.style});

  @override
  _ReviewPage createState() {
    reviewPage = _ReviewPage();
    return reviewPage;
  }
}

class _ReviewPage extends State<ReviewPage> {

  var photo = 'assets/images/Photos/Dog1.jpg';
  var style = 'assets/images/Styles/Kandinsky.jpg';

  // List<String> sources = [
  //   'assets/images/Photos/Dog1.jpg',
  //   'assets/images/Styles/Kandinsky.jpg',
  // ];

  @override
  Widget build(BuildContext context) {
    debugPrint(photo);
    debugPrint(style);
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Selections'),
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            new Text("Select a photo and painting to combine"),
            new Image(image: AssetImage(photo)),
            new Image(image: AssetImage(style)),
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
