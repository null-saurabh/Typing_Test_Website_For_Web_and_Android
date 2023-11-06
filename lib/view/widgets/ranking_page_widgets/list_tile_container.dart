import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/view/widgets/ranking_page_widgets/total_rank_list_tile.dart';
import 'package:typingtest/view/widgets/ranking_page_widgets/user_rank_list_tile.dart';

class ListViewContainer extends StatelessWidget {
  const ListViewContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) =>  buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context){
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,right:5,top: 25,bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 20),
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
    );
  }

  Widget buildMobileLayout(BuildContext context){
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0,right:5,top: 25,bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 20),
            const UserRankListTile(),
            const SizedBox(height: 10),
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
    );
  }
}