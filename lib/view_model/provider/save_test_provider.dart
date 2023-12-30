// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:typingtest/model/save_test_model.dart';
//
// class TestCalculatorProvider with ChangeNotifier {
//   TestModel _testModel = TestModel();
//
//   TestModel get testModel => _testModel;
//
//   void startNewTest() {
//     _testModel = TestModel();
//   }
//
//   void updateTypedText(String text) {
//     _testModel.typedText = text;
//     notifyListeners();
//   }
//
//   void updateOriginalText(String text) {
//     _testModel.originalText = text;
//     // print(testModel.originalText);
//   }
//
//   void updateTimeTaken(int value) {
//     _testModel.timeTaken = value;
//     notifyListeners();
//   }
//
//   void updateBackspace() {
//     _testModel.backSpaceCount++;
//     notifyListeners();
//   }
//
//   Future<void> submitTest() async {
//     await calculateResult();
//   }
//
//
//   Future<void> calculateResult() async {
//     final typedText = _testModel.typedText;
//     final originalText = _testModel.originalText;
//     final timerValue = _testModel.timeTaken;
//     print(typedText);
//     print(originalText);
//
//     if (typedText.isEmpty) {
//       _testModel.wordsTyped = 0;
//       _testModel.correctWords = 0;
//       _testModel.incorrectWords = 0;
//       _testModel.wpm = 0;
//       _testModel.accuracy = 100;
//       _testModel.omittedWords = originalText.split(' ').length;
//       _testModel.halfMistake = 0;
//       _testModel.fullMistake = 0;
//       _testModel.totalWords = originalText.split(' ').length;
//
//     } else {
//       List<String> typedWordsWithSpaces = typedText.split(' ');
//       int extraSpaces = typedWordsWithSpaces.length -
//           typedWordsWithSpaces.where((word) => word.isNotEmpty).length;
//
//       List<String> typedWords =
//           typedText.split(' ').where((word) => word.isNotEmpty).toList();
//       List<String> originalWords = originalText.split(' ');
//
//       int maxComparisonLength = typedWords.length * 2 < originalWords.length
//           ? (typedWords.length * 2) - 1
//           : originalWords.length;
//       // int maxComparisonLength = max(typedWords.length, originalWords.length) -1;
//
//       List<String> originalWordsToCompare =
//           originalWords.sublist(0, maxComparisonLength);
//       List<List<int>> matrix = List.generate(typedWords.length + 1,
//           (i) => List.filled(originalWordsToCompare.length + 1, 0));
//
//       // Define the gap penalty and the match/mismatch score
//       int gap = -1;
//       int match = 1;
//       int mismatch = -1;
//
//       // Fill the matrix with scores
//       for (int i = 1; i <= typedWords.length; i++) {
//         for (int j = 1; j <= originalWordsToCompare.length; j++) {
//           // Calculate the score for each cell
//           int diagonal = matrix[i - 1][j - 1] +
//               (typedWords[i - 1] == originalWordsToCompare[j - 1]
//                   ? match
//                   : mismatch);
//           int left = matrix[i][j - 1] + gap;
//           int up = matrix[i - 1][j] + gap;
//           int maximum = [diagonal, left, up].reduce(max);
//
//           // Store the score in the matrix
//           matrix[i][j] = maximum;
//         }
//       }
//
//       // Trace back the matrix to find the alignment
//       List<String> alignedTypedWords = [];
//       List<String> alignedOriginalWords = [];
//       int i = typedWords.length;
//       int j = originalWordsToCompare.length;
//       while (i > 0 && j > 0) {
//         // Find the maximum score among the neighboring cells
//         int diagonal = matrix[i - 1][j - 1];
//         int left = matrix[i][j - 1];
//         int up = matrix[i - 1][j];
//         int maximum = [diagonal, left, up].reduce(max);
//
//         // Move to the cell with the maximum score
//         if (maximum == diagonal) {
//           // Match or mismatch
//           alignedTypedWords.add(typedWords[i - 1]);
//           alignedOriginalWords.add(originalWordsToCompare[j - 1]);
//           i--;
//           j--;
//         } else if (maximum == left) {
//           // Gap in the typed word
//           alignedTypedWords.add('');
//           alignedOriginalWords.add(originalWordsToCompare[j - 1]);
//           j--;
//         } else {
//           // Gap in the original word
//           alignedTypedWords.add(typedWords[i - 1]);
//           alignedOriginalWords.add('');
//           i--;
//         }
//       }
//
//       // Reverse the alignment lists
//       alignedTypedWords = alignedTypedWords.reversed.toList();
//       alignedOriginalWords = alignedOriginalWords.reversed.toList();
//
//       // Count the correct, incorrect, and omitted words
//       int correctWords = 0;
//       int incorrectWords = 0;
//       int omittedWords = 0;
//       int halfMistakes = 0;
//       int fullMistakes = 0;
//       int extraWords = 0;
//       List<InlineSpan> inlineSpans = [];
//
//       for (int k = 0;
//           k < alignedTypedWords.length && k < alignedOriginalWords.length;
//           k++) {
//         if (alignedTypedWords[k] == alignedOriginalWords[k]) {
//           String a = alignedTypedWords[k];
//           // String b = alignedOriginalWords[k];
//           print('a = $a');
//           correctWords++;
//           inlineSpans.add(TextSpan(text: '${alignedTypedWords[k]} '));
//         } else if (alignedTypedWords[k] == '') {
//           String a = alignedTypedWords[k];
//           print('b =$a');
//           omittedWords++;
//           inlineSpans.add(
//             TextSpan(
//               text: '${alignedOriginalWords[k]} ',
//               style: const TextStyle(color: Colors.blue),
//             ),
//           );
//         } else if (alignedOriginalWords[k] == '') {
//           String a = alignedOriginalWords[k];
//           print('c = $a');
//           incorrectWords++;
//           extraWords++;
//           inlineSpans.add(
//             TextSpan(
//               text: '${alignedTypedWords[k]} ',
//               style: const TextStyle(color: Colors.purple),
//             ),
//           );
//         } else {
//           // print('in else');
//           String a = alignedTypedWords[k];
//           // String b = alignedOriginalWords[k];
//           print('d = $a');
//           incorrectWords++;
//           inlineSpans.add(
//             TextSpan(
//               text: '${alignedTypedWords[k]} ',
//               style: const TextStyle(color: Colors.red),
//             ),
//           );
//           int distance = levenshteinDistance(alignedTypedWords[k].toLowerCase(),
//               alignedOriginalWords[k].toLowerCase());
//           if (distance <= alignedTypedWords[k].length ~/ 2) {
//             halfMistakes++;
//           } else {
//             fullMistakes++;
//           }
//         }
//       }
//
//       _testModel.wordsTyped = typedWords.length;
//       _testModel.correctWords = correctWords;
//       _testModel.incorrectWords = incorrectWords;
//       _testModel.wpm = ((typedWords.length / timerValue) * 60).toInt();
//       _testModel.accuracy = ((correctWords / typedWords.length) * 100).toInt();
//       // print('omitted: $omittedWords, original: $originalWords.length , max: $maxComparisonLength');
//       _testModel.omittedWords = (typedWords.length * 2 < originalWords.length)
//           ? omittedWords
//           : omittedWords;
//       // _testModel.omittedWords = omittedWords;
//       _testModel.halfMistake = halfMistakes;
//       _testModel.fullMistake = fullMistakes;
//       _testModel.totalWords = originalWords.length;
//       _testModel.extraSpaces = extraSpaces;
//       _testModel.extraWords = extraWords;
//       _testModel.markedTypedText = RichText(text: TextSpan(children: inlineSpans));
//
//       print(RichText(text: TextSpan(children: inlineSpans)));
//
//
//     }
//
//     notifyListeners();
//   }
//
//
//
//   int levenshteinDistance(String a, String b) {
//     int m = a.length;
//     int n = b.length;
//
//     List<List<int>> dp =
//         List.generate(m + 1, (index) => List<int>.filled(n + 1, 0));
//
//     for (int i = 0; i <= m; i++) {
//       for (int j = 0; j <= n; j++) {
//         if (i == 0) {
//           dp[i][j] = j;
//         } else if (j == 0) {
//           dp[i][j] = i;
//         } else {
//           dp[i][j] = min(
//             dp[i - 1][j] + 1,
//             min(
//               dp[i][j - 1] + 1,
//               dp[i - 1][j - 1] + (a[i - 1] == b[j - 1] ? 0 : 1),
//             ),
//           );
//         }
//       }
//     }
//
//     return dp[m][n];
//   }
// }


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
    await calculateResult();
  }


  Future<void> calculateResult() async {
    final typedText = _testModel.typedText;
    final originalText = _testModel.originalText;
    final timerValue = _testModel.timeTaken;
    // print(typedText);
    // print(originalText);

    if (typedText.isEmpty) {
      _testModel.wordsTyped = 0;
      _testModel.correctWords = 0;
      _testModel.incorrectWords = 0;
      _testModel.grossWpm = 0;
      _testModel.netWpm = 0;
      _testModel.accuracy = 100;
      _testModel.omittedWords = originalText.split(' ').length;
      _testModel.halfMistake = 0;
      _testModel.fullMistake = 0;
      _testModel.totalWords = originalText.split(' ').length;

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
      // int maxComparisonLength = max(typedWords.length, originalWords.length) -1;

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
          int maximum = [diagonal, left, up].reduce(max);

          // Store the score in the matrix
          matrix[i][j] = maximum;
        }
      }

      // Trace back the matrix to find the alignment
      List<String> alignedTypedWords = [];
      List<String> alignedOriginalWords = [];
      List<bool> correctWordFlags = [];
      List<bool> extraWordFlags = [];

      int i = typedWords.length;
      int j = originalWordsToCompare.length;

      while (i > 0 || j > 0) {
        if (i > 0 && j > 0 && typedWords[i - 1] == originalWordsToCompare[j - 1]) {
          alignedTypedWords.add(typedWords[i - 1]);
          alignedOriginalWords.add(originalWordsToCompare[j - 1]);
          correctWordFlags.add(true);
          extraWordFlags.add(false);
          i--;
          j--;
        } else if (j > 0 && (i == 0 || matrix[i][j - 1] >= matrix[i - 1][j])) {
          alignedTypedWords.add('');
          alignedOriginalWords.add(originalWordsToCompare[j - 1]);
          correctWordFlags.add(false);
          extraWordFlags.add(true);
          j--;
        } else {
          alignedTypedWords.add(typedWords[i - 1]);
          alignedOriginalWords.add('');
          correctWordFlags.add(false);
          extraWordFlags.add(false);
          i--;
        }
      }

      // Reverse the alignment lists
      alignedTypedWords = alignedTypedWords.reversed.toList();
      alignedOriginalWords = alignedOriginalWords.reversed.toList();
      correctWordFlags = correctWordFlags.reversed.toList();
      extraWordFlags = extraWordFlags.reversed.toList();

      // Count the correct, incorrect, and omitted words
      int correctWords = 0;
      int incorrectWords = 0;
      int omittedWords = 0;
      int halfMistakes = 0;
      int fullMistakes = 0;
      int extraWords = 0;
      List<InlineSpan> inlineSpans = [];
      int overOmitted = 0;
      bool isIncorrect = false;

      for (int k = 0;
      k < alignedTypedWords.length && k < alignedOriginalWords.length;
      k++) {
        if (correctWordFlags[k]) {
          // String a = alignedTypedWords[k];
          // print('a = $a');
          correctWords++;
          overOmitted =0;
          isIncorrect = false;
          inlineSpans.add(TextSpan(text: '${alignedTypedWords[k]} '));
        } else if (alignedTypedWords[k].isEmpty) {
          // String a = alignedTypedWords[k];
          // print('b =$a');
          if (isIncorrect) {
            omittedWords++;
            overOmitted++;
            inlineSpans.add(
              TextSpan(
                text: '[${alignedOriginalWords[k]}] ',
                style: const TextStyle(color: Colors.grey),
              ),
            );
          }
          else {
            omittedWords++;
            overOmitted++;
            inlineSpans.add(
              TextSpan(
                text: '[${alignedOriginalWords[k]}] ',
                style: const TextStyle(color: Colors.red,decoration: TextDecoration.lineThrough,),

              ),
            );
          }
          isIncorrect = false;

        } else if (extraWordFlags[k]) {
          // The word is extra
          // print('in extra');
          extraWords++;
          // negativeOmitted++;
          inlineSpans.add(
            TextSpan(
              text: '${alignedTypedWords[k]} ',
              style: const TextStyle(color: Colors.purple),
            ),
          );
        } else {
          // print('in else');
          // String a = alignedTypedWords[k];
          // print('d = $a');
          incorrectWords++;
          isIncorrect = true;

          int distance = levenshteinDistance(alignedTypedWords[k].toLowerCase(),
              alignedOriginalWords[k+1].toLowerCase());
          if (distance <= alignedTypedWords[k].length ~/ 2) {
            halfMistakes++;
            inlineSpans.add(
              TextSpan(
                text: '${alignedTypedWords[k]} ',
                style: const TextStyle(color: Colors.orange),
              ),
            );
          } else {
            fullMistakes++;
            inlineSpans.add(
              TextSpan(
                text: '${alignedTypedWords[k]} ',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
        }
      }


      _testModel.wordsTyped = typedWords.length;
      _testModel.correctWords = correctWords;
      _testModel.incorrectWords = incorrectWords;
      _testModel.grossWpm = ((typedWords.length / timerValue) * 60).toInt();
      _testModel.netWpm = (((typedWords.length - incorrectWords) / timerValue) * 60).toInt();
      _testModel.accuracy = ((correctWords / typedWords.length) * 100).toInt();
      // print(' max: $maxComparisonLength  over:$overOmitted',);
      // print('omitted: $omittedWords, typed: $typedWords.length , incorrect: $incorrectWords');
      _testModel.omittedWords = (typedWords.length * 2 < originalWords.length)
          ? omittedWords - overOmitted - incorrectWords
          : omittedWords;
      _testModel.halfMistake = halfMistakes;
      _testModel.fullMistake = fullMistakes;
      _testModel.totalWords = originalWords.length;
      _testModel.extraSpaces = extraSpaces;
      _testModel.extraWords = extraWords;

      List<InlineSpan> slicedInlineSpans = inlineSpans.sublist(0, inlineSpans.length - overOmitted);
      _testModel.markedTypedText = RichText(text: TextSpan(children: slicedInlineSpans));

      // print(RichText(text: TextSpan(children: inlineSpans)));

    }

    notifyListeners();
  }


  int levenshteinDistance(String a, String b) {
    int m = a.length;
    int n = b.length;
    print(a);
    print(b);

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