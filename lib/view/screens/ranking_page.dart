import 'package:flutter/material.dart';
import 'package:typingtest/view/widgets/ranking_page_widgets/total_rank_list_tile.dart';
import 'package:typingtest/view/widgets/ranking_page_widgets/user_rank_list_tile.dart';
import 'package:typingtest/view/widgets/top_navigation_bar.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopNavigationBar(),
          const SizedBox(height: 10,),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Leader Board",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600),),
                    // SizedBox(height: 5),
                    const Text("SSC Typing Test - Grade A - 1",style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff929292)),),
                    const SizedBox(height: 20),
                    const UserRankListTile(),
                    const SizedBox(height: 29),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 10,
                          itemBuilder: (context,index){
                          return TotalRankingListTile(index: index,);
                          }),
                    )
                  ],
                ),
              ),
            ),
          )),

        ],
      )
    );
  }
}
