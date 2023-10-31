import 'package:flutter/material.dart';
import 'package:typingtest/view/screens/history_screen.dart';

class HistoryDialog extends StatelessWidget {
  final String targetExamName;
  const HistoryDialog({required this.targetExamName,super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // adjust as needed
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,  // Adjust as needed
        height: MediaQuery.of(context).size.height * 0.85, // Adjust as needed
        child: HistoryScreen(popup: true,examName: targetExamName,),  // Your current ResultScreen content
      ),
    );
  }
}
