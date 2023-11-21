import 'package:flutter/material.dart';

class LeftHandImage extends StatelessWidget {
  final String currentLetter;

  const LeftHandImage({super.key, required this.currentLetter});

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/images/LeftHand.png'; // Default image
    Set<String> leftShiftLetters = {'Y', 'U', 'I', 'O', 'P', 'H','J', 'K', 'L', 'B', 'N', 'M','{', '}',':', '"','<', '>', '?', '^', '&', '*', '(', ')', '_', '+' };


    if (currentLetter == ' ') {
      imagePath = 'assets/images/L5.png';
    } else if (currentLetter == '`' ||currentLetter == '~' ||currentLetter == '1' || currentLetter == '!' ||currentLetter.toLowerCase() == 'q' ||currentLetter.toLowerCase() == 'a' ||currentLetter.toLowerCase() == 'z' || leftShiftLetters.contains(currentLetter)) {
      imagePath = 'assets/images/L1.png';
    } else if (currentLetter == '2' || currentLetter == '@' ||currentLetter.toLowerCase() == 'w' || currentLetter.toLowerCase() == 's' ||currentLetter.toLowerCase() == 'x') {
      imagePath = 'assets/images/L2.png';
    } else if (currentLetter == '3' ||currentLetter == '#' || currentLetter.toLowerCase() == 'e' ||currentLetter.toLowerCase() == 'd' ||currentLetter.toLowerCase() == 'c') {
      imagePath = 'assets/images/L3.png';
    }else if (currentLetter == '4' || currentLetter == '5' ||currentLetter == '\$' ||currentLetter == '%' ||currentLetter.toLowerCase() == 'r' ||currentLetter.toLowerCase() == 't' ||currentLetter.toLowerCase() == 'f' ||currentLetter.toLowerCase() == 'g'||currentLetter.toLowerCase() == 'v'||currentLetter.toLowerCase() == 'b') {
      imagePath = 'assets/images/L4.png';
    }
    return Image.asset(imagePath);
  }
}