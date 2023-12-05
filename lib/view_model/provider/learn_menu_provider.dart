import 'package:flutter/material.dart';

class LearnMenuProvider extends ChangeNotifier {

  int _currentTestIndex = 0;

  final List<String> _testStrings = [
    'asdfjkl; as jk df l;',
    'qweruiop qw ui er op',
    'zxcvm,. zx m, cv .',
    'tyghbn ty bn gh',
    'asdfqwerjkl;uiop  asdf jkl;',
  ];

  String get currentTestString => _testStrings[_currentTestIndex];

  void setTestIndex(int index) {
    _currentTestIndex = index;
    notifyListeners();
  }

  void goToNextTest() {
    if (_currentTestIndex == _testStrings.length - 1) {
      _currentTestIndex = 0;
    } else {
      _currentTestIndex++;
    }
    notifyListeners();
  }
}
