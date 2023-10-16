import 'package:flutter/material.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({super.key});

  @override
  Widget build(BuildContext context) {
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
                const ScoreList(
                  title: "Total Words Typed",
                  value: ": 34",
                ),
                const ScoreList(
                  title: "Correct Words Typed",
                  value: ": 5",
                ),
                const ScoreList(
                  title: "Incorrect Words Typed",
                  value: ": 23",
                ),
                const ScoreList(
                  title: "Omitted Words",
                  value: ": 4",
                ),
                const ScoreList(
                  title: "Effective Correct Words",
                  value: ": 0",
                ),
                const SizedBox(height: 15,),

                Row(
                  children: [
                    nextButton(context),
                    const SizedBox(
                      width: 10,
                    ),
                    tryAgainButton(context)
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          const SizedBox(
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
          const Spacer(),
        ],
      ),
    );
  }
}

Widget tryAgainButton(BuildContext context) {
  return ElevatedButton(
    style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xff369CBC)),
            borderRadius: BorderRadius.circular(5)))),
    onPressed: () async {
      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SubscriptionPage()));
    },
    child: const Text(
      'Try Again',
      style: TextStyle(color: Color(0xff369CBC)),
    ),
  );
}

Widget nextButton(BuildContext context) {
  return ElevatedButton(
    style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(const Color(0xff369CBC)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xff369CBC)),
            borderRadius: BorderRadius.circular(5)))),
    onPressed: () async {
      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfilePage()));
    },
    child: const Text(
      'Next Test',
      style: TextStyle(color: Colors.white),
    ),
  );
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
            width: 50,
            child: Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ))
      ],
    );
  }
}
