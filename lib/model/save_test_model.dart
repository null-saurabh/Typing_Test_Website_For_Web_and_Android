import 'package:flutter/cupertino.dart';

class TestModel {
  String typedText = "";
  String originalText = "";// Add the original text field
  int timeTaken = 0;
  int backSpaceCount = 0;
  int wordsTyped = 0;
  int totalWords = 0;
  int correctWords = 0;
  int incorrectWords = 0;
  int wpm = 0;
  int accuracy =0;
  int halfMistake = 0;
  int fullMistake = 0;
  int omittedWords =0;
  int extraSpaces = 0;
  int extraWords = 0;
  RichText markedTypedText = RichText( text: const TextSpan (text: ''));
}