import 'package:flutter/material.dart';
import 'package:typingtest/view/screens/instruction_page.dart';

class InstructionDialog extends StatelessWidget {
  const InstructionDialog({super.key});

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
          child: const InstructionPage(),  // Your current ResultScreen content
        ),
      ),
    );
  }
}
