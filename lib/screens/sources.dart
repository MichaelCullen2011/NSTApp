import 'package:flutter/material.dart';

class Sources extends ChangeNotifier {
  var _photo = 'assets/images/Photos/Dog1.jpg';
  var _style = 'assets/images/Styles/Kandinsky.jpg';
  var _imgURL = 'https://nstserver.herokuapp.com/uploaded/Dog1-Kandinsky.jpg';
  var _nstLite = false;

  String get photo {
    return _photo;
  }

  String get style {
    return _style;
  }

  String get imgURL {
    return _imgURL;
  }

  String get nstLite {
    return _nstLite.toString();
  }

  void changePhoto(String source) {
    _photo = source;
    notifyListeners();
  }

  void changeStyle(source) {
    _style = source;
    notifyListeners();
  }

  void changeImgURL(source) {
    _imgURL = source;
    notifyListeners();
  }

  void changeNstLite(source) {
    _nstLite = source;
    notifyListeners();
  }
}