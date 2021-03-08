import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'sources.dart';

class RequestsPage extends StatefulWidget {
  final String photoName;
  final String styleName;

  RequestsPage(this.photoName, this.styleName);

  @override
  _RequestsPage createState() => _RequestsPage();
}

class _RequestsPage extends State<RequestsPage> {
  Future<ImageJSON> _futureImage;

  @override
  void initState() {
    super.initState();
    _futureImage = getImageJSON('http://192.168.0.14:5000/nst', widget.photoName, widget.styleName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ML Image'),
        backgroundColor: Colors.blueGrey,
      ),

    body: Container(
      child: FutureBuilder<ImageJSON>(
        future: _futureImage,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Image.network(snapshot.data.url.toString()),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error.toString()}");
            }
          }
          return CircularProgressIndicator();
        },
      ),
    ),
    );
  }
}

class ImageJSON {
  final String path;
  final String url;

  ImageJSON({
    this.path,
    this.url,
  });

  factory ImageJSON.fromJson(Map<String, dynamic> json) => ImageJSON(
    path: json["path"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "path": path,
    "url": url,
  };
}

Future<ImageJSON> getImageJSON(url, content, style) async {
  final uri = url;
  final headers = {'Content-Type': 'application/json'};
  final encoding = Encoding.getByName('utf-8');

  Map data = {
    'content': content,
    'style': style,
  };

  String body = json.encode(data);

  final response = await http.post(
    uri,
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return ImageJSON.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load image');
  }
}