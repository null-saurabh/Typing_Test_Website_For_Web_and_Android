import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/model/result_api_modal.dart';
import 'package:typingtest/view/widgets/ranking_page_widgets/ranking_dialog.dart';
import 'package:typingtest/view/widgets/result_widgets/result_dialog.dart';

class HistoryListTile extends StatelessWidget {
  final bool popup;
  final ResultData resultData;
  const HistoryListTile({required this.popup,required this.resultData, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) =>  buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context){
    return Container(
      height: 66,
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Color(0xffEBEBEB)))),
      child: Padding(
        padding: const EdgeInsets.only(top:15.0,bottom: 5,left: 8,right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(resultData.testName!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                // SizedBox(height: 5,),
                Text(resultData.targetExam!,style: TextStyle(fontSize: 12.5,fontWeight: FontWeight.w400,color: Colors.grey),),
              ],
            ),
            Row(
              children: [
                leaderBoardButton(context,popup),
                const SizedBox(width: 8),
                viewResultButton(context),
                const SizedBox(width: 20),

              ],
            )

          ],
        ),
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context){
    return Container(
      height: 115,
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Color(0xffEBEBEB)))),
      child: Padding(
        padding: const EdgeInsets.only(top:15.0,bottom: 5,left: 2,right: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(resultData.testName!,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
            // SizedBox(height: 5,),
            Text(resultData.targetExam!,style: TextStyle(fontSize: 12.5,fontWeight: FontWeight.w400,color: Colors.grey),),
          const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end  ,
              children: [
                leaderBoardButton(context,popup),
                const SizedBox(width: 8),
                viewResultButton(context),
                const SizedBox(width: 20),
              ],
            )

          ],
        ),
      ),
    );
  }
  Widget viewResultButton(BuildContext context){
    return ElevatedButton(
      style: ButtonStyle(elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),borderRadius: BorderRadius.circular(5)
          ))),
      onPressed: () async {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const ResultDialog(testId: 6344,isPractice: false,);
            }
        );
        },
      child: const Text('View Result', style: TextStyle(color: Color(0xff369CBC))),
    );
  }

  Widget leaderBoardButton(BuildContext context, bool popup){
    return ElevatedButton(
      style: ButtonStyle(elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),borderRadius: BorderRadius.circular(5)
          ))),
      onPressed: () async {
        if(popup)
         {
           showDialog(
               context: context,
               builder: (BuildContext context) {
              return const RankingDialog(
                testId: 6310,
              );
            });
         }
        else{
    String resultDataString = jsonEncode(resultData.toJson());
    GoRouter.of(context).goNamed('ranking',pathParameters: {'testId' : '6310','resultData':resultDataString});

    }
        // locator<NavigationProvider>().navigateToRankingPage(context, 6310);
        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RankingScreen(testId: 6310)));

      },
      child: const Icon(Icons.leaderboard_outlined,color:Color(0xff369CBC)),
    );
  }
}
