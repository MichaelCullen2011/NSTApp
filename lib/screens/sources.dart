import 'package:flutter/material.dart';

class Sources extends ChangeNotifier {
  String _photo = 'assets/images/Photos/Dog1.jpg';
  var _style = 'assets/images/Styles/Kandinsky.jpg';

  String get photo {
    return _photo;
  }

  String get style {
    return _style;
  }

  void changePhoto(String source) {
    _photo = source;
    notifyListeners();
  }

  void changeStyle(source) {
    _style = source;
    notifyListeners();
  }

}