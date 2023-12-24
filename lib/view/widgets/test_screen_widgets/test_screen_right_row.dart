import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
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
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) => buildDesktopLayout(context),
    );
  }
  Widget buildDesktopLayout(BuildContext context){
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

  Widget buildMobileLayout(BuildContext context){
    return Column(
      children: [
        submitButton(context),
      ],
    );
  }

  Widget submitButton(BuildContext context){
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(const Color(0xff369CBC)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xff369CBC)),
          borderRadius: BorderRadius.circular(5),
        )),
      ),
      onPressed: () async {
        try {
          final DateTime now = DateTime.now();
          final Duration elapsed = now.difference(startTime);


          // Task 1: Update time taken and pop the current route
          Provider.of<TestCalculatorProvider>(context, listen: false).updateTimeTaken(elapsed.inSeconds);

          // Task 2: Submit the test
         await Provider.of<TestCalculatorProvider>(context, listen: false).submitTest();
          String originalParagraph = '';
          RichText typedParagraph = RichText( text: TextSpan (text: ''));

          // Task 3: Get necessary data from the provider and save results
          if(context.mounted) {
            final TestModel testModel = Provider
                .of<TestCalculatorProvider>(context, listen: false)
                .testModel;

            final String timeTaken = testModel.timeTaken.toInt().toString();
            final String omittedWords = testModel.omittedWords.toString();
            final String speed = testModel.wpm.toInt().toString();
            final String totalWords = Provider
                .of<TestCalculatorProvider>(context, listen: false)
                .testModel
                .totalWords
                .toString();
            final String backspaceCount = testModel.backSpaceCount.toInt()
                .toString();
            final String accuracy = testModel.accuracy.toInt().toString();
            final String wordsTyped = testModel.wordsTyped.toInt().toString();
            final String correctWords = testModel.correctWords.toInt()
                .toString();
            final String incorrectWords = testModel.incorrectWords.toInt()
                .toString();
            final String fullMistake = testModel.fullMistake.toInt().toString();
            final String halfMistake = testModel.halfMistake.toInt().toString();
            final String testId = testData.testId.toString();
            originalParagraph = Provider
                .of<TestCalculatorProvider>(context, listen: false)
                .testModel
                .originalText;
            typedParagraph = Provider
                .of<TestCalculatorProvider>(context, listen: false)
                .testModel
                .markedTypedText;

            await Provider.of<ApiProvider>(context, listen: false).saveResult(
                timeTaken,
                omittedWords,
                speed,
                totalWords,
                backspaceCount,
                accuracy,
                wordsTyped,
                correctWords,
                incorrectWords,
                fullMistake,
                halfMistake,
                testId);
            // print("after save result");

          }
          if(context.mounted) {
            GoRouter.of(context).pop();

          if (testData.type == "PRACTICE") {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ResultDialog(testId: testData.testId!,isPractice: true,typedParagraph: typedParagraph,originalParagraph: originalParagraph);
              },
            );
          } else if (testData.type == "LIVE") {
            showTestEndedDialog(context);
          }
         }
        } catch (e) {
          rethrow;
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
                GoRouter.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

}

