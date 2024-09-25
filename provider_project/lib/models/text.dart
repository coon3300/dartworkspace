import 'package:flutter/material.dart';

class Messge with ChangeNotifier {
  String _msg = 'Hello!';

  String get msg => _msg;

  void changeMsg(msg) {
    this._msg = msg;

    notifyListeners();
  }
}
