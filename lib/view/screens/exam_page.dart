import 'package:flutter/material.dart';
import 'package:typingtest/view/screens/instruction_page.dart';
import 'package:typingtest/view/widgets/top_navigation_bar.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const TopNavigationBar(),
            // const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "All Tests > SSC Typing Tests",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Live Tests",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      dailyTest("1",context),
                      const SizedBox(width: 15),
                      dailyTest("2",context),
                      const SizedBox(width: 15),
                      dailyTest("3",context),
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: const Color(0xff369CBC).withOpacity(0.75),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mock up tests",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        if (index <= 2) {
                          return mockTestListTile(true, index + 1,context);
                        } else {
                          return mockTestListTile(false, index + 1,context);
                        }
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget mockTestListTile(bool upgraded, int index,BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: IntrinsicHeight(
        child: Stack(children: [
          Container(
            width: 1.5,
            color: const Color(0xff369CBC),
          ),
          ListTile(
            title: Text(
              "SSC Typing Test - Grade A - $index",
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            subtitle: IntrinsicHeight(
              child: Row(
                children: [
                  rowItem("assets/images/ranking.png", "90 Marks"),
                  requiredVerticalDivider(),
                  rowItem("assets/images/question.png", "30 questions"),
                  requiredVerticalDivider(),
                  rowItem("assets/images/timer.png", "30 mins"),
                ],
              ),
            ),
            trailing: startNowButton(context),
          ),
        ]),
      ),
    );
  }

  Widget requiredVerticalDivider() {
    return SizedBox(
      height: 20,
      child: VerticalDivider(
        color: Colors.grey.withOpacity(0.5),
        thickness: 1.2,
      ),
    );
  }

  Widget rowItem(String image, String text) {
    return Row(
      children: [
        Image.asset(
          image,
          height: 20,
          width: 20,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff929292)),
        )
      ],
    );
  }

  Widget startNowButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),
              borderRadius: BorderRadius.circular(5)))),
      onPressed: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const InstructionPage(),
          ),
        );
      },
      child: const Text(
        "Start Now",
        style: TextStyle(color: Color(0xff369CBC)),
      ),
    );
  }

  Widget dailyTest(String testNumber,BuildContext context) {
    return Container(
      height: 100,
      width: 275,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Daily Practice test - $testNumber",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            startNowButton(context),
          ],
        ),
      ),
    );
  }
}
