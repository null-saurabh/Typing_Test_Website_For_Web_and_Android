import 'package:flutter/material.dart';
import 'package:typingtest/view/widgets/result_widgets/result_box.dart';
import 'package:typingtest/view/widgets/result_widgets/result_container.dart';
import 'package:typingtest/view/widgets/result_widgets/result_error_representation_container.dart';
import 'package:typingtest/view/widgets/result_widgets/result_topp_heading_bar.dart';
import 'package:typingtest/view/widgets/result_widgets/result_typing_paragraph.dart';
import 'package:typingtest/view/widgets/top_navigation_bar.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopNavigationBar(),
            ResultScreenTopHeadingBar(),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Result",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22,color: Colors.black),),
                  SizedBox(height: 15,),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 18),
                    decoration: BoxDecoration(color: Colors.white,border: Border.all(color:  Colors.white)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ResultBox(title: "Test Duration",value: "2 mins 34 secs",),
                            ResultBox(title: "Net Speed",value: "0 WPM",),
                            ResultBox(title: "Gross Speed",value: "50 Words per minute",),
                            ResultBox(title: "Accuracy",value: "0%",),
                          ],
                        ),
                        SizedBox(height: 15,),
                        ResultContainer(),
                        SizedBox(height: 15,),
                        ResultTypingParagraphContainer(),
                        SizedBox(height: 15,),

                        ResultErrorRepresentation()

                      ],
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

