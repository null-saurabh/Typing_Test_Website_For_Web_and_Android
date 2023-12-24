import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/model/ranking_modal.dart';

class UserRankListTile extends StatefulWidget {
  final RankingData data;

  const UserRankListTile({required this.data ,super.key});

  @override
  State<UserRankListTile> createState() => _UserRankListTileState();
}

class _UserRankListTileState extends State<UserRankListTile> {
  bool _showDetails = false;

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
        height:_showDetails ? 122 : 62,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color(0xff369CBC),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 47,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          "234",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    SizedBox(
                      width: 220,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.white,
                            child: Text(
                              getInitials(widget.data.userName!),
                              style: const TextStyle(
                                  color: Color(0xff369CBC),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "You",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
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
                                listTileData("Net Speed", widget.data.nwpm.toString()),
                                listTileData("Min. passing Speed", widget.data.minimumSpeed.toString()),
                                listTileData("Accuracy", widget.data.accuracy.toString()),
                                listTileData("Words Typed",widget.data.wordsTyped.toString()),
                                listTileData("Omitted Words", widget.data.marksObtained.toString()),

                              ],
                            ),
                          ),
                          const SizedBox(width: 25),
                          IconButton(onPressed: () {
                            setState(() {
                              _showDetails = !_showDetails;
                            });
                          }, icon: Icon(_showDetails ? Icons.arrow_drop_up : Icons.arrow_drop_down,color: Colors.white,)),
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
                                  listTileData("Correct Words", widget.data.wordsCorrect.toString()),
                                  listTileData("Incorrect Words", widget.data.wordIncorrect.toString()),
                                  listTileData("Full mistakes", widget.data.fullMistakes.toString()),
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
        ),
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        height:_showDetails ? 267 : 82,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color(0xff369CBC),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 47,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    "234",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 20,),
              Expanded(child: Column(
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
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.white,
                              child: Text(
                                  getInitials(widget.data.userName!),
                                style: const TextStyle(
                                    color: Color(0xff369CBC),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "You",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        IconButton(onPressed: () {
                          setState(() {
                            _showDetails = !_showDetails;
                          });
                        }, icon: Icon(_showDetails ? Icons.arrow_drop_up : Icons.arrow_drop_down,color: Colors.white,)),
                      ],
                    ),
                  ),
                   Row(
                    children: [
                      // SizedBox(width: 33,),
                      const Text("Net Speed:",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.white),),
                      const SizedBox(width: 10,),
                      Text(widget.data.nwpm.toString(),style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color:Colors.white),)
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
                            listTileData("Min. passing Speed", widget.data.minimumSpeed.toString()),
                            const SizedBox(height:5,),
                            listTileData("Correct Words",  widget.data.wordsCorrect.toString()),
                            const SizedBox(height:5,),
                            listTileData("Full mistakes",widget.data.fullMistakes.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                listTileData("Accuracy", widget.data.accuracy.toString()),
                                const SizedBox(height:5,),
                                listTileData("Words Typed", widget.data.wordsTyped.toString()),
                                const SizedBox(height:5,),
                                listTileData("Incorrect Words", widget.data.wordIncorrect.toString()),
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
              ))

            ],
          ),
        ),
      ),
    );
  }

  Widget listTileData(String key, String value){
    return SizedBox(
      width: 110,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(key,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xffEBEBEB)),maxLines: 1,),
          Text(value,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.white),)
        ],
      ),
    );
  }
}
