import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:typingtest/model/live_test_api_model.dart';
import 'package:typingtest/view/widgets/pop_up_top_heading_bar.dart';
import 'package:typingtest/view_model/provider/api_provider.dart';

class InstructionPage extends StatelessWidget {
  final LiveTestData testData;
  final String targetExamName;
  const InstructionPage({required this.testData,required this.targetExamName, super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController1 = ScrollController();

    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PopUpScreensTopHeadingBar(examName: testData.targetExam!),
          Expanded(
            child: Scrollbar(
              controller: scrollController1,
              interactive: false,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: scrollController1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(left: 25.0),
                      child: Text(
                        "Instructions",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 24),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 15),
                      child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        // margin: const EdgeInsets.all(59),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(targetExamName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20)),
                              const SizedBox(
                                height: 10,
                              ),
                              MediaQuery.of(context).size.width > 500
                                  ? IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          // rowItem("assets/images/ranking.png",
                                          //     testData),
                                          // requiredVerticalDivider(),
                                          rowItem("assets/images/question.png",
                                              testData.language!),
                                          requiredVerticalDivider(),
                                          rowItem("assets/images/timer.png",
                                              testData.duration.toString() + ' min'),
                                        ],
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        // rowItem("assets/images/ranking.png",
                                        //     "90 Marks"),
                                        rowItem("assets/images/question.png",
                                            testData.language!),
                                        rowItem("assets/images/timer.png",
                                            testData.duration.toString()),
                                      ],
                                    ),
                              MediaQuery.of(context).size.width > 500
                                  ? const SizedBox(
                                      height: 20,
                                    )
                                  : const SizedBox(
                                      height: 10,
                                    ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey.withOpacity(0.75),
                              ),
                              MediaQuery.of(context).size.width > 500
                                  ? const SizedBox(
                                      height: 20,
                                    )
                                  : const SizedBox(
                                      height: 10,
                                    ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "1. ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                  ),
                                  Expanded(
                                      child: Text(
                                    "This is a computer-based typing test that requires a minimum typing speed of 35 words per minute in English and 30 words per minute in Hindi",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                  )),
                                ],
                              ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "2. ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                  ),
                                  Expanded(
                                      child: Text(
                                    "Candidates can choose the language of typing (English or Hindi) and the keyboard layout (Hindi Inscript, Hindi Krutidev, Hindi Remington GAIL, or Hindi Remington CBI) before starting the test. The keyboard layout can also be changed during the test.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                  )),
                                ],
                              ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "3. ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                  ),
                                  Expanded(
                                      child: Text(
                                    "Candidates can use the backspace key and the arrow keys to correct any mistakes in the typed text. However, they should avoid making too many errors as they will affect the accuracy and the final score.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                  )),
                                ],
                              ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "4. ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                  ),
                                  Expanded(
                                      child: Text(
                                    "Candidates who are visually impaired or have a scribe (passage reader) will be given an extra time of 5 minutes in each typing test.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                  )),
                                ],
                              ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "5. ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                  ),
                                  Expanded(
                                      child: Text(
                                    "The duration of the typing test is 10 minutes for LDC/JSA/PA/SA posts and 15 minutes for DEO posts.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                  )),
                                ],
                              ),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "6. ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                  ),
                                  Expanded(
                                      child: Text(
                                    "Candidates should read the instructions carefully before starting the test and follow them strictly. They should not use any unfair means or indulge in any misconduct during the test.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                  )),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              startButton(context, testData),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget startButton(BuildContext context, LiveTestData testData) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(const Color(0xff369CBC)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),
              borderRadius: BorderRadius.circular(5)))),
      onPressed: () async {

        String testDataString = jsonEncode(testData.toJson());
        GoRouter.of(context).pop();
        GoRouter.of(context)
            .pushNamed('test', pathParameters: {'testData': testDataString});
        try {
          await Provider.of<ApiProvider>(context, listen: false).markAsOpen(testData.testId.toString());
        } catch (e) {
          rethrow;
        }
      },
      child: const Text(
        'Start Now',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget requiredVerticalDivider() {
    return SizedBox(
      height: 20,
      child: VerticalDivider(
        color: Colors.grey.withOpacity(0.5),
        thickness: 1.2,
      ),
    );
  }

  Widget rowItem(String image, String text) {
    return Row(
      children: [
        Image.asset(
          image,
          height: 20,
          width: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff929292)),
        )
      ],
    );
  }
}
