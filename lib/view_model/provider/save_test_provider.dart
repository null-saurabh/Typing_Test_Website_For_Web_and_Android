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






// Christ was beaten and whipped almost to death even before he was crucified. To the Jews, God had cursed the person who was crucified. Therefore, the apostle Paul described the reason Christ had to die on the cross. The Book of Job records their discussions on why such misfortune happened to Job.  Their conversation spans many chapters.  In summary, his friends tell Job that such great misfortune only comes on evil people, so Job must have secretly sinned.  If he would confess these sins then perhaps he would be granted forgiveness.  But Job continually replies that he is blameless of wrong-doing.  He cannot understand why misfortunes have come upon him. Though he did not understand why his tragedies had come upon him, he knew that there was a 'Redeemer' coming to the earth.  The redeemer is someone who can make a sufficient payment for his sins. Job calls the Redeemer 'my Redeemer' so he knew the redeemer was coming for him.  After Job's 'skin has been destroyed' (he has died) he would see God in his flesh. But there is a widespread theory that Judas was transformed to look like Isa al Masih. Then the Jews arrested Judas (who now looked like Isa), the Romans crucified Judas (still resembling Isa), and finally Judas was buried (still looking like Isa).  In this theory Isa al Masih went directly to heaven without dieing.  Though neither the Quran nor the Injil anywhere describes such an elaborate scheme, it is widely promoted. So let's examine this theory. Notice how the Jewish leaders took great effort to stop their message. Like governments today who are afraid of new movements they arrested, threatened, beat and then finally killed (some) disciples to try to stop them.  These disciples proclaimed their message in Jerusalem - the same city where only a few weeks earlier someone with the appearance of Isa al Masih had been publicly executed and buried.  But who was executed? The prophet? Or Judas made to look like him?Let's assume the theory. Another study conducted four rounds of surveys across 27 districts in 9 states to provide regular district-level updates on the rapidly evolving situation across some of India's most vulnerable populations due to Covid-19. The survey topics covered in the first round were Covid-19 awareness, migration impacts, food insecurity and economic impacts. Around 43% respondents reported that they themselves or someone in their household reduced portions or gave up a meal altogether since the lockdown, whereas around 55% of respondents reported that they stopped eating certain food items during the same period. A telephonic survey of around 700 anganwadis in Jharkhand revealed that more than 80% anganwadi workers had distributed take home ration, however less than 50% provided additional ration to severely wasted and underweight children. We're in process to get more data with the help of state governments and civil society organisations.What is the present status of the malnutrition alleviation projects?Government of India has taken many initiatives in a mission mode. However, across the states there are gaps that require immediate attention to strengthen the inputs and the pillars of Poshan Abhiyaan. The binding constraints in implementation are gaps in human resources, particularly at the supervisory level, procurement of growth monitoring devices and smartphones, and likelihood of attrition in the quality of data collected through Integrated Child Development Services-Common Application Software, fund utilisation, convergence at grassroots level, capacity building etc.How badly has Covid-19 set back our malnutrition eradication goals? Thus, Vietnam finds itself in a sweet spot today. It has contained Covid, weathered most of the economic storm, and has the right ingredients to take full economic advantage of the post-Covid scenario. Vietnam, in tackling Covid effectively, has demonstrated its organisation skills. That, combined with a pro-business government, is certainly reassuring for foreign investors and multinational firms. Covid-19 has been a difficult time and the lockdown limited outreach. However, there is limited evidence from some cases. What we get is greater mastery over time. We can luxuriate in it, as we languidly pick viewing options that interest us, we can crunch it up as we binge-watch our way through shows, we can start a series, get bored of it, and pick it up again when the mood strikes. The mode of viewing is a significant change from the passivity of TV, where we had no option but to surrender to what was served to us. There is a new sense of agency in the OTT viewership experience, both in terms of watching what we want when we want to, as also discovering things to watch in the first place. The kind of programming we see on these platforms strikes a refreshingly new note. The idea of a serial on chess, or a documentary on an unhinged sub-culture that collects big cats, or a feature about Indian arranged marriages would have been no one's idea of riveting television, and yet they have become sensations in the streaming world. The subscription model ensures that while programming is aligned to the market, every show is not a source of independent revenue and hence is allowed breathing room to experiment. Of course, it is important for shows to do well in terms of viewership, but the creators do not suffer the same level of anxiety in their conception because of this relative freedom. This is most noticeable in the kind of content that is being produced in India, which is a big departure from what was dished out on mainstream TV channels. There is also the confidence that compelling stories will eventually get discovered because word-of-mouth has the power to light up the darkest corners of any catalogue. Unlike cinema, where there is an urgent need to get people to the theatre in the short window available on the movie's release, or even in television where viewers need to tune in at a specific time. That said, I do believe that multilateralism needs to adapt to changing circumstances. For, the multilateral order that came into existence after the Second World War was essentially based on the principle that richer nations should help developing or underdeveloped nations. But two things happened that weren't foreseen. First, many of the developing and under-developed nations improved their development status considerably. A case in point is China which has seen exponential economic growth over the last three decades and can't really be considered a developing nation. After all, China today is going toe-to-toe with the US in terms of economic and technological might. This is precisely why Trump came to power in the US. He latched on to the American impulse to defend American jobs and industries many of which were lost to competition from China. Therefore, for the multilateral system to continue treating countries like China as developing and not hold them to higher standards on things like trade and global warming is just silly. The second issue is that as developing countries improved their development status, they gradually came to resent the paradigm of assistance they were receiving from the developed nations. For, that paradigm involved assistance in lieu of supporting the developed nations in the international arena. In other words, the Global South was obligated to support the Global North who in turn would maintain their hegemony on the levers of the multilateral system. This kind of multilateralism is again unsustainable as it is high time that developing nations get an equal position at the international high table. This would necessarily include the reform of the UN Security Council to include permanent members from the Global South, as well as leadership inclusion at other international forums. This is where Bourita's comment on solidarity-based multilateralism gains salience. Morocco, under the guidance of King Mohammed VI, has been championing South-South cooperation for some years now. Under this rubric it has significantly enhanced development cooperation with sister African nations with the philosophy of finding African solutions for African problems.