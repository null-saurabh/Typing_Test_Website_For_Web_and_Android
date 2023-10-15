import 'package:flutter/material.dart';
import 'package:typingtest/view/screens/exam_page.dart';
import 'package:typingtest/view/screens/instruction_page.dart';


class TestNameContainer extends StatefulWidget {
  const TestNameContainer({super.key});

  @override
  State<TestNameContainer> createState() => _TestNameContainerState();
}

class _TestNameContainerState extends State<TestNameContainer> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ExamPage(),
          ),
        );
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovering = true),
        onExit: (_) => setState(() => _isHovering = false),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: _isHovering
                ? Border.all(color: const Color(0xff369CBC), width: 2.0)
                : null,
          ),
          height: 150,
          width: 250,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/ssc_icon.png", height: 46, width: 46),
                const SizedBox(height: 10),
                const Text(
                  "SSC Typing Tests",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
