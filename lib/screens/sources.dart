import 'package:flutter/material.dart';

class Sources extends ChangeNotifier {
  var _photo = 'assets/images/Photos/Dog1.jpg';
  var _style = 'assets/images/Styles/Kandinsky.jpg';
  var _generated = 'assets/images/Generated/Dog1-Portrait-lite.jpg';
  var _imgURL = 'http://192.168.0.14:5000/uploaded/Dog1-Kandinsky.jpg';

  String get photo {
    return _photo;
  }

  String get style {
    return _style;
  }

  String get generated {
    return _generated;
  }

  String get imgURL {
    return _imgURL;
  }

  void changePhoto(String source) {
    _photo = source;
    print(source);
    notifyListeners();
  }

  void changeStyle(source) {
    _style = source;
    print(source);
    notifyListeners();
  }

  void changeGenerated(source) {
    _generated = source;
    print(source);
    notifyListeners();
  }

  void changeImgURL(source) {
    _imgURL = source;
    print(source);
    notifyListeners();
  }
}