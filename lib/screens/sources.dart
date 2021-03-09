import 'package:flutter/material.dart';

class Sources extends ChangeNotifier {
  var _photo = 'assets/images/Photos/Dog1.jpg';
  var _style = 'assets/images/Styles/Kandinsky.jpg';
  var _generated = 'assets/images/Generated/Dog1-Portrait-lite.jpg';
  var _imgURL = 'https://nstserver.herokuapp.com/uploaded/Dog1-Kandinsky.jpg';

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
    notifyListeners();
  }

  void changeStyle(source) {
    _style = source;
    notifyListeners();
  }

  void changeGenerated(source) {
    _generated = source;
    notifyListeners();
  }

  void changeImgURL(source) {
    _imgURL = source;
    notifyListeners();
  }
}