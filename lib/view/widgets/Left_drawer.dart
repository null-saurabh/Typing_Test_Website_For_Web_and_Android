import 'package:flutter/material.dart';
import 'package:typingtest/view/screens/history_screen.dart';
import 'package:typingtest/view/screens/homepage.dart';
import 'package:typingtest/view/screens/profile_page.dart';
import 'package:typingtest/view/screens/ranking_page.dart';
import 'package:typingtest/view/screens/subscription.dart';

class LeftDrawer extends StatelessWidget {
  final bool isProfilePage;
  const LeftDrawer({required this.isProfilePage, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 20),
          // const CircleAvatar(
          //   backgroundColor: Color(0xff17414F),
          //   radius: 31,
          //   child: Text(
          //     "AB",
          //     style: TextStyle(
          //         fontSize: 24,
          //         fontWeight: FontWeight.w500,
          //         color: Colors.white),
          //   ),
          // ),
          const SizedBox(
            height: 5,
          ),
          const Text("LOGO",
              style: TextStyle(
                  fontSize: 32,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,)),
          // const Text("johnsmith@example.com",
          //     style: TextStyle(
          //         fontSize: 14,
          //         fontWeight: FontWeight.w400,
          //         color: Color(0xff929292))),
          const SizedBox(
            height: 20,
          ),
          isProfilePage
              ?drawerListTile(Icons.category_outlined, "All Tests", () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HOMEPAGE()));
          }, false)
              :drawerListTile(Icons.category_outlined, "All Tests", () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HOMEPAGE()));
          }, true),
          isProfilePage
              ?drawerListTile(Icons.account_balance_wallet_outlined, "Subscriptions", () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SubscriptionPage()));
          }, false)
              :drawerListTile(Icons.account_balance_wallet_outlined, "Subscriptions", () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SubscriptionPage()));
          }, true),
          isProfilePage
              ?drawerListTile(Icons.history_outlined, "Result History", () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HistoryScreen()));
          }, false)
              :drawerListTile(Icons.history_outlined, "Result History", () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HistoryScreen()));
          }, true),
          isProfilePage
          ?drawerListTile(Icons.person_2_outlined, "My Profile", () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfilePage()));
          },true)
          :drawerListTile(Icons.person_2_outlined, "My Profile", () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfilePage()));
          }, false),
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
      // color: color ? const Color(0xff369CBC).withOpacity(0.08) : null,
      child: ListTile(
        leading: Icon(
          icon,
          // color: const Color(0xff369CBC),
          color: Colors.grey,
        ),
        // Image.asset(
        //   icon,
        //   height: 22,
        //   width: 22,
        // ),
        title: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w400, fontSize: 16.5, color: Colors.grey),
        ),
        // trailing: const Icon(Icons.navigate_next),
        onTap: onTap,
      ),
    );
  }
}
