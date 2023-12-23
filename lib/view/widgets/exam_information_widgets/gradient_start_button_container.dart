

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
    return SizedBox(
      height: 35,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(const Color(0xff369CBC)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xff369CBC)),
                borderRadius: BorderRadius.circular(5)))),
        onPressed: (){
          GoRouter router = GoRouter.of(context);
          router.goNamed('exam',pathParameters: {'examName' : targetExamName});
        },
        child: const Center(
          child: Text(
            "Login to start the test",
            style: TextStyle(
              fontSize: 18,
              // fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
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