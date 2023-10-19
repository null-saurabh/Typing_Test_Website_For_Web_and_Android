import 'package:flutter/material.dart';
import 'package:typingtest/view/widgets/Left_drawer.dart';
import 'package:typingtest/view/widgets/profilepage_widgets/profile_container.dart';
import 'package:typingtest/view/widgets/top_navigation_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF5FAFC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopNavigationBar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(29.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LeftDrawer(isProfilePage: true,),
                  SizedBox(width: 29),
                  Expanded(
                  child:
                  ProfileContainer(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
