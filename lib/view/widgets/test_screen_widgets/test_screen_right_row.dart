import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:typingtest/model/live_test_api_model.dart';
import 'package:typingtest/model/save_test_model.dart';
import 'package:typingtest/view/widgets/result_widgets/result_dialog.dart';
import 'package:typingtest/view_model/provider/api_provider.dart';
import 'package:typingtest/view_model/provider/login_provider.dart';
import 'package:typingtest/view_model/provider/save_test_provider.dart';

class RightRow extends StatelessWidget {
  final LiveTestData testData;
  final DateTime startTime;
  const RightRow({
    required this.testData,
    required this.startTime,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: 200.0,
          ),
          width: double.infinity,
          height: 200,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/profile.png",
                height: 120,
                width: 120,
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<LoginUserProvider>(builder: (context, userProvider, child){
                final isLoggedIn = userProvider.user != null;
                return Text(
                  isLoggedIn ? userProvider.user!.displayName ?? "User" :"User not logged in" ,
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                );
              })
            ],
          ),
        ),
        const SizedBox(height: 20,),
        submitButton(context),
      ],
    );
  }


  Widget submitButton(BuildContext context){
    return ElevatedButton(
      style: ButtonStyle(elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(const Color(0xff369CBC)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),borderRadius: BorderRadius.circular(5)
          ))),
      onPressed: () async {
        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return const ResultDialog(testId: 6344);
        //     }
        // );
        print("clicked");

        try {
          print("in try");
          final DateTime now = DateTime.now();
          final Duration elapsed = now.difference(startTime);
          Provider.of<TestModelProvider>(context, listen: false).updateTimeTaken(elapsed.inSeconds);
          Navigator.pop(context);
          await Provider.of<TestModelProvider>(context, listen: false).submitTest();

          await Future.microtask(() {
            final TestModel testModel = Provider.of<TestModelProvider>(context, listen: false).testModel;

            final String timeTaken = testModel.timeTaken.toString();
            final String speed = testModel.wpm;
            final String backspaceCount = testModel.backSpaceCount.toString();
            final String accuracy = testModel.accuracy;
            final String wordsTyped = testModel.wordsTyped.toString();
            final String correctWords = testModel.correctWords.toString();
            final String incorrectWords = testModel.incorrectWords.toString();
            final String fullMistake = testModel.fullMistake.toString();
            final String halfMistake = testModel.halfMistake.toString();
            final String testId = testData.testId.toString();

            Provider.of<ApiProvider>(context,listen: false).saveResult(timeTaken, speed, backspaceCount, accuracy, wordsTyped, correctWords, incorrectWords,fullMistake, halfMistake, testId);

            if (testData.type == "PRACTICE") {
              print(testData.testId);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ResultDialog(testId: testData.testId!);
                },
              );
            } else if (testData.type == "LIVE") {
              showTestEndedDialog(context);
            }
          });

        } catch (e) {
          // Handle exceptions, log, or show an error message
          print('Error: $e');
        }
      },
      child: const Text('Submit', style: TextStyle(color: Colors.white),),
    );
  }

  void showTestEndedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Test Submited'),
          content: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('You can check your result in history after test Ends.'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

}

