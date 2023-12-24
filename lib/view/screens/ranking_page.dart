import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/model/result_api_modal.dart';
import 'package:typingtest/view/widgets/ranking_page_widgets/list_tile_container.dart';
import 'package:typingtest/view/widgets/ranking_page_widgets/title_container.dart';

class RankingScreen extends StatelessWidget {
  final int testId;
  final ResultData resultData;
  const RankingScreen({required this.resultData,required this.testId,super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) =>  buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
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
              SizedBox(width: 10),
              Text(
                "Leader Board",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 15,),
          TitleContainer(resultData: resultData,),
          const SizedBox(height: 15,),
          Expanded(child: ListViewContainer(testId: testId,)),

        ],
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context){
    final scrollController1 = ScrollController();
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,right:10,top:10,bottom: 10),
      child: Scrollbar(
        controller: scrollController1,
        interactive: false,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: scrollController1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleContainer(resultData: resultData,),
              const SizedBox(height: 15,),
              ListViewContainer(testId: testId,),
            ],
          ),
        ),
      ),
    );
  }


}



