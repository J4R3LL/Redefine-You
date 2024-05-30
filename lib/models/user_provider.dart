import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _name = 'John Doe';
  int _age = 30;

  String get name => _name;
  int get age => _age;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setAge(int age) {
    _age = age;
    notifyListeners();
  }
}
