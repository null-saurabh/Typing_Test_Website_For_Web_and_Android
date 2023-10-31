import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:typingtest/model/api_model.dart';
import 'package:typingtest/view/widgets/exam_page_widgets/live_test_list_tile.dart';
import 'package:typingtest/view/widgets/historypage_widgets/history_dialog.dart';
import 'package:typingtest/view_model/provider/api_provider.dart';

class ExamPage extends StatelessWidget {
  final String targetExamName;
  const ExamPage({required this.targetExamName,super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 36,
                            width: 36,
                            color: Colors.white,
                            child: const Icon(Icons.arrow_back),
                          ),
                        ),
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
                              return HistoryDialog(targetExamName: targetExamName,);
                            });
                      },
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      "Live tests",
                      style: TextStyle(fontSize: 16.9, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 10,),
                    Consumer<TestProvider>(
                      builder: (context, testProvider, child) {
                        return IconButton(
                          onPressed: () {
                            // Call the refresh function from the TestProvider
                            testProvider.refreshTests();
                          },
                          icon: const Icon(Icons.refresh),
                        );
                      },
                    )

                  ],
                ),
                const SizedBox(height: 10),
                Consumer<TestProvider>(
                  builder: (context, testProvider, child) {
                    List<Test>? tests = testProvider.tests;

                    return tests != null
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: tests.length,
                            itemBuilder: (context, index) {
                              return LiveTestListTile(testData: tests[index]);
                            },
                          )
                        : const CircularProgressIndicator(); // Optional: show a loader when tests is null.
                  },
                ),
                // ListView.builder(
                //     shrinkWrap: true,
                //     itemCount: 10,
                //     physics: NeverScrollableScrollPhysics(),
                //     itemBuilder: (context, index) {
                //       if (index ==0 ) {
                //         return LiveTestListTile(status:"Completed",index: index + 1);
                //       } else if (index == 1 || index == 2){
                //         return LiveTestListTile(status: "Started", index: index + 1);
                //       }
                //       else{
                //         return LiveTestListTile(status: "Starts In", index: index + 1);
                //       }
                //
                //     }),
              ],
            ),
          ),
          // Divider(
          //   thickness: 1,
          //   color: const Color(0xff369CBC).withOpacity(0.75),
          // ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Practice Tests",
                  style: TextStyle(fontSize: 16.9, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 19,
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount =constraints.maxWidth ~/ 250; // Number of items per row

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 250 / 100,
                      ),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return dailyTest((index+1).toString(), context);
                      },
                    );
                  },
                ),
                // Row(
                //   children: [
                //     dailyTest("1", context),
                //     const SizedBox(width: 15),
                //     dailyTest("2", context),
                //     const SizedBox(width: 15),
                //     dailyTest("3", context),
                //   ],
                // ),
              ],
            ),
          )
        ],
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

  Widget dailyTest(String testNumber, BuildContext context) {
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
              "Daily Practice test - $testNumber",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            opaqueButton(
              context,
              "Start Now",
              () async {
              },
            ),
          ],
        ),
      ),
    );
  }
}
