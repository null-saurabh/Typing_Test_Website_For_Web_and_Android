import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/model/live_test_api_model.dart';
import 'package:typingtest/view/widgets/exam_page_widgets/live_test_list_tile.dart';
import 'package:typingtest/view/widgets/historypage_widgets/history_dialog.dart';
import 'package:typingtest/view/widgets/instruction_page_widgets/instruction_dialog.dart';
import 'package:typingtest/view/widgets/result_widgets/result_dialog.dart';
import 'package:typingtest/view_model/provider/api_provider.dart';
import 'package:typingtest/view_model/provider/practice_test_provider.dart';

class ExamPage extends StatelessWidget {
  final String targetExamName;
  const ExamPage({required this.targetExamName, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) => buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context) {
    final scrollController1 = ScrollController();
    // ApiProvider apiProvider = Provider.of<ApiProvider>(context, listen: false);
    return Scrollbar(
      controller: scrollController1,
      interactive: false,
      thumbVisibility: true,
      child: SingleChildScrollView(
        controller: scrollController1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            targetExamName,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      opaqueButton(
                        context,
                        "History",
                        () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return HistoryDialog(
                                  targetExamName: targetExamName,
                                );
                              });
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Live tests",
                        style: TextStyle(
                            fontSize: 16.9, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          Provider.of<ApiProvider>(context, listen: false).refresh();
                        },
                        icon: const Icon(Icons.refresh),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Consumer<ApiProvider>(
                      builder: (context, apiProvider, child) {
                    apiProvider.fetchLiveTest();
                    LiveTest? testData = apiProvider.liveTests;
                    if (testData == null) {
                      return const CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: testData.data.list.length,
                        itemBuilder: (context, index) {
                          return LiveTestListTile(
                            testData: testData.data.list[index],
                            targetExamName: targetExamName,
                          );
                        },
                      );
                    }
                  })
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Practice Tests",
                          style: TextStyle(
                              fontSize: 16.9, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                            IconButton(
                              onPressed: () {
                                Provider.of<PracticeProvider>(context, listen: false).refresh();
                              },
                              icon: const Icon(Icons.refresh),
                            )
                      ]),
                  const SizedBox(
                    height: 19,
                  ),
                  Consumer<PracticeProvider>(
                      builder: (context, practiceProvider, child) {
                        practiceProvider.fetchPracticeTest();
                        LiveTest? testData = practiceProvider.practiceTests;
                        if (testData == null) {
                          return const CircularProgressIndicator();
                        }
                        else {
                          return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 325,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 275 / 135,
                      ),
                      itemCount: testData.data.list.length,
                      itemBuilder: (context, index) {
                        // return dailyTest(data.data.list[index], context);
                        return dailyTest(
                            testData.data.list[index], context);
                      },
                    ); // Optional: show a loader when tests is null.
                        }
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context) {
    final scrollController1 = ScrollController();
    return Scrollbar(
      controller: scrollController1,
      interactive: false,
      thumbVisibility: true,
      child: SingleChildScrollView(
        controller: scrollController1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Live tests",
                        style: TextStyle(
                            fontSize: 16.9, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          Provider.of<ApiProvider>(context, listen: false)
                              .refresh();
                        },
                        icon: const Icon(Icons.refresh),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Consumer<ApiProvider>(
                    builder: (context, apiProvider, child) {
                      apiProvider.fetchLiveTest();
                      LiveTest? testData = apiProvider.liveTests;
                      if (testData == null) {
                        return const CircularProgressIndicator();
                      } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: testData.data.list.length,
                        itemBuilder: (context, index) {
                          return LiveTestListTile(
                            testData: testData.data.list[index],
                            targetExamName: targetExamName,
                          );
                        },
                      );}
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Practice Tests",
                          style: TextStyle(
                              fontSize: 16.9, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {
                            Provider.of<PracticeProvider>(context, listen: false).refresh();
                          },
                          icon: const Icon(Icons.refresh),
                        )
                      ]),
                  const SizedBox(
                    height: 19,
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Consumer<PracticeProvider>(
                          builder: (context,   practiceProvider, child) {
                        return Consumer<PracticeProvider>(
                            builder: (context,   practiceProvider, child) {
                              practiceProvider.fetchPracticeTest();
                              LiveTest? testData = practiceProvider.practiceTests;
                              if (testData == null) {
                                return const CircularProgressIndicator();
                              }
                              else {
                                int crossAxisCount = constraints.maxWidth ~/ 250;
                                return GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    childAspectRatio: 250 / 100,
                                  ),
                                  itemCount: testData.data.list.length,
                                  itemBuilder: (context, index) {
                                    return dailyTest(
                                       testData.data.list[index], context);
                                  },
                                );} // Optional: show a loader when tests is null.
                            });

                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget opaqueButton(
    BuildContext context,
    String name,
    VoidCallback onTap,
  ) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),
              borderRadius: BorderRadius.circular(5)))),
      onPressed: onTap,
      child: Text(
        name,
        style: const TextStyle(color: Color(0xff369CBC)),
      ),
    );
  }

  void showFullScreenDialog(BuildContext context, Widget dialogContent) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => dialogContent,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutQuad;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    ));
  }

  Widget dailyTest(LiveTestData testData, BuildContext context) {
    return Container(
      height: 110,
      width: 275,
      color:
          testData.isAttempted! ? Colors.grey.withOpacity(0.08) : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              testData.testName!,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: testData.isAttempted! ? Colors.black : Colors.black),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (testData.isAttempted!)
                  opaqueButton(
                    context,
                    "Result",
                    () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ResultDialog(
                                testId: testData.testId!, isPractice: false);
                          });
                    },
                  ),
                if (testData.isAttempted!)
                  const SizedBox(
                    width: 5,
                  ),
                if (testData.isAttempted!)
                  opaqueButton(
                    context,
                    "Start Again",
                    () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // print(targetExamName);
                            return InstructionDialog(
                              testData: testData,
                              targetExamName: targetExamName,
                            );
                          });
                    },
                  ),
                if (!testData.isAttempted!)
                  opaqueButton(
                    context,
                    "Start Now",
                    () async {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return InstructionDialog(
                              testData: testData,
                              targetExamName: targetExamName,
                            );
                          });
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
