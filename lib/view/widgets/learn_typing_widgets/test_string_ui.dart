import 'package:flutter/material.dart';

class TestStringUi extends StatelessWidget {
  const TestStringUi({
    super.key,
    required this.typedString,
    required this.currentLetter,
    required this.remainingString,
  });

  final String typedString;
  final String currentLetter;
  final String remainingString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: const Color(0xff369CBC).withOpacity(0.05),
            borderRadius: BorderRadius.circular(0.0),
            border: Border.all(color: const Color(0xff369CBC).withOpacity(0.2))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true, // Set reverse to true
                child: Text(
                  typedString,
                  style: const TextStyle(
                      fontSize: 40.0, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(width: 4,),
            Container(
              width: 40, // Adjust the width as needed
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: const Color(0xff369CBC))
              ),
              padding: const EdgeInsets.all(2.5 ),
              child: Center(
                child: Text(
                  currentLetter,
                  style: const TextStyle(fontSize: 40.0, color: Color(0xff369CBC)),
                ),
              ),
            ),
            const SizedBox(width: 4,),

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  remainingString,
                  style:
                  const TextStyle(fontSize: 40, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}