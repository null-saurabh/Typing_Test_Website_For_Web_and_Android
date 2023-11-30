import 'dart:math';

import 'package:flutter/material.dart';
import 'package:typingtest/model/save_test_model.dart';

class TestModelProvider with ChangeNotifier {
  TestModel _testModel = TestModel();

  TestModel get testModel => _testModel;

  void updateTypedText(String text) {
    _testModel.typedText = text;
    notifyListeners();
  }

  void startNewTest() {
    _testModel = TestModel();
  }

  void updateOriginalText(String text) {
    _testModel.originalText = text;
  }

  void updateTimeTaken(int value) {
    _testModel.timeTaken = value;
    notifyListeners();
  }

  void updateBackspace() {
    _testModel.backSpaceCount++;
    notifyListeners();
  }

  Future<void> submitTest() async {
    await calculateAllMetrics();
  }

  Future<void> calculateAllMetrics() async {
    await Future.wait([
      calculateWords(),
      calculateWPMAndAccuracy(),
      calculateHalfMistake(),
      calculateFullMistake(),
    ]);
  }

  Future<void> calculateWords() async {
    final typedText = _testModel.typedText;
    final originalText = _testModel.originalText;

    _testModel.wordsTyped = typedText.split(' ').length;

    int matchingCharacters = 0;
    for (int i = 0; i < typedText.length && i < originalText.length; i++) {
      if (typedText[i] == originalText[i]) {
        matchingCharacters++;
      }
    }

    _testModel.correctWords = matchingCharacters;
    _testModel.incorrectWords = originalText.split(' ').length - _testModel.correctWords;

    notifyListeners();
  }

  Future<void> calculateWPMAndAccuracy() async {
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

  Future<void> calculateHalfMistake() async {
    final typedText = _testModel.typedText;
    final originalText = _testModel.originalText;

    int halfMistakeCount = 0;

    for (int i = 0; i < typedText.length && i < originalText.length; i++) {
      if (typedText[i] != originalText[i]) {
        // Use Levenshtein distance to check similarity
        int distance = levenshteinDistance(typedText, originalText);
        if (distance <= typedText.length ~/ 2) {
          halfMistakeCount++;
        }
      }
    }

    _testModel.halfMistake = halfMistakeCount;
    notifyListeners();
  }

  Future<void> calculateFullMistake() async {
    final typedText = _testModel.typedText;
    final originalText = _testModel.originalText;

    int fullMistakeCount = 0;

    for (int i = 0; i < typedText.length && i < originalText.length; i++) {
      if (typedText[i] != originalText[i]) {
        // Use Levenshtein distance to check similarity
        int distance = levenshteinDistance(typedText, originalText);
        if (distance > typedText.length ~/ 2) {
          fullMistakeCount++;
        }
      }
    }

    _testModel.fullMistake = fullMistakeCount;
    notifyListeners();
  }

  int levenshteinDistance(String a, String b) {
    int m = a.length;
    int n = b.length;

    List<List<int>> dp = List.generate(m + 1, (index) => List<int>.filled(n + 1, 0));

    for (int i = 0; i <= m; i++) {
      for (int j = 0; j <= n; j++) {
        if (i == 0) {
          dp[i][j] = j;
        } else if (j == 0) {
          dp[i][j] = i;
        } else {
          dp[i][j] = min(
            dp[i - 1][j] + 1,
            min(
              dp[i][j - 1] + 1,
              dp[i - 1][j - 1] + (a[i - 1] == b[j - 1] ? 0 : 1),
            ),
          );
        }
      }
    }

    return dp[m][n];
  }
}
