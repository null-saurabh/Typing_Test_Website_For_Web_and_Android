import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) =>  buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context){
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "SSC Typing Test - Grade A - 1",
              style: TextStyle(
                  fontSize: 16.9,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(height: 5),
            IntrinsicHeight(
              child: Row(
                children: [
                  rowItem("assets/images/ranking.png", "90 Key Strokes"),
                  requiredVerticalDivider(),
                  rowItem("assets/images/question.png", "English"),
                  requiredVerticalDivider(),
                  rowItem("assets/images/timer.png", "30 mins"),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Divider(
              thickness: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Date and Time: ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    Text(
                      "23 Oct 2023 , 10 : 00 am to 10 :00 pm",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Total Participants: ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    Text(
                      "24576",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context){
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "SSC Typing Test - Grade A - 1",
              style: TextStyle(
                  fontSize: 16.9,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(height: 5),
            IntrinsicHeight(
              child: Row(
                children: [
                  rowItem("assets/images/ranking.png", "90 Key Strokes"),
                  requiredVerticalDivider(),
                  rowItem("assets/images/question.png", "English"),
                ],
              ),
            ),
            rowItem("assets/images/timer.png", "30 mins"),
            const SizedBox(height: 8),
            Divider(
              thickness: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Date:",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Text(
                  "23 Oct 2023",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Time:",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Text(
                  "10:00 am to 10:10 pm",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Total Participants: ",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Text(
                  "24576",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
          ],
        ),
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

  Widget requiredVerticalDivider() {
    return SizedBox(
      height: 20,
      child: VerticalDivider(
        color: Colors.grey.withOpacity(0.5),
        thickness: 1.2,
      ),
    );
  }
}
