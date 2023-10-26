import 'dart:math';

import 'package:flutter/material.dart';

class TotalRankingListTile extends StatefulWidget {
  final int index;
  const TotalRankingListTile({super.key,required this.index});

  @override
  State<TotalRankingListTile> createState() => _TotalRankingListTileState();
}

class _TotalRankingListTileState extends State<TotalRankingListTile> {
  bool _showDetails = false;
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
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        height: _showDetails ? 120 : 60,
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Color(0xffEBEBEB)))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:  15.0),
                      child: _buildChildBasedOnIndex(widget.index),
                    ),
                    const SizedBox(width: 20,),
                    SizedBox(
                      width: 220,
                      child: Row(
                        children: [
                          CircleAvatar(radius: 14 ,backgroundColor: _getRandomColor(),child: const Text("FM",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12),),),
                          const SizedBox(width: 5,),
                          const Text("Floyd Miles",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              listTileData("Net Speed", "32WPM"),
                              listTileData("Gross Speed", "32WPM"),
                              listTileData("Min. passing Speed", "32WPM"),
                              listTileData("Accuracy", "95.95%"),
                              listTileData("Words Typed", "234"),
                            ],
                          ),
                        ),
                        const SizedBox(width: 25),
                        IconButton(onPressed: () {
                          setState(() {
                            _showDetails = !_showDetails;
                          });
                        }, icon: Icon(_showDetails ? Icons.arrow_drop_up : Icons.arrow_drop_down,color: Colors.black,)),
                        const SizedBox(width: 15),
                      ],
                    ),
                  ),
                  if (_showDetails)
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                listTileData("Correct Words", "24"),
                                listTileData("Incorrect Words", "14"),
                                listTileData("Full mistakes", "2"),
                                listTileData("Half Mistakes ", "2"),
                                const SizedBox(width: 110+16),

                              ],
                            ),
                          ),
                          const SizedBox(width: 64),
                          // const Icon(Icons.arrow_drop_down,color: Colors.transparent,),
                          // const SizedBox(width: 15),
                        ],
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
  Widget listTileData(String key, String value){
    return SizedBox(
      width: 110,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(key,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Colors.grey),),
          Text(value,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color:Colors.black ),)
        ],
      ),
    );
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
