import 'dart:async';
import 'package:flutter/material.dart';
import 'package:typingtest/view/widgets/test_screen_widgets/right_row.dart';
import 'package:typingtest/view/widgets/test_screen_widgets/text_field.dart';
import 'package:typingtest/view/widgets/test_screen_widgets/text_to_write.dart';
import 'package:typingtest/view/widgets/top_navigation_bar.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  bool testCompleted = false;
  late Timer _timer;
  int _start = 10 * 60;


  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
        _submitTest();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void _submitTest() {
    if (!testCompleted) {
      setState(() {
        testCompleted = true;
      });
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopNavigationBar(),
            Container(
              width: double.infinity,
              height: 50,
              color: const Color(0xff17414F),
              child: Padding(
                padding: const EdgeInsets.only(left: 40,right: 25),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("SSC Typing Test - Grade A-1",style:TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white),

                        ),
                        child:Container(
                          child: timer(),
                        ) ,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded  (
                  flex: 8,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height - 125,
                            decoration: const BoxDecoration(
                                color: Color(0xffF5FAFC),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  TextToWrite(),
                                  SizedBox(height: 20),
                                  TextFieldContainer(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(22.0),
                    child: RightRow(),
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget timer(){
    return Padding(
      padding: const EdgeInsets.only(left: 12,right: 12,top: 8.0,bottom: 8),
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: "Time Left: ",
              style: TextStyle(color: Colors.white, fontSize: 16.0,fontWeight: FontWeight.w500),
            ),
            TextSpan(
              text: "${_start ~/ 60}:${(_start % 60).toString().padLeft(2, '0')}",
              style: const TextStyle(color: Colors.white, fontSize: 16.0,fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

}












// if (testCompleted) ...[
//   const SizedBox(height: 20),
//   Text("Accuracy: ${accuracy.toStringAsFixed(2)}%"),
//   // Show other metrics here.
// ],

