import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/view/screens/test_screen.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => desktopNavBar(context),
      desktop: (BuildContext context) => desktopNavBar(context),
    );
  }

  Widget desktopNavBar(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          navLogo(),
          Row(
            children: [
              navButton("Typing Test",context),
              navButton("Typing Lessons",context),
              navButton("Plans",context),
            ],
          ),
          SizedBox(
            height: 45,
            child: ElevatedButton(
              style: ButtonStyle(elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.orange),borderRadius: BorderRadius.circular(10)
              ))),
              onPressed: (){},
              child: const Text('Login/SignUp', style: TextStyle(color: Colors.orange),),
            ),
          )
        ],
      ),
    );
  }

  Widget navButton(String text, BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4 ),
      child: TextButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TestScreen()));
        },
        child: Text(text, style: const TextStyle(color: Colors.black,fontSize: 18),),
      ),
    );
  }

  Widget navLogo(){
    return Container(width: 110,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/logo.png"))
      ));
  }
}
