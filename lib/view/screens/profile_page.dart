import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/view/widgets/Left_drawer.dart';
import 'package:typingtest/view/widgets/profilepage_widgets/edit_profile.dart';
import 'package:typingtest/view/widgets/profilepage_widgets/profile_container.dart';
import 'package:typingtest/view/widgets/top_navigation_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5FAFC),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          LeftDrawer(isProfilePage: false),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.0,vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TopNavigationBar(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "My Profile",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      editButton(context),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Expanded(
                  child:
                  ProfileContainer(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget editButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(const Color(0xff369CBC)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),
              borderRadius: BorderRadius.circular(5)))),
      onPressed: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return EditProfileDialog();
          },
        );
      },
      child: Row(
        children: [
          Icon(Icons.edit_outlined,color: Colors.white,size: 20,),
          SizedBox(width: 5,),
          const Text(
            'Edit',
            style: TextStyle(color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
