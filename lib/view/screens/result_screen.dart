import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/model/result_api_modal.dart';
import 'package:typingtest/view/widgets/result_widgets/result_box.dart';
import 'package:typingtest/view/widgets/result_widgets/result_container.dart';
import 'package:typingtest/view/widgets/result_widgets/result_error_representation_container.dart';
import 'package:typingtest/view/widgets/pop_up_top_heading_bar.dart';
import 'package:typingtest/view/widgets/result_widgets/result_typing_paragraph.dart';

class ResultScreen extends StatelessWidget {
  final ResultData result;
  const ResultScreen({
    required this.result,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) => buildDesktopLayout(context),
    );

  }

  Widget buildDesktopLayout(BuildContext context){
    final scrollController1 = ScrollController();

    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PopUpScreensTopHeadingBar(examName: result.testName!,),
          Expanded(
            child: Scrollbar(
              controller: scrollController1,
              interactive: false,
              thumbVisibility: true,

              child: SingleChildScrollView(
                controller: scrollController1,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const ResultBox(
                                      title: "Test Duration",
                                      value: "2 mins 34 secs",
                                    ),
                                    ResultBox(
                                      title: "Net Speed",
                                      value: "${result.nwpm} WPM",
                                    ),
                                    ResultBox(
                                      title: "Total Words",
                                      value: result.gcpm.toString(),
                                    ),
                                    ResultBox(
                                      title: "Accuracy",
                                      value: '${result.accuracy}%',
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ResultContainer(result: result,),
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
            ),
          )

        ],
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context){
    final scrollController1 = ScrollController();

    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PopUpScreensTopHeadingBar(examName: result.testName!,),
          Expanded(
            child: Scrollbar(
              controller: scrollController1,
              interactive: false,
              thumbVisibility: true,

              child: SingleChildScrollView(
                controller: scrollController1,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15 ),
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
                                vertical: 10, horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    const ResultBox(
                                      title: "Test Duration",
                                      value: "2 mins 34 secs",
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ResultBox(
                                      title: "Net Speed",
                                      value: result.nwpm.toString(),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ResultBox(
                                      title: "Gross Speed",
                                      value: result.gwpm.toString(),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    ResultBox(
                                      title: "Accuracy",
                                      value: result.accuracy.toString(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ResultContainer(result: result,),
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
            ),
          )

        ],
      ),
    );
  }
}
