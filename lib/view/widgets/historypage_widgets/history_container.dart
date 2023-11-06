import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/view/widgets/historypage_widgets/history_listtile.dart';

class HistoryContainer extends StatelessWidget {
  final bool popup;
  const HistoryContainer({required this.popup,super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) =>  buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context){
    int itemCount = 15;
    double calculatedHeight = (66 * itemCount) + 25;

    double containerHeight =
    (calculatedHeight < MediaQuery.of(context).size.height -100)
        ? calculatedHeight
        : MediaQuery.of(context).size.height * 0.90;
    return Container(
      height: popup?(MediaQuery.of(context).size.height * 0.66 ) : containerHeight,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0,top: 5,bottom: 5,right: 5),
        child: ListView.builder(
            itemCount: itemCount,
            itemBuilder: (context,index){
              return const HistoryListTile();
            }),
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context){

    int itemCount = 15;
    double calculatedHeight = (66 * itemCount) + 25;

    double containerHeight =
    (calculatedHeight < MediaQuery.of(context).size.height -100)
        ? calculatedHeight
        : MediaQuery.of(context).size.height * 0.84;

    return Container(
      height: popup?(MediaQuery.of(context).size.height * 0.66 ) : containerHeight,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0,top: 5,bottom: 5,right: 5),
        child: ListView.builder(
            itemCount: itemCount,
            itemBuilder: (context,index){
              return const HistoryListTile();
            }),
      ),
    );
  }
}
