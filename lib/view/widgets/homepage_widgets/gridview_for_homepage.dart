import 'package:flutter/material.dart';
import 'package:typingtest/view/widgets/homepage_widgets/test_name_container.dart';


class DynamicGridView extends StatelessWidget {
  final double itemWidth = 250;
  final double itemHeight = 110;

  const DynamicGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = (constraints.maxWidth / itemWidth).floor();

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: itemWidth,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: itemWidth / itemHeight,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            return const TestNameContainer();
          },
        );
      },
    );
  } }