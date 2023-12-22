import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/model/live_test_api_model.dart';
import 'package:typingtest/view/widgets/instruction_page_widgets/instruction_dialog.dart';
import 'package:typingtest/view/widgets/result_widgets/result_dialog.dart';

class LiveTestListTile extends StatefulWidget {
  final LiveTestData testData;
  const LiveTestListTile({required this.testData, super.key});

  @override
  State<LiveTestListTile> createState() => _LiveTestListTileState();
}

class _LiveTestListTileState extends State<LiveTestListTile> {
  bool _isHovering = false;
  Timer? _timer;
  String _countdown = "";

  @override
  void initState() {
    super.initState();
    _updateCountdown();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      _updateCountdown();
    });
  }

  void _updateCountdown() {
    DateTime now = DateTime.now();
    DateTime startDateTime = DateTime.parse(widget.testData.startDatetime!);
    DateTime endDateTime = DateTime.parse(widget.testData.endDatetime!);

    DateTime targetTime =
        widget.testData.isAvailable! ? endDateTime : startDateTime;
    if (now.isAfter(targetTime)) {
      _timer?.cancel();
    } else {
      setState(() {
        _countdown = getTimeDifference(targetTime);
      });
    }
  }

  String getTimeDifference(DateTime targetTime) {
    Duration difference = targetTime.difference(DateTime.now());

    // Convert the difference into hours, minutes, and seconds
    String twoDigit(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigit(difference.inHours);
    String minutes = twoDigit(difference.inMinutes.remainder(60));
    String seconds = twoDigit(difference.inSeconds.remainder(60));

    return "$hours : $minutes : $seconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
              border: _isHovering
                  ? const Border(
                      left: BorderSide(
                        color: Color(0xff369CBC),
                        width: 4,
                      ),
                      bottom: BorderSide(
                        color: Color(0xff369CBC),
                        width: 1.25,
                      ),
                      right: BorderSide(
                        color: Color(0xff369CBC),
                        width: 1.25,
                      ),
                      top: BorderSide(
                        color: Color(0xff369CBC),
                        width: 1.25,
                      ),
                    )
                  : Border(
                      left: BorderSide(
                        color: const Color(0xff369CBC).withOpacity(0.25),
                        width: 4,
                      ),
                      right: BorderSide(color: const Color(0xff369CBC).withOpacity(0.25), width: 1.25),
                      top: BorderSide(color: const Color(0xff369CBC).withOpacity(0.25), width: 1.25),
                      bottom: BorderSide(color: const Color(0xff369CBC).withOpacity(0.25), width: 1.25),
                    )),
          child: ScreenTypeLayout.builder(
            mobile: (BuildContext context) => buildMobileListTile(),
            desktop: (BuildContext context) => buildDesktopListTile(),
          ),
        ),
      ),
    );
  }

  Widget buildDesktopListTile() {
    return ListTile(
      title: Text(
        widget.testData.targetExam!,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      subtitle: IntrinsicHeight(
        child: Row(
          children: [
            rowItem("assets/images/ranking.png", "90 Key Strokes"),
            requiredVerticalDivider(),
            rowItem("assets/images/question.png", "English"),
            requiredVerticalDivider(),
            rowItem("assets/images/timer.png", "30 mins"),
          ],
        ),
      ),
      trailing: widget.testData.isAttempted == true
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                leaderBoardButton(context),
                const SizedBox(
                  width: 10,
                ),
                opaqueButton(
                  context,
                  "View Result",
                  () async {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ResultDialog(
                          testId: widget.testData.testId!,
                            isPractice: false,
                          );
                        });
                  },
                ),
              ],
            )
          : widget.testData.isAvailable == true
              ? Column(
                  children: [
                    SizedBox(
                      height: 27.5,
                      child: opaqueButton(context, "Start Now", () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return InstructionDialog(
                                testData: widget.testData,
                              );
                            });
                      }),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Ends In :",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                        Text(
                          _countdown,
                          style: const TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffE72A2A)),
                        ),
                      ],
                    ),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.lock_open_outlined,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Start In :",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    Text(
                      _countdown,
                      style: const TextStyle(
                          fontSize: 16.5,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
    );
  }

  Widget buildMobileListTile() {
    return ListTile(
      // onTap: widget.testData.isAvailable == true &&
      //         widget.testData.isAttempted == false
      //     ? () {
      //         showDialog(
      //             context: context,
      //             builder: (BuildContext context) {
      //               return InstructionDialog(
      //                 testData: widget.testData,
      //               );
      //             });
      //       }
      //     : null,
      title: Text(
        widget.testData.targetExam!,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      subtitle: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                rowItem("assets/images/ranking.png", "350 Words"),
                requiredVerticalDivider(),
                rowItem("assets/images/question.png", "English"),
              ],
            ),
            rowItem("assets/images/timer.png", "30 mins"),
            const SizedBox(
              height: 5,
            ),
            widget.testData.isAttempted == true
                ? Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      leaderBoardButton(context),
                      const SizedBox(
                        width: 10,
                      ),
                      opaqueButton(
                        context,
                        "View Result",
                        () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ResultDialog(
                                  testId: widget.testData.testId!,
                                  isPractice: false,
                                );
                              });
                        },
                      ),
                    ],
                  )
                : widget.testData.isAvailable == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Ends In :",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                              Text(
                                _countdown,
                                style: const TextStyle(
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffE72A2A)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 27.5,
                            child: opaqueButton(context, "Start Now", () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return InstructionDialog(
                                      testData: widget.testData,
                                    );
                                  });
                            }),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Start In :",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                              Text(
                                _countdown,
                                style: const TextStyle(
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.lock_open_outlined,
                            color: Colors.grey,
                          ),
                        ],
                      ),
          ],
        ),
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

  Widget leaderBoardButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),
              borderRadius: BorderRadius.circular(5)))),
      onPressed: () async {
        GoRouter router = GoRouter.of(context);
        router.goNamed('/ranking',pathParameters: {'testId' : widget.testData.testId.toString()});
        // locator<NavigationProvider>().navigateToRankingPage(context, widget.testData.testId!);

        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => RankingScreen(testId: widget.testData.testId!,)));
      },
      child: const Icon(Icons.leaderboard_outlined, color: Color(0xff369CBC)),
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
}
