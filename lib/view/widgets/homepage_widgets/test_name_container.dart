import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:typingtest/view/screens/exam_page.dart';
import 'package:typingtest/view_model/services/navigation_service.dart';

import '../../../view_model/locator.dart';


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
        GoRouter router = GoRouter.of(context);
        router.goNamed('exam',pathParameters: {'examName' : 'SSC_Typing_Tests'});
        // locator<NavigationProvider>().navigateToExamPage(context, "SSC_Typing_Tests");

        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ExamPage(targetExamName: "SSC Typing Tests",),
        //   ),
        // );
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
