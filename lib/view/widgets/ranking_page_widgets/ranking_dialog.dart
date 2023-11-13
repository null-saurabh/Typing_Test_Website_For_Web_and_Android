import 'package:flutter/material.dart';
import '../../screens/ranking_page.dart';

class RankingDialog extends StatelessWidget {
  final int testId;
  const RankingDialog({required this.testId,super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // adjust as needed
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,  // Adjust as needed
        height: MediaQuery.of(context).size.height * 0.85, // Adjust as needed
        child: RankingScreen(testId: testId),  // Your current ResultScreen content
      ),
    );
  }
}