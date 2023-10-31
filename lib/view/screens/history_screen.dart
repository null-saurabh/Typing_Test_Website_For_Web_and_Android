import 'package:flutter/material.dart';
import 'package:typingtest/view/widgets/Left_drawer.dart';
import 'package:typingtest/view/widgets/historypage_widgets/history_container.dart';
import 'package:typingtest/view/widgets/pop_up_top_heading_bar.dart';

class HistoryScreen extends StatelessWidget {
  final bool popup;
  final String? examName;
  const HistoryScreen({required this.popup,this.examName,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (popup && examName != null)
        PopUpScreensTopHeadingBar(examName: examName!),
        Padding(
          padding: const EdgeInsets.only(left: 25.0,right: 25,top: 15,bottom: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(MediaQuery.of(context).size.width >949)
              const Text(
                "Result History",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15,),
              HistoryContainer(popup: popup,)
            ],
          ),
        ),

      ],
    );
  }
}
