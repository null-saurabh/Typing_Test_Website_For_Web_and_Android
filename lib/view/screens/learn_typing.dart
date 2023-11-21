import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  String longString =
      "This is a long string @=+-_`~1!2. for typing practice. Try typing it. This is a long string for typing practice. this is it a@=+-_`~1!2 3 89 @ ^ = + bcCd S A B b c { a B { } | : \" < > ? Try typing it. Try typing it. This is a long string for typing practice. Try typing it.  Try typing it. This is a long string for typing practice. Try typing it";
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    String typedString = longString.substring(0, currentIndex);
    String currentLetter = longString[currentIndex];
    String remainingString = longString.substring(currentIndex + 1);
    // print(currentLetter);

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
                SizedBox(height:200,width:200,child: LeftHandImage(currentLetter: currentLetter)),
                
                RawKeyboardListener(
                  focusNode: FocusNode(),
                  autofocus: true,
                  onKey: (RawKeyEvent event) {
                    if (event is RawKeyDownEvent && event.character != null) {
                      final character = event.character;
                      if (character == currentLetter) {
                        if (currentIndex < longString.length - 1) {
                          setState(() {
                            currentIndex++;
                          });
                        } else {
                          // Navigator.of(context).pop(); // Pop twice to go back to home
                          showTestEndedDialog(context);
                        }
                      }
                    }
                  },
                  child: KeyboardWidget(currentLetter: currentLetter),
                ),
                SizedBox(height:200,width:200,child: RightHandImage(currentLetter: currentLetter)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showTestEndedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Test Ended'),
          content: const Text('You have completed the typing test.'),
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




