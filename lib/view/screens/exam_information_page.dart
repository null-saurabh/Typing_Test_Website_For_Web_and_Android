import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/view/widgets/exam_information_widgets/gradient_start_button_container.dart';
// import 'package:typingtest/view_model/provider/learn_menu_provider.dart';

import '../widgets/exam_information_widgets/bullet_point_maker.dart';

// void main() async {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => LearnMenuProvider(),
//         ),
//       ],
//       child: const MyApp(),
//     ),
//   );
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
//         home: const ExamInformation(
//           targetExamName: "SSC_Typing_Tests",
//         ));
//   }
// }

class ExamInformation extends StatelessWidget {
  final String targetExamName;
  const ExamInformation({required this.targetExamName, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildDesktopLayout(context),
      desktop: (BuildContext context) => buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context) {
    final scrollController1 = ScrollController();
    String cglDetail1 = "The SSC CGL (Combined Graduate Level) examination is a competitive exam conducted by the Staff Selection Commission (SSC) to recruit candidates for various posts in the central government departments and ministries. The SSC CGL exam consists of four tiers";
    String cglDetail2 = "The Tier-IV of the SSC CGL exam includes a typing test as a mandatory requirement for some posts, such as Tax Assistant and Data Entry Operator. The typing test is conducted to assess the typing speed and accuracy of the candidate on a computer. The typing test is only qualifying in nature, and the marks obtained in the typing test are not included in the final merit list. However, it is essential to clear the typing test to be eligible for the final selection process.";

    String cglGuidelines = "The typing test for the SSC CGL exam is conducted in English or Hindi, depending on the preference of the candidate. The candidate must type a given passage accurately within the given time limit. The typing speed required for the SSC CGL typing test is 35 words per minute (wpm) in English and 30 wpm in Hindi. The duration of the typing test is 10 minutes, and the passage to be typed is selected randomly from a database of passages. If any candidate does not opt for any medium for typing, his option will be deemed to be for the English medium. The typing test is conducted using the SSC-NIC software, which records the key depressions and errors made by the candidate. The candidate is allowed to correct the errors during the typing test, but no extra time is given for that. The candidate must type the given passage as it is, without making any changes in the spelling, punctuation, or format.";
    List<String> cglGuidelinePoints = cglGuidelines.split(". ");

    String chslDetail1 = "The SSC CHSL (Combined Graduate Level) examination is a competitive exam conducted by the Staff Selection Commission (SSC) to recruit candidates for various posts in the central government departments and ministries. The SSC CHSL exam consists of four tiers";
    String chslDetail2 = "The Tier-IV of the SSC CHSL exam includes a typing test as a mandatory requirement for some posts, such as Tax Assistant and Data Entry Operator. The typing test is conducted to assess the typing speed and accuracy of the candidate on a computer. The typing test is only qualifying in nature, and the marks obtained in the typing test are not included in the final merit list. However, it is essential to clear the typing test to be eligible for the final selection process.";

    String chslGuidelines = "The typing test for the SSC CHSL exam is conducted in English or Hindi, depending on the preference of the candidate. The candidate must type a given passage accurately within the given time limit. The typing speed required for the SSC CHSL typing test is 35 words per minute (wpm) in English and 30 wpm in Hindi. The duration of the typing test is 10 minutes, and the passage to be typed is selected randomly from a database of passages. If any candidate does not opt for any medium for typing, his option will be deemed to be for the English medium. The typing test is conducted using the SSC-NIC software, which records the key depressions and errors made by the candidate. The candidate is allowed to correct the errors during the typing test, but no extra time is given for that. The candidate must type the given passage as it is, without making any changes in the spelling, punctuation, or format.";
    List<String> chslGuidelinePoints = chslGuidelines.split(". ");

    List<String> fullMistakes = ["For every omission of a word/ figure.","For every omission of a word/ figure.","For every addition of a word/figure not found in the passage."];
    List<String> halfMistakes = ["Spacing Errors: Where extra space is provided between two words.","For every spelling error committed by way of repetition, or addition or transposition or omission or substitution of a letter/letters.","Wrong Capitalisation: Wrong use of capital letter for small letter and vice-versa. (This does not apply to Hindi typewriting scripts)."];

    return Scaffold(
      body: Scrollbar(
        controller: scrollController1,
        interactive: false,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: scrollController1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/banner.png",
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  targetExamName,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                GradiantStartButton(targetExamName: targetExamName,),
                const SizedBox(
                  height: 20,
                ),
                targetExamName.contains('CGL')
                ?Text(cglDetail1,style: const TextStyle(fontSize: 18),)
                :Text(chslDetail1,style: const TextStyle(fontSize: 18),),
                const SizedBox(
                  height: 20,
                ),
                targetExamName.contains('CGL')
                ?Text(cglDetail2,style: const TextStyle(fontSize: 18))
                :Text(chslDetail2,style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 20,),
                Text("$targetExamName Guidelines",style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),),
                const SizedBox(height: 20,),

                targetExamName.contains('CGL')
                ?BulletPoints(stringPoints: cglGuidelinePoints)
                :BulletPoints(stringPoints: chslGuidelinePoints),
                const SizedBox(height: 20,),
                Text("$targetExamName Error Calculation",style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),),
                const SizedBox(height: 20,),
                RichText(
                  text: const TextSpan(
                    // style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Full Mistakes: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'The following errors are treated as full mistakes:–',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                BulletPoints(stringPoints: fullMistakes),
                const SizedBox(height: 20,),
                RichText(
                  text: const TextSpan(
                    // style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Half Mistakes: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'The following errors are treated as full mistakes:–',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                BulletPoints(stringPoints: halfMistakes),
                const SizedBox(height: 20,),
                GradiantStartButton(targetExamName: targetExamName,),
                const SizedBox(height: 20,),


              ],
            ),
          ),
        ),
      ),
    );
  }
}


