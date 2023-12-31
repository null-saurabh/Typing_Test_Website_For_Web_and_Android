import 'package:flutter/material.dart';
import 'package:typingtest/view/widgets/Left_drawer.dart';
import 'package:typingtest/view/widgets/ranking_page_widgets/list_tile_container.dart';
import 'package:typingtest/view/widgets/ranking_page_widgets/title_container.dart';
import 'package:typingtest/view/widgets/ranking_page_widgets/total_rank_list_tile.dart';
import 'package:typingtest/view/widgets/ranking_page_widgets/user_rank_list_tile.dart';
import 'package:typingtest/view/widgets/top_navigation_bar.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LeftDrawer(isProfilePage: false),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0,vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const TopNavigationBar(),
                  // const SizedBox(height: 10,),
                  Row(
                    children: [
                      InkWell(
                        onTap:(){Navigator.pop(context);},
                        child: Container(
                          height: 32,
                          width: 32,
                          color: Colors.white,
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Leader Board",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  const TitleContainer(),
                  const SizedBox(height: 15,),
                  const Expanded(child: ListViewContainer()),

                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}



