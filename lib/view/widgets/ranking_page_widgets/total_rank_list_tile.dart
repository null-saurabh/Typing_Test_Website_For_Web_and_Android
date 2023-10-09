import 'dart:math';

import 'package:flutter/material.dart';

class TotalRankingListTile extends StatelessWidget {
  final int index;
  TotalRankingListTile({super.key,required this.index});


  final Random _random = Random();
  Color _getRandomColor() {
    return Color.fromRGBO(
      _random.nextInt(256), // Red
      _random.nextInt(256), // Green
      _random.nextInt(256), // Blue
      1, // Alpha
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Color(0xffEBEBEB)))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          Padding(
            padding: const EdgeInsets.only(left:  15.0),
            child: _buildChildBasedOnIndex(index),
          ),
         Row(
          children: [
            CircleAvatar(radius: 14 ,backgroundColor: _getRandomColor(),child: Text("FM",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12),),),
            SizedBox(width: 5,),
            Text("Floyd Miles",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
          ],
        ),
        Row(
          children: [
            Image.asset(
              "assets/images/flash_colored.png",
              height: 22,
              width: 22,
            ),
            const Text("98.34%",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),),
          ],

        ),
        Row(
          children: [
            Image.asset(
              "assets/images/timer_colored.png",
              height: 22,
              width: 22,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Text("12 mins, 16 secs",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),),
            ),
          ],

        ),
      ],
    ));
  }
  Widget _buildChildBasedOnIndex(int index) {
    if (index == 0) {
      return Image.asset(
        "assets/images/rank_1.png",
        height: 22,
        width: 22,
      );
    } else if (index == 1) {
      return Image.asset(
        "assets/images/rank_2.png",
        height: 22,
        width: 22,
      );
    }
    else if (index == 2) {
      return Image.asset(
        "assets/images/rank_3.png",
        height: 22,
        width: 22,
      );
    }
    else {
      return Padding(
        padding: const EdgeInsets.only(left: 5.0,right: 5),
        child: Text((index+1).toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
      );
    }
  }
}
