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
                                              testData.duration.toString()),
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
                                    "Lorem ipsum dolor sit amet consectetur. Iaculis diam iaculis nisl mauris.",
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
                                    "Lorem ipsum dolor sit amet consectetur. Iaculis diam iaculis nisl mauris. At nunc ullamcorper viverra id ",
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
                                    "Lorem ipsum dolor sit amet consectetur. Iaculis diam iaculis nisl mauris.",
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
                                    "Lorem ipsum dolor sit amet consectetur. Iaculis diam iaculis nisl mauris. At nunc ullamcorper viverra id sagittis sit. Risus nibh nisl scelerisque in phasellus lectus. Vitae ullamcorper odio lacus egestas mus donec eu.",
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
                                    "Lorem ipsum dolor sit amet consectetur. Iaculis diam iaculis nisl mauris.",
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
                                    "Lorem ipsum dolor sit amet consectetur",
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
