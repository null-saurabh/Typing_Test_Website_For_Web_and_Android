import 'package:flutter/material.dart';

class RightHandImage extends StatelessWidget {
  final String currentLetter;

  const RightHandImage({super.key, required this.currentLetter});

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/images/RightHand.png'; // Default image
    Set<String> rightShiftLetters = {'Q', 'W', 'E', 'R', 'T', 'A', 'S', 'D', 'F', 'G', 'Z', 'X', 'C', 'V','~','!','@','#','\$','%'};

    if (currentLetter == ' ') {
      imagePath = 'assets/images/R1.png';
    } else if (currentLetter.toLowerCase() == 'y' || currentLetter.toLowerCase() == 'u' ||currentLetter.toLowerCase()== 'h' ||currentLetter.toLowerCase() == 'j' ||currentLetter.toLowerCase() == 'n' ||currentLetter.toLowerCase() == 'm' ||currentLetter == '6' ||currentLetter == '^' ||currentLetter == '7'|| currentLetter == '&') {
      imagePath = 'assets/images/R2.png';
    } else if (currentLetter.toLowerCase() == 'i' || currentLetter.toLowerCase() == 'k' ||currentLetter == ',' ||currentLetter == '<' ||currentLetter == '8'||currentLetter == '*') {
      imagePath = 'assets/images/R3.png';
    } else if (currentLetter == '9' ||currentLetter == '('|| currentLetter.toLowerCase() == 'o' ||currentLetter.toLowerCase() == 'l' ||currentLetter == '.' ||currentLetter == '>') {
      imagePath = 'assets/images/R4.png';
    }else if (currentLetter == '0' ||currentLetter == ')'||currentLetter == '-'||currentLetter == '='||currentLetter == '_'||currentLetter == '+'|| rightShiftLetters.contains(currentLetter)|| currentLetter.toLowerCase() == 'p' ||currentLetter == '[' ||currentLetter == '{' ||currentLetter == ']' ||currentLetter == '}'||currentLetter == '|'||currentLetter == '\\'||currentLetter == ';'||currentLetter == ':'||currentLetter == '"'||currentLetter == '\''||currentLetter == '/' ||currentLetter == '?') {
      imagePath = 'assets/images/R5.png';
    }
    return Image.asset(imagePath);
  }
}
