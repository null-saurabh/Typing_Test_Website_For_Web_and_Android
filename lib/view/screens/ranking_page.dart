import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/view/widgets/ranking_page_widgets/list_tile_container.dart';
import 'package:typingtest/view/widgets/ranking_page_widgets/title_container.dart';

class RankingScreen extends StatelessWidget {
  final int testId;
  const RankingScreen({required this.testId,super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) =>  buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // InkWell(
              //   onTap:(){Navigator.pop(context);},
              //   child: Container(
              //     height: 32,
              //     width: 32,
              //     color: Colors.white,
              //     child: const Icon(Icons.arrow_back),
              //   ),
              // ),
              const SizedBox(width: 10),
              const Text(
                "Leader Board",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 15,),
          const TitleContainer(),
          const SizedBox(height: 15,),
          Expanded(child: ListViewContainer(testId: testId,)),

        ],
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,right:10,top:10,bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleContainer(),
          const SizedBox(height: 15,),
          Expanded(child: ListViewContainer(testId: testId,)),

        ],
      ),
    );
  }


}



