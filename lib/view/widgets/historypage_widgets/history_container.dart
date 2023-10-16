import 'package:flutter/material.dart';
import 'package:typingtest/view/widgets/historypage_widgets/history_listtile.dart';

class HistoryContainer extends StatelessWidget {
  const HistoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            const Text(
              "Result History",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context,index){
                    return const HistoryListTile();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
