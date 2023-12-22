import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/view/widgets/pop_up_top_heading_bar.dart';
import 'package:typingtest/view/widgets/result_widgets/result_box.dart';
import 'package:typingtest/view_model/provider/learn_menu_provider.dart';

class LearnResult extends StatelessWidget {
  final Duration elapsedTime;
  final int totalWordsTyped;
  final String testName;

  const LearnResult(
      {required this.totalWordsTyped,
      required this.elapsedTime,
      required this.testName,
      super.key});

  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.80,
          height: MediaQuery.of(context).size.height * 0.80,
          child: ScreenTypeLayout.builder(
            mobile: (BuildContext context) => buildMobileLayout(context),
            desktop: (BuildContext context) => buildDesktopLayout(context),
          ),
        ),
      ),
    );
  }

  Widget buildDesktopLayout(BuildContext context) {
    final minutes = elapsedTime.inMinutes;
    final seconds = elapsedTime.inSeconds.remainder(60);
    final totalMinutes = (minutes + seconds / 60);
    final wpm = (totalWordsTyped / totalMinutes).round();

    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PopUpScreensTopHeadingBar(examName: testName),
          Expanded(
            child: Padding(
              padding:const EdgeInsets.only(top: 20.0, bottom: 20,left: 32,right: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Result",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ResultBox(
                        title: "Net Speed",
                        value: "$wpm WPM",
                      ),
                      ResultBox(
                        title: "Total Words Typed",
                        value: '$totalWordsTyped Words',
                      ),
                      ResultBox(
                        title: "Time Taken",
                        value: '${totalMinutes.toStringAsFixed(2)} Minutes',
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      customButton(context,"Try Again", () {
                        GoRouter.of(context).pop();
                        String nextTestScreen =
                            Provider.of<LearnMenuProvider>(context, listen: false)
                                .currentMenuItem;
                        GoRouter.of(context).go('/learn/$nextTestScreen');
                      },),
                      const SizedBox(width: 10,),
                      customButton(context,"Next Exercise", () {
                        GoRouter.of(context).pop();
                        Provider.of<LearnMenuProvider>(context, listen: false)
                            .goToNextTest();
                        String nextTestScreen =
                            Provider.of<LearnMenuProvider>(context, listen: false)
                                .currentMenuItem;
                        GoRouter.of(context).go('/learn/$nextTestScreen');
                      },)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context) {
    return const Placeholder();
  }

  Widget customButton(BuildContext context,String title,VoidCallback onTap){
    return ElevatedButton(
      style: ButtonStyle(elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(const Color(0xff369CBC)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),borderRadius: BorderRadius.circular(5)
          ))),
      onPressed: onTap,
      child: Text(title, style: const TextStyle(color: Colors.white),),
    );
  }
}
