import 'dart:math';

import 'package:flutter/material.dart';
import 'package:typingtest/model/save_test_model.dart';

class TestCalculatorProvider with ChangeNotifier {
  TestModel _testModel = TestModel();

  TestModel get testModel => _testModel;

  void startNewTest() {
    _testModel = TestModel();
  }

  void updateTypedText(String text) {
    _testModel.typedText = text;
    notifyListeners();
  }

  void updateOriginalText(String text) {
    _testModel.originalText = text;
    // print(testModel.originalText);
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
    // await Future.delayed(Duration.zero);
    await calculateResult();
  }


  Future<void> calculateResult() async {
    final typedText = _testModel.typedText;
    final originalText = _testModel.originalText;
    final timerValue = _testModel.timeTaken;

    if (typedText.isEmpty) {
      _testModel.wordsTyped = 0;
      _testModel.correctWords = 0;
      _testModel.incorrectWords = 0;
      _testModel.wpm = 0;
      _testModel.accuracy = 100;
      _testModel.omittedWords = originalText.split(' ').length;
      _testModel.halfMistake = 0;
      _testModel.fullMistake = 0;
    } else {
      List<String> typedWordsWithSpaces = typedText.split(' ');
      int extraSpaces = typedWordsWithSpaces.length -
          typedWordsWithSpaces.where((word) => word.isNotEmpty).length;

      List<String> typedWords =
          typedText.split(' ').where((word) => word.isNotEmpty).toList();
      List<String> originalWords = originalText.split(' ');

      int maxComparisonLength = typedWords.length * 2 < originalWords.length
          ? (typedWords.length * 2) - 1
          : originalWords.length;
      // print(originalWords.length);
      // print('max $maxComparisonLength');
      // List<String> originalWordsToCompare =originalWords;
      List<String> originalWordsToCompare =
          originalWords.sublist(0, maxComparisonLength);
      List<List<int>> matrix = List.generate(typedWords.length + 1,
          (i) => List.filled(originalWordsToCompare.length + 1, 0));

      // Define the gap penalty and the match/mismatch score
      int gap = -1;
      int match = 1;
      int mismatch = -1;

      // Fill the matrix with scores
      for (int i = 1; i <= typedWords.length; i++) {
        for (int j = 1; j <= originalWordsToCompare.length; j++) {
          // Calculate the score for each cell
          int diagonal = matrix[i - 1][j - 1] +
              (typedWords[i - 1] == originalWordsToCompare[j - 1]
                  ? match
                  : mismatch);
          int left = matrix[i][j - 1] + gap;
          int up = matrix[i - 1][j] + gap;
          int maximum = [diagonal, left, up, 0].reduce(max);

          // Store the score in the matrix
          matrix[i][j] = maximum;
        }
      }

      // Trace back the matrix to find the alignment
      List<String> alignedTypedWords = [];
      List<String> alignedOriginalWords = [];
      int i = typedWords.length;
      int j = originalWordsToCompare.length;
      while (i > 0 && j > 0) {
        // Find the maximum score among the neighboring cells
        int diagonal = matrix[i - 1][j - 1];
        int left = matrix[i][j - 1];
        int up = matrix[i - 1][j];
        int maximum = [diagonal, left, up].reduce(max);

        // Move to the cell with the maximum score
        if (maximum == diagonal) {
          // Match or mismatch
          alignedTypedWords.add(typedWords[i - 1]);

          alignedOriginalWords.add(originalWordsToCompare[j - 1]);
          i--;
          j--;
        } else if (maximum == left) {
          // Gap in the typed word
          alignedTypedWords.add('');
          alignedOriginalWords.add(originalWordsToCompare[j - 1]);
          j--;
        } else {
          // Gap in the original word

          alignedTypedWords.add(typedWords[i - 1]);
          alignedOriginalWords.add('');
          i--;
        }
      }

      // Reverse the alignment lists
      alignedTypedWords = alignedTypedWords.reversed.toList();
      alignedOriginalWords = alignedOriginalWords.reversed.toList();

      // Count the correct, incorrect, and omitted words
      int correctWords = 0;
      int incorrectWords = 0;
      int omittedWords = 0;
      int halfMistakes = 0;
      int fullMistakes = 0;

      for (int k = 0;
          k < alignedTypedWords.length && k < alignedOriginalWords.length;
          k++) {
        if (alignedTypedWords[k] == alignedOriginalWords[k]) {
          // String a = alignedTypedWords[k];
          // String b = alignedOriginalWords[k];
          // print('a = $a ,b =$b');
          correctWords++;
        } else if (alignedTypedWords[k] == '') {
          // String a = alignedTypedWords[k];
          // print('aa =$a');
          omittedWords++;
        } else if (alignedOriginalWords[k] == '') {
          // String b = alignedOriginalWords[k];
          // print('bb = $b');
          incorrectWords++;
        } else {
          // print('in else');
          // String a = alignedTypedWords[k];
          // String b = alignedOriginalWords[k];
          // print('aaa = $a ,bbb =$b');
          incorrectWords++;
          int distance = levenshteinDistance(alignedTypedWords[k].toLowerCase(),
              alignedOriginalWords[k].toLowerCase());
          if (distance <= alignedTypedWords[k].length ~/ 2) {
            halfMistakes++;
          } else {
            fullMistakes++;
          }
        }
      }

      _testModel.wordsTyped = typedWords.length;
      _testModel.correctWords = correctWords;
      _testModel.incorrectWords = incorrectWords;
      _testModel.wpm = ((typedWords.length / timerValue) * 60).toInt();
      _testModel.accuracy = ((correctWords / typedWords.length) * 100).toInt();
      // print('omitted: $omittedWords, original: $originalWords.length , max: $maxComparisonLength');
      _testModel.omittedWords = (typedWords.length * 2 < originalWords.length)
          ? omittedWords + (originalWords.length - maxComparisonLength)
          : omittedWords;
      // _testModel.omittedWords = omittedWords;
      _testModel.halfMistake = halfMistakes;
      _testModel.fullMistake = fullMistakes;
      _testModel.totalWords = originalWords.length;
      _testModel.extraSpaces = extraSpaces;
    }

    notifyListeners();
  }

