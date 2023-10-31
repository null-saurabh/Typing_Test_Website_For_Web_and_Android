import 'package:flutter/material.dart';
import 'package:typingtest/view/widgets/result_widgets/result_box.dart';
import 'package:typingtest/view/widgets/result_widgets/result_container.dart';
import 'package:typingtest/view/widgets/result_widgets/result_error_representation_container.dart';
import 'package:typingtest/view/widgets/pop_up_top_heading_bar.dart';
import 'package:typingtest/view/widgets/result_widgets/result_typing_paragraph.dart';

class ResultScreen extends StatelessWidget {
  final String examName;
  const ResultScreen({
    required this.examName,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PopUpScreensTopHeadingBar(examName: examName,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Result",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 18),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ResultBox(
                                    title: "Test Duration",
                                    value: "2 mins 34 secs",
                                  ),
                                  ResultBox(
                                    title: "Net Speed",
                                    value: "0 WPM",
                                  ),
                                  ResultBox(
                                    title: "Gross Speed",
                                    value: "50 Words per minute",
                                  ),
                                  ResultBox(
                                    title: "Accuracy",
                                    value: "0%",
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const ResultContainer(),
                              const SizedBox(
                                height: 15,
                              ),
                              ResultTypingParagraphContainer(),
                              const SizedBox(
                                height: 15,
                              ),
                              const ResultErrorRepresentation()
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
          
        ],
      ),
    );
  }
}
