// test_model_provider.dart
import 'package:flutter/material.dart';
import 'package:typingtest/model/save_test_model.dart';
import 'package:typingtest/view_model/provider/api_provider.dart';
import 'package:typingtest/view_model/services/api_services.dart';

class TestModelProvider with ChangeNotifier {
  TestModel _testModel = TestModel();

  TestModel get testModel => _testModel;


  void updateTypedText(String text) {
    _testModel.typedText = text;
    notifyListeners();
  }

  void startNewTest() {
    _testModel = TestModel(); // Reset the state for a new test
  }

  void updateOriginalText(String text) {
    _testModel.originalText = text;
  }

  void updateTimeTaken(int value) {
    _testModel.timeTaken= value;
    notifyListeners();
  }

  void submitTest(){
    calculateWPMAndAccuracy();
  }

  void calculateWPMAndAccuracy() {
    final typedText = _testModel.typedText;
    final originalText = _testModel.originalText;
    final timerValue = _testModel.timeTaken;

    final wordsTyped = typedText.split(' ').length;
    final wpm = (wordsTyped / timerValue) * 60;

    final accuracy = calculateAccuracy(typedText, originalText);

    _testModel.wpm = wpm.toString();
    _testModel.accuracy = accuracy.toString();

    notifyListeners();
  }


  double calculateAccuracy(String typedText, String originalText) {
      int matchingCharacters = 0;
    for (int i = 0; i < typedText.length && i < originalText.length; i++) {
      if (typedText[i] == originalText[i]) {
        matchingCharacters++;
      }
    }
    return (matchingCharacters / originalText.length) * 100;
  }

}
