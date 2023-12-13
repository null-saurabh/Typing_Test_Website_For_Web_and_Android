

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GradiantStartButton extends StatelessWidget {
  const GradiantStartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        GoRouter router = GoRouter.of(context);
        router.goNamed('exam',pathParameters: {'examName' : 'SSC_Typing_Tests'});
      },
      child: Container(
          height: 40,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff369CBC),
                  Color(0xffF0FFF0)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )),
          child: const Center(
            child: Text(
              "Ready  to take the test? Tap here to start!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          )),
    );
  }
}
