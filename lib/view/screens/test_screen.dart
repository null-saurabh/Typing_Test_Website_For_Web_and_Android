import 'dart:async';
import 'package:flutter/material.dart';
import 'package:typingtest/view/widgets/test_screen_widgets/right_row.dart';
import 'package:typingtest/view/widgets/test_screen_widgets/test_screen_nav_bar.dart';
import 'package:typingtest/view/widgets/test_screen_widgets/text_field.dart';
import 'package:typingtest/view/widgets/test_screen_widgets/text_to_write.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TestScreenNavBar(),
            // const SizedBox(height: 15,),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          timer(),
                          const SizedBox(height: 15),
                          Container(
                            height: MediaQuery.of(context).size.height - 125,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  TextToWrite(),
                                  SizedBox(height: 20),
                                  Expanded(
                                    child: TextFieldContainer(),
                                  ),
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
                  child: RightRow()
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget timer(){
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Time Left: ",
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          TextSpan(
            text: "${_start ~/ 60}:${(_start % 60).toString().padLeft(2, '0')}",
            style: const TextStyle(color: Colors.blue, fontSize: 16.0),
          ),
        ],
      ),
    );
  }

}












// if (testCompleted) ...[
//   const SizedBox(height: 20),
//   Text("Accuracy: ${accuracy.toStringAsFixed(2)}%"),
//   // Show other metrics here.
// ],

