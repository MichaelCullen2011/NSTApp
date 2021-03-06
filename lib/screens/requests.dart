import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;

class RequestsPage extends StatefulWidget {
  final String photo;
  final String photoName;
  final String styleName;
  final String lite;

  RequestsPage(this.photo, this.photoName, this.styleName, this.lite);

  @override
  _RequestsPage createState() => _RequestsPage();
}

class _RequestsPage extends State<RequestsPage> {
  Future<ImageJSON> _futureImage;

  @override
  void initState() {
    super.initState();
    _futureImage = getImageJSON(widget.photo, widget.photoName, widget.styleName, widget.lite);
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
                    // child: Transform(
                    //     alignment: Alignment.center,
                    //     transform: Matrix4.rotationY(math.pi),
                    //     child: Image.network(snapshot.data.url.toString(), alignment: Alignment.center)
                    // )
                    child: Image.network(snapshot.data.url.toString()),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error.toString()}");
            }
          }
          return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.indigo.shade200),
                ),
            ]
            ),
          );
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

Future<ImageJSON> getImageJSON(file, content, style, lite) async {
  // final uri = 'http://192.168.1.25:5000/nst';
  final uri = 'https://nstserver.herokuapp.com/nst';
  final headers = {'Content-Type': 'application/json'};

  File fileFile = new File(file);
  String fileName = content + '.jpg';

  var request = http.MultipartRequest('POST', Uri.parse(uri));
  Map data = {
    'content': content,
    'style': style,
    'lite': lite,
  };

  try {
    var image = http.MultipartFile.fromBytes(
      'file',
      (await rootBundle.load(file)).buffer.asUint8List(),
      filename: fileName,
    );
    request.files.add(image);
  } catch (e) {
    var image = await http.MultipartFile.fromPath(
        'file',
        file,
        filename: fileName
    );
    request.files.add(image);
  }

  // request.files.add(image);
  request.headers.addAll(headers);
  request.fields['data'] = json.encode(data);

  http.Response response = await http.Response.fromStream(await request.send());

  if (response.statusCode == 200) {
    print('Response status: ${response.statusCode}');
    return ImageJSON.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load image');
  }
}
