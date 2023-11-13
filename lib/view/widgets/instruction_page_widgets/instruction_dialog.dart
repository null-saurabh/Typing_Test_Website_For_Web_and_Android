import 'package:flutter/material.dart';
import 'package:typingtest/model/live_test_api_model.dart';
import 'package:typingtest/view/screens/instruction_page.dart';

class InstructionDialog extends StatelessWidget {
  final LiveTestData testData;
  const InstructionDialog({required this.testData,super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // adjust as needed
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,  // Adjust as needed
          height: MediaQuery.of(context).size.height * 0.85, // Adjust as needed
          child: InstructionPage(testData: testData,),  // Your current ResultScreen content
        ),
      ),
    );
  }
}
