import 'package:flutter/material.dart';
import 'package:typingtest/view/screens/history_screen.dart';
import 'package:typingtest/view/screens/homepage.dart';
import 'package:typingtest/view/screens/profile_page.dart';
import 'package:typingtest/view/screens/ranking_page.dart';

class LeftDrawer extends StatelessWidget {
  final bool isProfilePage;
  const LeftDrawer({required this.isProfilePage, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            backgroundColor: Color(0xff17414F),
            radius: 31,
            child: Text(
              "AB",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text("Alex Behrouz",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          const Text("johnsmith@example.com",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff929292))),
          const SizedBox(
            height: 29,
          ),
          isProfilePage
          ?drawerListTile(Icons.person_2_outlined, "My Profile", () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfilePage()));
          },true)
          :drawerListTile(Icons.person_2_outlined, "My Profile", () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfilePage()));
          }, false),
          drawerListTile(Icons.leaderboard_outlined, "All Ranking", () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const RankingScreen()));
          },false),
          isProfilePage
          ?drawerListTile(Icons.history_outlined, "Result History", () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HistoryScreen()));
          }, false)
          :drawerListTile(Icons.history_outlined, "Result History", () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HistoryScreen()));
          }, true),
          drawerListTile(Icons.logout_outlined, "Log out", () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HOMEPAGE()));
          }, false),
        ],
      ),
    );
  }

  Widget drawerListTile(
      IconData icon, String title, VoidCallback onTap, bool color) {
    return Container(
      color: color ? const Color(0xff369CBC).withOpacity(0.08) : null,
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xff369CBC),
        ),
        // Image.asset(
        //   icon,
        //   height: 22,
        //   width: 22,
        // ),
        title: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
        ),
        trailing: const Icon(Icons.navigate_next),
        onTap: onTap,
      ),
    );
  }
}
