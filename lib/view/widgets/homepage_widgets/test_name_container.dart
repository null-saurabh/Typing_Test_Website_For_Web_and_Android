import 'package:flutter/material.dart';

class TestNameContainer extends StatelessWidget {
  const TestNameContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( color: Colors.white,
    height: 150,
    width: 250,
    child: Padding(
      padding: const EdgeInsets.only(left: 20.0,top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/logo.png",height: 46,width: 46,),
          SizedBox(height: 10,),
          const Text("SSC Typing Tests",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
        ],
      ),
    ),);
  }
}
