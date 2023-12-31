import 'package:flutter/material.dart';
import 'package:typingtest/view/screens/ranking_page.dart';
import 'package:typingtest/view/screens/result_screen.dart';
import 'package:typingtest/view/screens/subscription.dart';

class HistoryListTile extends StatelessWidget {
  const HistoryListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Color(0xffEBEBEB)))),
      child: Padding(
        padding: const EdgeInsets.only(top:15.0,bottom: 5,left: 8,right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("SSC typing test -grade A - Test 1",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                // SizedBox(height: 5,),
                Text("All SSC Typing Test",style: TextStyle(fontSize: 12.5,fontWeight: FontWeight.w400,color: Colors.grey),),
              ],
            ),
            Row(
              children: [
                leaderBoardButton(context),
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ResultScreen()));
      },
      child: const Text('View Result', style: TextStyle(color: Color(0xff369CBC))),
    );
  }

  Widget leaderBoardButton(BuildContext context){
    return ElevatedButton(
      style: ButtonStyle(elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),borderRadius: BorderRadius.circular(5)
          ))),
      onPressed: () async {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RankingScreen()));
      },
      child: const Icon(Icons.leaderboard_outlined,color:Color(0xff369CBC)),
    );
  }
}