  int levenshteinDistance(String a, String b) {
    int m = a.length;
    int n = b.length;

    List<List<int>> dp =
        List.generate(m + 1, (index) => List<int>.filled(n + 1, 0));

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

// Death on a cross in the time of the Romans and previously was one of the ugliest and worst ways of execution, and the most painful.

// Future<void> calculateWords() async {
//   final typedText = _testModel.typedText;
//   final originalText = _testModel.originalText;
//   final timerValue = _testModel.timeTaken;
//
//   if (typedText.isEmpty) {
//     _testModel.wordsTyped = 0;
//     _testModel.correctWords = 0;
//     _testModel.incorrectWords = 0;
//     _testModel.wpm = 0;
//     _testModel.accuracy = 100;
//     _testModel.omittedWords = originalText.split(' ').length;
//     _testModel.halfMistake = 0;
//     _testModel.fullMistake = 0;
//
//   } else {
//     List<String> typedWords = typedText.split(' ');
//     List<String> originalWords = originalText.split(' ');
//
//     int correctWords = 0;
//     int halfMistakes = 0;
//     int fullMistakes = 0;
//     for (int i = 0; i < typedWords.length && i < originalWords.length; i++) {
//       if (typedWords[i] == originalWords[i]) {
//         correctWords++;
//       }
//       else {
//         // Call a function to determine if it's a half or full mistake
//         int distance = levenshteinDistance(typedWords[i].toLowerCase(), originalWords[i].toLowerCase());
//         if (distance <= typedWords[i].length ~/ 2) {
//           halfMistakes++;
//         } else {
//           fullMistakes++;
//         }
//       }
//     }
//
//     _testModel.wordsTyped = typedWords.length;
//     _testModel.correctWords = correctWords;
//     _testModel.incorrectWords = typedWords.length - correctWords;
//     _testModel.wpm = ((typedWords.length / timerValue) * 60).toInt();
//     _testModel.accuracy = ((correctWords / typedWords.length) * 100).toInt();
//     _testModel.omittedWords =originalWords.length - typedWords.length;
//     _testModel.halfMistake = halfMistakes;
//     _testModel.fullMistake = fullMistakes;
//   }
//
//   notifyListeners();
// }

// Smith-Waterman algorithm Needleman Wunsch algorithm
