import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:typingtest/view_model/provider/login_provider.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginUserProvider>(builder: (context, userProvider, child) {
      final isLoggedIn = userProvider.user != null;
      return Wrap(
        children: [Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xff17414F),
                      radius: 55,
                      child: Text(
                        getInitials(isLoggedIn ? userProvider.user!.displayName ?? "No Name" : "Guest User"),
                        style: const TextStyle(fontSize: 54, fontWeight: FontWeight.w500,color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            profileOption("Name",isLoggedIn ? userProvider.user!.displayName ?? "No Name" :"Guest User"),
                            const Divider(thickness: 1,color: Color(0xffEBEBEB),),
                            profileOption("Email",isLoggedIn ? userProvider.user!.email ?? "No Email" :"User not logged In"),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )],
      );
    });
  }

  Widget profileOption(String title, String result){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Color(0xff929292)),),
        Text(result,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color:Colors.black),)
      ],
    );
  }

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

}
