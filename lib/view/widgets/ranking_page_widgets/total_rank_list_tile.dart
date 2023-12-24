import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/model/ranking_modal.dart';

class TotalRankingListTile extends StatefulWidget {
  final RankingData data;
  const TotalRankingListTile({super.key,required this.data});

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

  String getInitials(String fullName) {
    List<String> names = fullName.split(" ");
    String initials = "";

    if (names.isNotEmpty) {
      initials += names[0][0];
    }

    if (names.length > 1) {
      initials += names[1][0];
    }

    return initials.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) =>  buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
          height: _showDetails ? 122 : 62,
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
                      SizedBox(
                        width: 47,
                        child: Padding(
                          padding: const EdgeInsets.only(left:  15.0),
                          child: _buildIconBasedOnRank(widget.data.rank ?? 0),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      SizedBox(
                        width: 220,
                        child: Row(
                          children: [
                            CircleAvatar(radius: 14 ,backgroundColor: _getRandomColor(),child: Text(getInitials(widget.data.userName!),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12),),),
                            const SizedBox(width: 5,),
                            Text(widget.data.userName!,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
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
                                  listTileData("Net Speed", widget.data.nwpm!.toString()),
                                  listTileData("Omitted Words", widget.data.marksObtained.toString()),
                                  listTileData("Min. passing Speed", widget.data.minimumSpeed!.toString()),
                                  listTileData("Accuracy", widget.data.accuracy!.toInt().toString()),
                                  listTileData("Words Typed", widget.data.wordsTyped!.toString()),
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
                                    listTileData("Correct Words", widget.data.wordsCorrect!.toString()),
                                    listTileData("Incorrect Words", widget.data.wordIncorrect!.toString()),
                                    listTileData("Full mistakes", widget.data.fullMistakes!.toString()),
                                    listTileData("Half Mistakes ", widget.data.halfMistakes.toString()),
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

  Widget buildMobileLayout(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
          height: _showDetails ? 278 : 93,
          decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Color(0xffEBEBEB)))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 47,
                  child: Padding(
                    padding: const EdgeInsets.only(left:  15.0),
                    child: _buildIconBasedOnRank(widget.data.rank ?? 0),
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(radius: 14 ,backgroundColor: _getRandomColor(),child: Text(getInitials(widget.data.userName!),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12),),),
                                const SizedBox(width: 5,),
                                Text(widget.data.userName!,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                              ],
                            ),
                            IconButton(onPressed: () {
                              setState(() {
                                _showDetails = !_showDetails;
                              });
                            }, icon: Icon(_showDetails ? Icons.arrow_drop_up : Icons.arrow_drop_down,color: Colors.black,))
                            ],
                        ),
                      ),

                      Row(
                        children: [
                          // SizedBox(width: 33,),
                          const Text("Net Speed:",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.grey),),
                          const SizedBox(width: 10,),
                          Text(widget.data.nwpm!.toString(),style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color:Colors.black ),)
                        ],
                      ),
                      if (_showDetails)
                        const SizedBox(height: 10,),
                      if (_showDetails)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              listTileData("Omitted Words", widget.data.marksObtained.toString()),
                              const SizedBox(height:5,),
                              listTileData("Min. passing Speed", widget.data.minimumSpeed!.toString()),
                              const SizedBox(height:5,),
                              listTileData("Correct Words", widget.data.wordsCorrect!.toString()),
                              const SizedBox(height:5,),
                              listTileData("Full mistakes",widget.data.fullMistakes!.toString()),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  listTileData("Accuracy", widget.data.accuracy!.toInt().toString()),
                                  const SizedBox(height:5,),
                                  listTileData("Words Typed", widget.data.wordsTyped!.toString()),
                                  const SizedBox(height:5,),
                                  listTileData("Incorrect Words", widget.data.wordIncorrect!.toString()),
                                  const SizedBox(height:5,),
                                  listTileData("Half Mistakes ", widget.data.halfMistakes.toString()),

                                ],
                              ),
                              const SizedBox(width: 1,)
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

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
          Text(key,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Colors.grey),maxLines: 1,),
          Text(value,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color:Colors.black ),)
        ],
      ),
    );
  }

  Widget _buildIconBasedOnRank(int rank) {
    if (rank == 1) {
      return Image.asset(
        "assets/images/rank_1.png",
        height: 22,
        width: 22,
      );
    } else if (rank == 2) {
      return Image.asset(
        "assets/images/rank_2.png",
        height: 22,
        width: 22,
      );
    }
    else if (rank == 3) {
      return Image.asset(
        "assets/images/rank_3.png",
        height: 22,
        width: 22,
      );
    }
    else {
      return Padding(
        padding: const EdgeInsets.only(left: 5.0,right: 5),
        child: Text((rank).toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black)),
      );
    }
  }
}
