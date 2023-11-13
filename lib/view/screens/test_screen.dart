import 'dart:async';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/model/live_test_api_model.dart';
import 'package:typingtest/view/widgets/test_screen_widgets/test_screen_right_row.dart';
import 'package:typingtest/view/widgets/test_screen_widgets/text_field.dart';
import 'package:typingtest/view/widgets/test_screen_widgets/text_to_write.dart';

class TestScreen extends StatefulWidget {
  final LiveTestData testData;
  const TestScreen({required this.testData,super.key});

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
        if (mounted) {
          setState(() {
            _start--;
          });
        }

      }
    });
  }

  void _submitTest() {
    if (!testCompleted) {
      if (mounted) {
        setState(() {
          testCompleted = true;
        });
      }
      _timer.cancel();
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) => buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const TopNavigationBar(),
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
                      Text(widget.testData.targetExam!,style:const TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white),

                        ),
                        child:timer() ,
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
                            child:  Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  TextToWrite(testData: widget.testData,),
                                  const SizedBox(height: 20),
                                  const TextFieldContainer(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: RightRow(testData: widget.testData,),
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const TopNavigationBar(),
          Container(
            width: double.infinity,
            height: 50,
            color: const Color(0xff17414F),
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 190,
                        child: Text(widget.testData.targetExam!,style:const TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),)),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white),

                      ),
                      child:timer() ,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        TextToWrite(testData: widget.testData,),
                        const SizedBox(height: 20),
                        const TextFieldContainer(),
                      ],
                    ),
                  ),
                  Center(
                    child: RightRow(testData: widget.testData,),
                  ),
                ],
              ),
            ),
          )

        ],
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


