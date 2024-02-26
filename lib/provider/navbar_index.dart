import 'package:flutter/material.dart';

class NavbarChangeIndex with ChangeNotifier {
  int _selectedIndex = 1;
  Color _currentColor = Colors.deepPurple;

  Color get currentColor => _currentColor;
  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    _selectedIndex = index;

    if (_selectedIndex == 0) {
      _currentColor = Colors.black;
    } else if (_selectedIndex == 1) {
      _currentColor = Colors.black;
    } else {
      _currentColor = Colors.black;
    }
    notifyListeners(); // Değişiklikleri dinleyenleri haberdar et
  }
}
