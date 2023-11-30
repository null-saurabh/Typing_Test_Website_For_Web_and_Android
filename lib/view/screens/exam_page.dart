import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/model/live_test_api_model.dart';
import 'package:typingtest/view/widgets/exam_page_widgets/live_test_list_tile.dart';
import 'package:typingtest/view/widgets/historypage_widgets/history_dialog.dart';
import 'package:typingtest/view/widgets/instruction_page_widgets/instruction_dialog.dart';
import 'package:typingtest/view_model/provider/api_provider.dart';

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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // InkWell(
                          //   onTap: () {
                          //     Navigator.pop(context);
                          //   },
                          //   child: Container(
                          //     height: 36,
                          //     width: 36,
                          //     color: Colors.white,
                          //     child: const Icon(Icons.arrow_back),
                          //   ),
                          // ),
                          const SizedBox(width: 10),
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
                      Consumer<ApiProvider>(
                        builder: (context, apiProvider, child) {
                          return IconButton(
                            onPressed: () {
                              apiProvider.fetchLiveTest();
                              print("clicked refresh fetch live test");
                            },
                            icon: const Icon(Icons.refresh),
                          );
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Consumer<ApiProvider>(
                    builder: (context, testProvider, child) {
                      final data= testProvider.liveTests;
                      if (data == null) {
                        return const CircularProgressIndicator(); // Loading indicator
                      }
                      return data.data.list.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data.data.list.length,
                              itemBuilder: (context, index) {
                                print(data.data.list.length);
                                return LiveTestListTile(
                                    testData: data.data.list[index]);
                              },
                            )
                          : const Text(
                              "No test available"); // Optional: show a loader when tests is null.
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
                        Consumer<ApiProvider>(
                          builder: (context, apiProvider, child) {
                            return IconButton(
                              onPressed: () {
                                apiProvider.fetchPracticeTest();
                                print("clicked refresh fetch live test");
                              },
                              icon: const Icon(Icons.refresh),
                            );
                          },
                        )
                      ]),
                  const SizedBox(
                    height: 19,
                  ),
                  Consumer<ApiProvider>(builder: (context, apiProvider, child) {
                    final data = apiProvider.practiceTests;

                    if (data == null) {
                      return const CircularProgressIndicator(); // Loading indicator
                    }
                    print(data.data.list.length);
                    return data.data.list.isNotEmpty
                    ?GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 325,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 275 / 129,
                      ),
                      itemCount: data.data.list.length,
                      itemBuilder: (context, index) {
                        // return dailyTest(data.data.list[index], context);
                        return dailyTest(data.data.list[index],
                            context);
                      },
                    )
                        :const Text(
                        "No test available");
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
                      Consumer<ApiProvider>(
                        builder: (context, apiProvider, child) {
                          return IconButton(
                            onPressed: () {
                              apiProvider.fetchLiveTest();
                            },
                            icon: const Icon(Icons.refresh),
                          );
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Consumer<ApiProvider>(
                    builder: (context, testProvider, child) {
                      final data = testProvider.liveTests;

                      if (data == null) {
                        return const CircularProgressIndicator(); // Loading indicator
                      }

                      return data.data.list.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data.data.list.length,
                              itemBuilder: (context, index) {
                                return LiveTestListTile(
                                    testData: data.data.list[index]);
                              },
                            )
                          : const CircularProgressIndicator(); // Optional: show a loader when tests is null.
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
                        Consumer<ApiProvider>(
                          builder: (context, apiProvider, child) {
                            return IconButton(
                              onPressed: () {
                                apiProvider.fetchPracticeTest();
                                print("clicked refresh fetch live test");
                              },
                              icon: const Icon(Icons.refresh),
                            );
                          },
                        )
                      ]),
                  const SizedBox(
                    height: 19,
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Consumer<ApiProvider>(
                        builder: (context, apiProvider, child) {
                          final data = apiProvider.practiceTests;

                          if (data == null) {
                            return const CircularProgressIndicator(); // Loading indicator
                          }

                          int crossAxisCount = constraints.maxWidth ~/
                              250; // Number of items per row

                          return data.data.list.isNotEmpty
                          ?GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 250 / 100,
                            ),
                            itemCount: data.data.list.length,
                            itemBuilder: (context, index) {
                              return dailyTest(data.data.list[index],
                                  context);
                            },
                          )
                              : const Text(
                              "No test available");
                        },
                      );
                    },
                  ),
                  // LayoutBuilder(
                  //   builder: (context, constraints) {
                  //     int crossAxisCount =constraints.maxWidth ~/ 250; // Number of items per row
                  //
                  //     return GridView.builder(
                  //       shrinkWrap: true,
                  //       physics: const NeverScrollableScrollPhysics(),
                  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: crossAxisCount,
                  //         crossAxisSpacing: 20,
                  //         mainAxisSpacing: 20,
                  //         childAspectRatio: 250 / 100,
                  //       ),
                  //       itemCount: 5,
                  //       itemBuilder: (context, index) {
                  //         return dailyTest((index+1).toString(), context);
                  //       },
                  //     );
                  //   },
                  // ),
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

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    ));
  }

  Widget dailyTest(LiveTestData testData, BuildContext context) {
    return Container(
      height: 100,
      width: 275,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              testData.testName!,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18,color: testData.isAttempted! ? Colors.purple : Colors.black ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                opaqueButton(
                  context,
                  "Start Now",
                  () async {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return InstructionDialog(
                            testData: testData,
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
