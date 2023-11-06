import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class UserRankListTile extends StatefulWidget {
  const UserRankListTile({super.key});

  @override
  State<UserRankListTile> createState() => _UserRankListTileState();
}

class _UserRankListTileState extends State<UserRankListTile> {
  bool _showDetails = false;

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
                    Container(
                      width: 47,
                      child: const Padding(
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
                    const SizedBox(
                      width: 220,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.white,
                            child: Text(
                              "AB",
                              style: TextStyle(
                                  color: Color(0xff369CBC),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
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
              Container(
                width: 47,
                child: const Padding(
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
                        const Row(
                          children: [
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: Colors.white,
                              child: Text(
                                "AB",
                                style: TextStyle(
                                    color: Color(0xff369CBC),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
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
                  const Row(
                    children: [
                      // SizedBox(width: 33,),
                      Text("Net Speed:",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.white),),
                      SizedBox(width: 10,),
                      Text("32 WPM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color:Colors.white),)
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
                            listTileData("Gross Speed", "32WPM"),
                            const SizedBox(height:5,),
                            listTileData("Min. passing Speed", "32WPM"),
                            const SizedBox(height:5,),
                            listTileData("Correct Words", "24"),
                            const SizedBox(height:5,),
                            listTileData("Full mistakes", "2"),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                listTileData("Accuracy", "95.95%"),
                                const SizedBox(height:5,),
                                listTileData("Words Typed", "234"),
                                const SizedBox(height:5,),
                                listTileData("Incorrect Words", "14"),
                                const SizedBox(height:5,),
                                listTileData("Half Mistakes ", "2"),

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
      // width: 110,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(key,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xffEBEBEB)),),
          Text(value,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.white),)
        ],
      ),
    );
  }
}
