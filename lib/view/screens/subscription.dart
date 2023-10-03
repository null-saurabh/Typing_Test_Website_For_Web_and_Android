import 'package:flutter/material.dart';
import 'package:typingtest/view/widgets/topNavigationBar.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopNavigationBar(),
          ],
        ),
      ),
    );
  }
}
