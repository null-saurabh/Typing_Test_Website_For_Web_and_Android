import 'package:flutter/material.dart';
import 'package:typingtest/view/screens/subscription.dart';
import 'package:typingtest/view/widgets/profilepage_widgets/edit_profile.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
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
              const SizedBox(height: 20,),
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xff17414F),
                    radius: 55,
                    child: Text(
                      "AB",
                      style: TextStyle(fontSize: 54, fontWeight: FontWeight.w500,color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          profileOption("Name","Alex Behron"),
                          const Divider(thickness: 1,color: Color(0xffEBEBEB),),
                          profileOption("Email","alexbehron@gmail.com"),
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
        Text(title,style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: Color(0xff929292)),),
        Text(result,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color:Colors.black),)
      ],
    );
  }
}
