import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TestScreenNavBar extends StatelessWidget {
  const TestScreenNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => desktopNavBar(context),
      desktop: (BuildContext context) => desktopNavBar(context),
    );
  }

  Widget desktopNavBar(BuildContext context){
    return Column(
      children: [
        Container(
          color: Colors.indigo,
          height: 30,
            width: double.infinity,
          child: const Center(
            child: Text("Typing Test 24 Sep 2023", style: TextStyle(color: Colors.white,fontSize: 17,)),
          )
        ),
        Container(
          color: Colors.black,
          height: 20,
          width: double.infinity,
          child: const Text("SSC CHSL/CGL", style: TextStyle(color: Colors.white,fontSize: 14,))
        ),
      ],
    );
  }

}
