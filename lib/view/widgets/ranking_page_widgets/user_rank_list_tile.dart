import 'package:flutter/material.dart';

class UserRankListTile extends StatelessWidget {
  const UserRankListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        height: 120,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color(0xff369CBC),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
               const Padding(
                 padding: EdgeInsets.only(top: 5.0),
                 child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        "234",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10,),
                    SizedBox(
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
                          const Icon(Icons.arrow_drop_down,color: Colors.white,),
                          const SizedBox(width: 15),
                        ],
                      ),
                    ),
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
                                const SizedBox(width: 110),

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

  Widget listTileData(String key, String value){
    return SizedBox(
      width: 110,
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
