import 'package:flutter/material.dart';
import 'package:typingtest/view/widgets/homepage_widgets/nav_bar.dart';

class HOMEPAGE extends StatelessWidget {
  const HOMEPAGE({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(),
          ],
        ),
      ),
    );
  }
}
