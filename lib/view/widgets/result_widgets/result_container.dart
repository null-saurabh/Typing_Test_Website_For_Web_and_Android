import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/model/result_api_modal.dart';

class ResultContainer extends StatelessWidget {
  final ResultData result;
  const ResultContainer({required this.result,super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) => buildDesktopLayout(context),
    );
  }
  Widget buildDesktopLayout(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.25))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Words",
                    style:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                const SizedBox(height: 5,),
                ScoreList(
                  title: "Total Words Typed",
                  value: ": ${result.wordsTyped}",
                ),
                ScoreList(
                  title: "Correct Words Typed",
                  value: ": ${result.wordsCorrect}",
                ),
                ScoreList(
                  title: "Incorrect Words Typed",
                  value: ": ${result.wordIncorrect}",
                ),
                const ScoreList(
                  title: "Omitted Words",
                  value: ": null",
                ),
                ScoreList(
                  title: "Backspace Count",
                  value: ": ${result.backspaceCount}",
                ),
                const SizedBox(height: 15,),

              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Mistakes",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(height: 5),
                ScoreList(
                  title: "Errors",
                  value: ": ${result.fullMistakes! + result.halfMistakes!}",
                ),
                ScoreList(
                  title: "Full Mistakes",
                  value: ": ${result.fullMistakes}",
                ),
                ScoreList(
                  title: "Half Mistakes",
                  value: ": ${result.halfMistakes}",
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.25))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            // width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Words",
                    style:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                const SizedBox(height: 5,),
                ScoreList(
                  title: "Total Words Typed",
                  value: ": ${result.wordsTyped}",
                ),
                ScoreList(
                  title: "Correct Words Typed",
                  value: ": ${result.wordsCorrect}",
                ),
                ScoreList(
                  title: "Incorrect Words Typed",
                  value: ": ${result.wordIncorrect}",
                ),
                const ScoreList(
                  title: "Omitted Words",
                  value: ": null",
                ),
                ScoreList(
                  title: "Backspace Count",
                  value: ": ${result.backspaceCount}",
                ),
                const SizedBox(height: 15,),

              ],
            ),
          ),
          const SizedBox(height: 15,),
          SizedBox(
            // width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Mistakes",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(height: 5),
                ScoreList(
                  title: "Errors",
                  value: ": ${result.fullMistakes! + result.halfMistakes!}",
                ),
                ScoreList(
                  title: "Full Mistakes",
                  value: ": ${result.fullMistakes}",
                ),
                ScoreList(
                  title: "Half Mistakes",
                  value: ": ${result.halfMistakes}",
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class ScoreList extends StatelessWidget {
  final String title;
  final String value;
  const ScoreList({
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ),
        SizedBox(
            width: 58,
            child: Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ))
      ],
    );
  }
}
