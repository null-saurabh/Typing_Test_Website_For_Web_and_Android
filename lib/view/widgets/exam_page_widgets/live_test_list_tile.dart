import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/model/live_test_api_model.dart';
import 'package:typingtest/view/widgets/instruction_page_widgets/instruction_dialog.dart';
import 'package:intl/intl.dart';
import 'package:typingtest/view_model/provider/api_provider.dart';

class LiveTestListTile extends StatefulWidget {
  final LiveTestData testData;
  final String targetExamName;
  const LiveTestListTile(
      {required this.testData, required this.targetExamName, super.key});

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

    Duration difference = targetTime.difference(now);

    if (difference.inSeconds == 0 && difference.inSeconds > -5) {
      _timer?.cancel();
      // print('timer cancel');
      // print(_timer ==null);
      Future.delayed(const Duration(seconds: 1), () {
        Provider.of<ApiProvider>(context, listen: false).refresh();
      });
    } else if (difference.inSeconds > 0) {
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
                      right: BorderSide(
                          color: const Color(0xff369CBC).withOpacity(0.25),
                          width: 1.25),
                      top: BorderSide(
                          color: const Color(0xff369CBC).withOpacity(0.25),
                          width: 1.25),
                      bottom: BorderSide(
                          color: const Color(0xff369CBC).withOpacity(0.25),
                          width: 1.25),
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
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  rowItem("assets/images/question.png",
                      widget.testData.language ?? "English"),
                  requiredVerticalDivider(),
                  rowItem("assets/images/timer.png",
                      widget.testData.duration.toString()),
                ],
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "${formatTimeFromServer(widget.testData.startDatetime!)} - ${formatTimeFromServer(widget.testData.endDatetime!)}",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff929292)),
            ),
          ],
        ),
        trailing: widget.testData.isAvailable == false
            ? widget.testData.attendStatus == "result_awaiting"
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Result Awaiting",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      Text(
                        'Time - ${formatTimeFromServer(widget.testData.endDatetime!)}',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      )
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
                  )
            : widget.testData.attendStatus == "ready_to_take"
                ? Column(
                    children: [
                      SizedBox(
                        height: 29,
                        child: opaqueButton(context, "Start Now", () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return InstructionDialog(
                                  testData: widget.testData,
                                  targetExamName: widget.targetExamName,
                                );
                              });
                        }),
                      ),
                      const SizedBox(
                        height: 1,
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
                : widget.testData.attendStatus == "result_awaiting"
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Result Awaiting",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                          Text(
                            'Time - ${formatTimeFromServer(widget.testData.endDatetime!)}',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          )
                        ],
                      )
                    : widget.testData.attendStatus == "currently_open"
                        ? const Text(
                            "Currently Open",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          )
                        : null);

    // ? Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       const Icon(
    //         Icons.lock_open_outlined,
    //         color: Colors.grey,
    //       ),
    //       const SizedBox(
    //         width: 10,
    //       ),
    //       const Text(
    //         "Start In :",
    //         style: TextStyle(
    //             fontSize: 14,
    //             fontWeight: FontWeight.w400,
    //             color: Colors.grey),
    //       ),
    //       Text(
    //         _countdown,
    //         style: const TextStyle(
    //             fontSize: 16.5,
    //             fontWeight: FontWeight.w500,
    //             color: Colors.grey),
    //       ),
    //     ],
    //   )
    // : widget.testData.attendStatus == "ready_to_take"
    //     ? Column(
    //       children: [
    //         SizedBox(
    //           height: 29,
    //           child: opaqueButton(context, "Start Now", () {
    //             showDialog(
    //                 context: context,
    //                 builder: (BuildContext context) {
    //                   return InstructionDialog(
    //                     testData: widget.testData,
    //                     targetExamName: widget.targetExamName,
    //                   );
    //                 });
    //           }),
    //         ),
    //         const SizedBox(
    //           height: 1,
    //         ),
    //         Row(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             const Text(
    //               "Ends In :",
    //               style: TextStyle(
    //                   fontSize: 11,
    //                   fontWeight: FontWeight.w400,
    //                   color: Colors.grey),
    //             ),
    //             Text(
    //               _countdown,
    //               style: const TextStyle(
    //                   fontSize: 12.5,
    //                   fontWeight: FontWeight.w500,
    //                   color: Color(0xffE72A2A)),
    //             ),
    //           ],
    //         ),
    //       ],
    //     )
    //     : widget.testData.attendStatus == "result_awaiting"
    //         ? Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               const Text(
    //                 "Result Awaiting",
    //                 style: TextStyle(
    //                     fontSize: 16,
    //                     fontWeight: FontWeight.w400,
    //                     color: Colors.grey),
    //               ),
    //               Text(
    //                 'Time - ${formatTimeFromServer(widget.testData.endDatetime!)}',
    //                 style: const TextStyle(
    //                     fontSize: 14,
    //                     fontWeight: FontWeight.w400,
    //                     color: Colors.grey),
    //               )
    //             ],
    //           )
    //         : widget.testData.attendStatus == "currently_open"
    //             ? const Text(
    //                 "Currently Open",
    //                 style: TextStyle(
    //                     fontSize: 16,
    //                     fontWeight: FontWeight.w400,
    //                     color: Colors.grey),
    //               )
    //             : null);
  }

  Widget buildMobileListTile() {
    return ListTile(
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
                rowItem("assets/images/question.png",
                    widget.testData.language ?? "English"),
                requiredVerticalDivider(),
                rowItem("assets/images/timer.png",
                    widget.testData.duration.toString()),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "${formatTimeFromServer(widget.testData.startDatetime!)} - ${formatTimeFromServer(widget.testData.endDatetime!)}",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff929292)),
            ),
            const SizedBox(
              height: 5,
            ),
            widget.testData.isAvailable == false
                ? Row(
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
                  )
                : widget.testData.attendStatus == "ready_to_take"
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
                                      targetExamName: widget.targetExamName,
                                    );
                                  });
                            }),
                          ),
                        ],
                      )
                    : widget.testData.attendStatus == "result_awaiting"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Result Awaiting",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                              Text(
                                'Time - ${formatTimeFromServer(widget.testData.endDatetime!)}',
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              )
                            ],
                          )
                        : widget.testData.attendStatus == "currently_open"
                            ? const Text(
                                "Currently Open",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              )
                            : const SizedBox()
          ],
        ),
      ),
    );
  }

  String formatTimeFromServer(String serverTime) {
    DateTime parsedDateTime = DateTime.parse(serverTime);
    return DateFormat.jm().format(parsedDateTime);
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
        router.goNamed('/ranking',
            pathParameters: {'testId': widget.testData.testId.toString()});
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
//ready_to_take
//"currently_open"
