import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/view/widgets/homepage_widgets/test_name_container.dart';


class DynamicGridView extends StatelessWidget {
  final double itemWidth = 250;
  final double itemHeight = 135;

  const DynamicGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) =>  buildDesktopLayout(context),
    );
  } }

Widget buildDesktopLayout(BuildContext context){
  final List<String> testList = ["SSC CGL Typing Tests", "SSC CHSL Typing Tests"];

  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 250,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 250 / 140,
    ),
    itemCount: testList.length,
    itemBuilder: (context, index) {
      return TestNameContainer(testName: testList[index]);
    },
  );
}

Widget buildMobileLayout(BuildContext context){
  final List<String> testList = ["SSC CGL Typing Tests", "SSC CHSL Typing Tests"];

  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 250,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      childAspectRatio: 250 / 175,
    ),
    itemCount: testList.length,
    itemBuilder: (context, index) {
      return TestNameContainer(testName: testList[index]);
    },
  );
}