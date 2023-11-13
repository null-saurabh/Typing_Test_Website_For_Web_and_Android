import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({super.key});

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
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Words",
                    style:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                SizedBox(height: 5,),
                ScoreList(
                  title: "Total Words Typed",
                  value: ": 34",
                ),
                ScoreList(
                  title: "Correct Words Typed",
                  value: ": 5",
                ),
                ScoreList(
                  title: "Incorrect Words Typed",
                  value: ": 23",
                ),
                ScoreList(
                  title: "Omitted Words",
                  value: ": 4",
                ),
                ScoreList(
                  title: "Effective Correct Words",
                  value: ": 0",
                ),
                SizedBox(height: 15,),

              ],
            ),
          ),
          Spacer(),
          SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mistakes",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                SizedBox(height: 5),
                ScoreList(
                  title: "Errors",
                  value: ": 34",
                ),
                ScoreList(
                  title: "Full Mistakes",
                  value: ": 5",
                ),
                ScoreList(
                  title: "Half Mistakes",
                  value: ": 23",
                ),
              ],
            ),
          ),
          Spacer(),
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            // width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Words",
                    style:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                SizedBox(height: 5,),
                ScoreList(
                  title: "Total Words Typed",
                  value: ": 340",
                ),
                ScoreList(
                  title: "Correct Words Typed",
                  value: ": 5",
                ),
                ScoreList(
                  title: "Incorrect Words Typed",
                  value: ": 23",
                ),
                ScoreList(
                  title: "Omitted Words",
                  value: ": 4",
                ),
                ScoreList(
                  title: "Effective Correct Words",
                  value: ": 0",
                ),
                SizedBox(height: 15,),

              ],
            ),
          ),
          SizedBox(height: 15,),
          SizedBox(
            // width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mistakes",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                SizedBox(height: 5),
                ScoreList(
                  title: "Errors",
                  value: ": 34",
                ),
                ScoreList(
                  title: "Full Mistakes",
                  value: ": 5",
                ),
                ScoreList(
                  title: "Half Mistakes",
                  value: ": 23",
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
