import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/view/screens/exam_page.dart';
import 'package:typingtest/view/screens/homepage.dart';
import 'package:typingtest/view/screens/instruction_page.dart';
import 'package:typingtest/view/screens/profile_page.dart';
import 'package:typingtest/view/screens/subscription.dart';
import 'package:typingtest/view/screens/test_screen.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => desktopTopNavigationBar(context),
      desktop: (BuildContext context) => desktopTopNavigationBar(context),
    );
  }

  Widget desktopTopNavigationBar(BuildContext context){
    return Material(
      elevation: 2,
      child: Container(
        color: Colors.white,
        height: 55,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  navigationLogo(context),
                  // const SizedBox(width: 20,),
                  // navigationButton("Typing Test",context),
                  // navigationButton("Typing Lessons",context),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/images/logout_icon.png",height: 36,width:36,),
                  // upgradeButton(context),
                  const SizedBox(width: 15,),
                  // loginButton(context),
                  // const SizedBox(width: 20,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget upgradeButton(BuildContext context){
    return ElevatedButton(
      style: ButtonStyle(elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),borderRadius: BorderRadius.circular(5)
          ))),
      onPressed: () async {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SubscriptionPage()));
      },
      child: Row(
        children: [
          Image.asset("assets/images/crown.png",height: 24,width: 24,),
          const SizedBox(width: 10,),
          const Text('Upgrade Plan', style: TextStyle(color: Color(0xff369CBC)),),
        ],
      ),
    );
  }

  Widget loginButton(BuildContext context){
    return ElevatedButton(
      style: ButtonStyle(elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(const Color(0xff369CBC)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),borderRadius: BorderRadius.circular(5)
          ))),
      onPressed: () async {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfilePage()));
      },
      child: const Text('Log In', style: TextStyle(color: Colors.white),),
    );
  }

  Widget navigationLogo(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 35.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HOMEPAGE()));

        },
        child: Container(width: 65,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/logo_text.png"))
            )),
      ),
    );
  }

  Widget navigationButton(String text, BuildContext context){
    return TextButton(
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ExamPage()));
      },
      child: Text(text, style: const TextStyle(color: Colors.black,fontSize: 15),),
    );
  }
}
