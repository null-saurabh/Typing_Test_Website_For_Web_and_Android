import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class KeyboardWidget extends StatelessWidget {
  final String currentLetter;
  const KeyboardWidget({required this.currentLetter,super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) => buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context){
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildDesktopRow({
              "`": 40.0,
              "1": 40.0,
              "2": 40.0,
              "3": 40.0,
              "4": 40.0,
              "5": 40.0,
              "6": 40.0,
              "7": 40.0,
              "8": 40.0,
              "9": 40.0,
              "0": 40.0,
              "-": 40.0,
              "=": 40.0,
              "Backspace": 80.0
            }),
            buildDesktopRow({
              "Tab": 60.0,
              "Q": 40.0,
              "W": 40.0,
              "E": 40.0,
              "R": 40.0,
              "T": 40.0,
              "Y": 40.0,
              "U": 40.0,
              "I": 40.0,
              "O": 40.0,
              "P": 40.0,
              "[": 40.0,
              "]": 40.0,
              "\\": 60.0
            }),
            buildDesktopRow({
              "Caps": 85.0,
              "A": 40.0,
              "S": 40.0,
              "D": 40.0,
              "F": 40.0,
              "G": 40.0,
              "H": 40.0,
              "J": 40.0,
              "K": 40.0,
              "L": 40.0,
              ";": 40.0,
              '\'': 40.0,
              "Enter": 85.0
            }),
            buildDesktopRow({
              "L Shift": 110.0,
              "Z": 40.0,
              "X": 40.0,
              "C": 40.0,
              "V": 40.0,
              "B": 40.0,
              "N": 40.0,
              "M": 40.0,
              ",": 40.0,
              ".": 40.0,
              "/": 40.0,
              "R Shift": 110.0
            }),
            buildDesktopRow({
              "L Ctrl": 40.0,
              "L fn": 40.0,
              "Win": 40.0,
              "L Alt": 40.0,
              "Space": 380.0,
              "R Alt": 40.0,
              "R fn": 40.0,
              "R Ctrl": 40.0
            }),
          ],
        ),
      ),
    );
  }
  Widget buildMobileLayout(BuildContext context){
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(2.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildMobileRow({
              "`": 30.0,
              "1": 30.0,
              "2": 30.0,
              "3": 30.0,
              "4": 30.0,
              "5": 30.0,
              "6": 30.0,
              "7": 30.0,
              "8": 30.0,
              "9": 30.0,
              "0": 30.0,
              "-": 30.0,
              "=": 30.0,
              "Backspace": 72.0
            }),
            buildMobileRow({
              "Tab": 51.0,
              "Q": 30.0,
              "W": 30.0,
              "E": 30.0,
              "R": 30.0,
              "T": 30.0,
              "Y": 30.0,
              "U": 30.0,
              "I": 30.0,
              "O": 30.0,
              "P": 30.0,
              "[": 30.0,
              "]": 30.0,
              "\\": 51.0
            }),
            buildMobileRow({
              "Caps": 70.0,
              "A": 30.0,
              "S": 30.0,
              "D": 30.0,
              "F": 30.0,
              "G": 30.0,
              "H": 30.0,
              "J": 30.0,
              "K": 30.0,
              "L": 30.0,
              ";": 30.0,
              '\'': 30.0,
              "Enter": 67.0
            }),
            buildMobileRow({
              "L Shift": 85,
              "Z": 30.0,
              "X": 30.0,
              "C": 30.0,
              "V": 30.0,
              "B": 30.0,
              "N": 30.0,
              "M": 30.0,
              ",": 30.0,
              ".": 30.0,
              "/": 30.0,
              "R Shift": 85
            }),
            buildMobileRow({
              "L Ctrl": 40.0,
              "L fn": 30.0,
              "Win": 30.0,
              "L Alt": 40.0,
              "Space": 236.0,
              "R Alt": 40.0,
              "R fn": 30.0,
              "R Ctrl": 40.0
            }),
          ],
        ),
      ),
    );
  }




  Widget buildDesktopRow(Map<String, double> keys) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: keys.entries
            .map(
              (entry) => Container(
            width: entry.value,
            height: 40.0,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: getKeyColor(entry.key),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(entry.key,
                style: const TextStyle(color: Colors.white)),
          ),
        )
            .toList(),
      ),
    );
  }
  Widget buildMobileRow(Map<String, double> keys) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: keys.entries
            .map(
              (entry) => Container(
            width: entry.value,
            height: 25.0,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: getKeyColor(entry.key),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(entry.key,
                style: const TextStyle(color: Colors.white)),
          ),
        ).toList(),
      ),
    );
  }


  Color getKeyColor(String key) {

    Set<String> rightShiftLetters = {'Q', 'W', 'E', 'R', 'T', 'A', 'S', 'D', 'F', 'G', 'Z', 'X', 'C', 'V','~','!','@','#','\$','%'};

    Set<String> leftShiftLetters = {'Y', 'U', 'I', 'O', 'P', 'H','J', 'K', 'L', 'B', 'N', 'M','{', '}',':', '"','<', '>', '?', '^', '&', '*', '(', ')', '_', '+' };

    Set<List<String>> specialCases = {
      ['[', '{'],
      [']', '}'],
      ['\\', '|'],
      [';', ':'],
      ['\'', '"'],
      [',', '<'],
      ['.', '>'],
      ['/', '?'],
      ['`', '~'],
      ['2', '@'],
      ['1', '!'],
      ['4', '\$'],
      ['5', '%'],
      ['6', '^'],
      ['7', '&'],
      ['8', '*'],
      ['9', '('],
      ['0', ')'],
      ['-', '_'],
      ['=', '+'],
    };

    if (key == currentLetter.toUpperCase()) {
      return Colors.green;
    }
    else if(key == 'Space' &&currentLetter == " "){
      return Colors.green;
    }
    else if (currentLetter == currentLetter.toUpperCase()) {
      if(key == 'R Shift' && rightShiftLetters.contains(currentLetter)){
        return Colors.green;
      }
      else if(key == 'L Shift' && leftShiftLetters.contains(currentLetter)){
        return Colors.green;
      }

    }
    if (specialCases.any((pair) => pair[0] == key && pair[1] == currentLetter)) {
      return Colors.green;
    }

    return const Color(0xff369CBC); // Default color for other keys
  }
}
