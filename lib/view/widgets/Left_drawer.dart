import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      height: double.infinity,
      color: Colors.white,
      child:  Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            backgroundColor: Color(0xff17414F),
            radius: 31,
            child: Text(
              "AB",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500,color: Colors.white),
            ),
          ),
          const SizedBox(height: 5,),

          const Text("Alex Behron",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          const Text("johnsmith@example.com",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff929292))),
          const SizedBox(height: 29,),

          drawerListTile(Icons.person_2_outlined, "My Profile"),
          drawerListTile(Icons.history_outlined, "Result History"),
          drawerListTile(Icons.logout_outlined, "Log out"),
        ],
      ),
    );
  }

  Widget drawerListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xff369CBC),),
      // Image.asset(
      //   icon,
      //   height: 22,
      //   width: 22,
      // ),
      title: Text(title, style: const TextStyle(
          fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),),
      trailing: const Icon(Icons.navigate_next),
    );
  }
}
