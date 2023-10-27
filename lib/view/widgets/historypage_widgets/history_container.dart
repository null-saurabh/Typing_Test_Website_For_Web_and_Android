import 'package:flutter/material.dart';
import 'package:typingtest/view/widgets/historypage_widgets/history_listtile.dart';

class HistoryContainer extends StatelessWidget {
  final bool popup;
  const HistoryContainer({required this.popup,super.key});

  @override
  Widget build(BuildContext context) {
    int itemCount = 15;
    double calculatedHeight = (66 * itemCount) + 25;

    double containerHeight =
    (calculatedHeight < MediaQuery.of(context).size.height -100)
        ? calculatedHeight
        : MediaQuery.of(context).size.height -100;

    return Container(
      // constraints: BoxConstraints(m),
      height: popup?(MediaQuery.of(context).size.height * 0.8 )-80 : containerHeight,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0,top: 5,bottom: 5,right: 5),
        child: ListView.builder(
            itemCount: itemCount,
            itemBuilder: (context,index){
              return const HistoryListTile();
            }),
      ),
    );
  }
}
