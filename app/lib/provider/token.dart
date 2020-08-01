import 'package:flutter/cupertino.dart';

class Token with ChangeNotifier {
  String token;

  String get tokens => token;

  void toke(String tokenn) {
    token = tokenn;
    print(tokenn);
    notifyListeners();
  }
}
