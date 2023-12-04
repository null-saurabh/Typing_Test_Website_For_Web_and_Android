import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/view/widgets/learn_typing_widgets/keyboard_ui.dart';
import 'package:typingtest/view/widgets/learn_typing_widgets/left_hand_image.dart';
import 'package:typingtest/view/widgets/learn_typing_widgets/right_hand_image.dart';
import 'package:typingtest/view/widgets/learn_typing_widgets/test_string_ui.dart';

class LearnTypingTestScreen extends StatefulWidget {
  const LearnTypingTestScreen({super.key});

  @override
  State<LearnTypingTestScreen> createState() => _LearnTypingTestScreenState();
}

class _LearnTypingTestScreenState extends State<LearnTypingTestScreen> {
  // String longString =
  //     "This is a long string @=+-_`~1!2. for typing practice. Try typing it. This is a long string for typing practice. this is it a@=+-_`~1!2 3 89 @ ^ = + bcCd S A B b c { a B { } | : \" < > ? Try typing it. Try typing it. This is a long string for typing practice. Try typing it.  Try typing it. This is a long string for typing practice. Try typing it";
  int currentIndex = 0;
  DateTime? startTime;
  int totalWordsTyped = 0;
  String longString = "this is a game what are you doing sat your that";

  void resetTest() {
    setState(() {
      currentIndex = 0;
      startTime = null;
      totalWordsTyped = 0;
    });
  }


  @override
  Widget build(BuildContext context) {

    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) => buildDesktopLayout(context),
    );

  }

  Widget buildDesktopLayout(BuildContext context){

    String typedString = longString.substring(0, currentIndex);
    String currentLetter = longString[currentIndex];
    String remainingString = longString.substring(currentIndex + 1);
    print(MediaQuery.of(context).size.width *0.14);

    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
        children: [
          const SizedBox(
            height: 100,
          ),
          TestStringUi(typedString: typedString, currentLetter: currentLetter, remainingString: remainingString),
          // Section 2: Keyboard UI
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height:(MediaQuery.of(context).size.width *0.10 >200) ? 200:MediaQuery.of(context).size.width *0.10,
                    width:(MediaQuery.of(context).size.width *0.10 >200) ? 200:MediaQuery.of(context).size.width *0.10,
                    child: LeftHandImage(currentLetter: currentLetter)),
                RawKeyboardListener(
                  focusNode: FocusNode(),
                  autofocus: true,
                  onKey: (RawKeyEvent event) {
                    if (event is RawKeyDownEvent && event.character != null) {
                      startTime ??= DateTime.now();

                      final character = event.character;
                      if (character == currentLetter) {
                        if (currentIndex < longString.length - 1) {
                          setState(() {
                            currentIndex++;
                            if (character == ' ') {
                              totalWordsTyped++;
                            }
                          });
                        } else {
                          GoRouter.of(context).go('/home');
                          showTestEndedDialog(context);
                          resetTest(); // Pop twice to go back to home
                        }
                      }
                    }
                  },
                  child: KeyboardWidget(currentLetter: currentLetter),
                ),
                SizedBox(
                    height:(MediaQuery.of(context).size.width *0.10 >200) ? 200:MediaQuery.of(context).size.width *0.10 ,
                    width:(MediaQuery.of(context).size.width *0.10 >200) ? 200:MediaQuery.of(context).size.width *0.10,
                    child: RightHandImage(currentLetter: currentLetter)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context){
    // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    String typedString = longString.substring(0, currentIndex);
    String currentLetter = longString[currentIndex];
    String remainingString = longString.substring(currentIndex + 1);
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return RotatedBox(
      quarterTurns: isPortrait ?1 :0,
      child: Scaffold(
        body: Column(
          children: [
            TestStringUi(typedString: typedString, currentLetter: currentLetter, remainingString: remainingString),
            // Section 2: Keyboard UI
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height:!isPortrait ?(MediaQuery.of(context).size.width *0.14 >100) ? 100:MediaQuery.of(context).size.height *0.14 :(MediaQuery.of(context).size.height *0.14 >100) ? 100:MediaQuery.of(context).size.height *0.14,
                      width: !isPortrait ?(MediaQuery.of(context).size.width *0.14 >100) ? 100:MediaQuery.of(context).size.height *0.14 :(MediaQuery.of(context).size.height *0.14 >100) ? 100:MediaQuery.of(context).size.height *0.14,
                      child: LeftHandImage(currentLetter: currentLetter)),
                  RawKeyboardListener(
                    focusNode: FocusNode(),
                    autofocus: true,
                    onKey: (RawKeyEvent event) {
                      if (event is RawKeyDownEvent && event.character != null) {
                        startTime ??= DateTime.now();

                        final character = event.character;
                        if (character == currentLetter) {
                          if (currentIndex < longString.length - 1) {
                            setState(() {
                              currentIndex++;
                              if (character == ' ') {
                                totalWordsTyped++;
                              }
                            });
                          } else {
                            GoRouter.of(context).go('/home');
                            showTestEndedDialog(context);
                            resetTest();

                          }
                        }
                      }
                    },
                    child: KeyboardWidget(currentLetter: currentLetter),
                  ),
                  SizedBox(
                      height:!isPortrait ?(MediaQuery.of(context).size.width *0.14 >100) ? 100:MediaQuery.of(context).size.height *0.14 :(MediaQuery.of(context).size.height *0.14 >100) ? 100:MediaQuery.of(context).size.height *0.14,
                      width: !isPortrait ?(MediaQuery.of(context).size.width *0.14 >100) ? 100:MediaQuery.of(context).size.height *0.14 :(MediaQuery.of(context).size.height *0.14 >100) ? 100:MediaQuery.of(context).size.height *0.14,
                      child: RightHandImage(currentLetter: currentLetter)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  void showTestEndedDialog(BuildContext context) {
    final endTime = DateTime.now();
    final elapsedTime = endTime.difference(startTime!);
    final minutes = elapsedTime.inMinutes;
    final seconds = elapsedTime.inSeconds.remainder(60);
    final totalMinutes = minutes + seconds / 60;
    final wpm = (totalWordsTyped / totalMinutes).round();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Test Ended'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('You have completed the typing test.'),
              const SizedBox(height: 10),
              Text('Your typing speed: $wpm WPM'),
              const SizedBox(height: 10),
              Text('Words Typed: $totalWordsTyped Words'),
              const SizedBox(height: 10),
              Text('TimeTaken: $totalMinutes Minutes'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Navigator.of(context).pop();
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




