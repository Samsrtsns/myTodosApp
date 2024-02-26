import 'package:flutter/material.dart';

class ChangeToSignUp with ChangeNotifier {
  String _enterText = "Login";

  String get enterText => _enterText;

  void changeToScreen() {
    if (_enterText != "Login") {
      _enterText = "Login";
    } else {
      _enterText = "Register";
    }
    notifyListeners();
  }
}
