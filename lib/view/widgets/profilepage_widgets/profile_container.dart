import 'package:flutter/material.dart';
import 'package:typingtest/view/screens/subscription.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Profile",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                editButton(context),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xff17414F),
                  radius: 55,
                  child: Text(
                    "AB",
                    style: TextStyle(fontSize: 54, fontWeight: FontWeight.w500,color: Colors.white),
                  ),
                ),
                SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      profileOption("Name","Alex Behron"),
                      Divider(thickness: 10,color: Colors.black,),
                      profileOption("Email","alexbehron@gmail.com"),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
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
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SubscriptionPage()));
      },
      child: const Text(
        'Edit',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget profileOption(String title, String result){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Color(0xff929292)),),
        Text(result,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color:Colors.black),)
      ],
    );
  }
}
