import 'package:flutter/material.dart';
import 'package:typingtest/view/widgets/Left_drawer.dart';
import 'package:typingtest/view/widgets/historypage_widgets/history_container.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TopNavigationBar(),
          Text(
            "Result History",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 20,),
          HistoryContainer()
        ],
      ),
    );
  }
}
