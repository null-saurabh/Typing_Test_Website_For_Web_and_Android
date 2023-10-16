import 'package:flutter/material.dart';
import 'package:typingtest/view/widgets/Left_drawer.dart';
import 'package:typingtest/view/widgets/historypage_widgets/history_container.dart';
import 'package:typingtest/view/widgets/top_navigation_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF5FAFC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopNavigationBar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(29.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LeftDrawer(),
                  SizedBox(width: 29),
                  Expanded(child: HistoryContainer()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
