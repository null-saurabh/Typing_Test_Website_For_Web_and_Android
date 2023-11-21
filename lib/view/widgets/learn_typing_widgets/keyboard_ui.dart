import 'package:flutter/material.dart';

class KeyboardWidget extends StatelessWidget {
  final String currentLetter;
  const KeyboardWidget({required this.currentLetter,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildRow({
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
            buildRow({
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
            buildRow({
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
            buildRow({
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
            buildRow({
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

  Widget buildRow(Map<String, double> keys) {
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
