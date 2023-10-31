import 'package:flutter/material.dart';
import 'package:typingtest/view/screens/result_screen.dart';

class ResultDialog extends StatelessWidget {
  final String examName;
  const ResultDialog({
    required this.examName,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),

        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,  // Adjust as needed
          height: MediaQuery.of(context).size.height * 0.95, // Adjust as needed
          child: ResultScreen(examName: examName,),  // Your current ResultScreen content
        ),
      ),
    );
  }
}
