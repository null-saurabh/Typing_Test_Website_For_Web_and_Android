import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/view/widgets/learn_typing_widgets/keyboard_ui.dart';
import 'package:typingtest/view/widgets/learn_typing_widgets/learn_result.dart';
import 'package:typingtest/view/widgets/learn_typing_widgets/left_hand_image.dart';
import 'package:typingtest/view/widgets/learn_typing_widgets/right_hand_image.dart';
import 'package:typingtest/view/widgets/learn_typing_widgets/test_string_ui.dart';
import 'package:typingtest/view_model/provider/learn_menu_provider.dart';

// import 'learn_menu.dart';

// void main() async {
//   runApp(
//   MultiProvider(
//     providers: [
//       ChangeNotifierProvider(
//         create: (context) => LearnMenuProvider(),
//       ),
//     ],
//     child: const MyApp(),
//   ),);
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
// // This widget is the root
// // of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: "ListView.builder",
//         theme: ThemeData(primarySwatch: Colors.green),
//         debugShowCheckedModeBanner: false,
//         // home : new ListViewBuilder(),  NO Need To Use Unnecessary New Keyword
//         home: const LearnMenuScreen());
//   }
// }

class LearnTypingTestScreen extends StatefulWidget {
  final String testName;
  const LearnTypingTestScreen({required this.testName, super.key});

  @override
  State<LearnTypingTestScreen> createState() => _LearnTypingTestScreenState();
}

