

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GradiantStartButton extends StatelessWidget {
  final String targetExamName;
  const GradiantStartButton({
    required this.targetExamName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        GoRouter router = GoRouter.of(context);
        router.goNamed('exam',pathParameters: {'examName' : targetExamName});
      },
      child: const Center(
        child: Text(
          "Login to start the test",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

// Container(height: 40,
// width: double.infinity,
// decoration: const BoxDecoration(
// gradient: LinearGradient(
// colors: [
// Color(0xff369CBC),
// Color(0xffF0FFF0)
// ],
// begin: Alignment.centerLeft,
// end: Alignment.centerRight,
// )),)