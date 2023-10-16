import 'package:flutter/material.dart';

class ResultScreenTopHeadingBar extends StatelessWidget {
  const ResultScreenTopHeadingBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: const Color(0xff17414F),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 40,right: 25),
          child: const Text("SSC Typing Test - Grade A-1",style:TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
        ),
      ),
    );
  }
}