class _LearnTypingTestScreenState extends State<LearnTypingTestScreen> {
  int currentIndex = 0;
  DateTime? startTime;
  int totalWordsTyped = 0;
  late int testIndex;
  // String longString = "this is a game what are you doing sat your that";

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      int index = Provider.of<LearnMenuProvider>(context, listen: false)
          .getMenuItems
          .indexOf(widget.testName);
      Provider.of<LearnMenuProvider>(context, listen: false)
          .setTestIndex(index);
    });
    int index = Provider.of<LearnMenuProvider>(context, listen: false)
        .getMenuItems
        .indexOf(widget.testName);
    testIndex = index;
    super.initState();
  }

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

  Widget buildDesktopLayout(BuildContext context) {
    String longString =
        Provider.of<LearnMenuProvider>(context).currentTestString;
    String typedString = longString.substring(0, currentIndex);
    String currentLetter = longString[currentIndex];
    String remainingString = longString.substring(currentIndex + 1);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            // mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  GoRouter.of(context).go('/menu');
                  // GoRouter.of(context).pop();
                },
                child: const Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xff369CBC),
                      ),
                    ),
                    SizedBox(width: 2.5),
                    Text(
                      "Back",
                      style: TextStyle(color: Color(0xff369CBC), fontSize: 18),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      children: [
                        TextSpan(
                          text: '${testIndex + 1}. ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'Learn Keys: [ ${widget.testName} ]',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          TestStringUi(
              typedString: typedString,
              currentLetter: currentLetter,
              remainingString: remainingString),
          // Section 2: Keyboard UI
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: (MediaQuery.of(context).size.width * 0.10 > 200)
                      ? 200
                      : MediaQuery.of(context).size.width * 0.10,
                  width: (MediaQuery.of(context).size.width * 0.10 > 200)
                      ? 200
                      : MediaQuery.of(context).size.width * 0.10,
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
                            // print(totalWordsTyped);
                          }
                        });
                      } else {
                        totalWordsTyped++;
                        GoRouter.of(context).go('/menu');

                        final endTime = DateTime.now();
                        final elapsedTime = endTime.difference(startTime!);

                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return LearnResult(totalWordsTyped: totalWordsTyped, elapsedTime: elapsedTime,testName: '${testIndex + 1}. Learn Keys: [ ${widget.testName} ]',typedParagraph: longString,);
                            }
                        ).then((_) {
                          resetTest(); // This will be called after the dialog is dismissed
                        });
                      }
                    }
                  }
                },
                child: SizedBox(
                    child: KeyboardWidget(currentLetter: currentLetter)),
              ),
              SizedBox(
                  height: (MediaQuery.of(context).size.width * 0.10 > 200)
                      ? 200
                      : MediaQuery.of(context).size.width * 0.10,
                  width: (MediaQuery.of(context).size.width * 0.10 > 200)
                      ? 200
                      : MediaQuery.of(context).size.width * 0.10,
                  child: RightHandImage(currentLetter: currentLetter)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context) {
    String longString =
        Provider.of<LearnMenuProvider>(context).currentTestString;
    String typedString = longString.substring(0, currentIndex);
    String currentLetter = longString[currentIndex];
    String remainingString = longString.substring(currentIndex + 1);
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return RotatedBox(
      quarterTurns: isPortrait ? 1 : 0,
      child: Scaffold(
        body: Column(
          children: [
            if (isPortrait)
              const SizedBox(
                height: 20,
              ),
            Padding(
              padding: EdgeInsets.only(right: isPortrait ? 29 : 0),
              child: TestStringUi(
                  typedString: typedString,
                  currentLetter: currentLetter,
                  remainingString: remainingString),
            ),
            const SizedBox(
              height: 15,
            ),
            // Section 2: Keyboard UI
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: !isPortrait
                                  ? (MediaQuery.of(context).size.width * 0.14 >
                                          100)
                                      ? 100
                                      : MediaQuery.of(context).size.width * 0.14
                                  : (MediaQuery.of(context).size.height * 0.14 >
                                          100)
                                      ? 100
                                      : MediaQuery.of(context).size.height *
                                          0.14,
                              width: !isPortrait
                                  ? (MediaQuery.of(context).size.width * 0.14 >
                                          100)
                                      ? 100
                                      : MediaQuery.of(context).size.width * 0.14
                                  : (MediaQuery.of(context).size.height * 0.14 >
                                          100)
                                      ? 100
                                      : MediaQuery.of(context).size.height *
                                          0.14,
                              child:
                                  LeftHandImage(currentLetter: currentLetter)),
                          RawKeyboardListener(
                            focusNode: FocusNode(),
                            autofocus: true,
                            onKey: (RawKeyEvent event) {
                              if (event is RawKeyDownEvent &&
                                  event.character != null) {
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
                                    totalWordsTyped++;

                                    GoRouter.of(context).go('/menu');
                                    final endTime = DateTime.now();
                                    final elapsedTime = endTime.difference(startTime!);

                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return LearnResult(totalWordsTyped: totalWordsTyped, elapsedTime: elapsedTime, testName: '${testIndex + 1}. Learn Keys: [ ${widget.testName} ]',typedParagraph: longString);
                                        }
                                    ).then((_) {
                                      resetTest();
                                    });
                                  }
                                }
                              }
                            },
                            child: SizedBox(
                                child: KeyboardWidget(
                                    currentLetter: currentLetter)),
                          ),
                          SizedBox(
                              height: !isPortrait
                                  ? (MediaQuery.of(context).size.width * 0.14 >
                                          100)
                                      ? 100
                                      : MediaQuery.of(context).size.width * 0.14
                                  : (MediaQuery.of(context).size.height * 0.14 >
                                          100)
                                      ? 100
                                      : MediaQuery.of(context).size.height *
                                          0.14,
                              width: !isPortrait
                                  ? (MediaQuery.of(context).size.width * 0.14 >
                                          100)
                                      ? 100
                                      : MediaQuery.of(context).size.width * 0.14
                                  : (MediaQuery.of(context).size.height * 0.14 >
                                          100)
                                      ? 100
                                      : MediaQuery.of(context).size.height *
                                          0.14,
                              child:
                                  RightHandImage(currentLetter: currentLetter)),
                        ],
                      ),
                    ],
                  ),
                ),
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

}
