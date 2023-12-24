import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/model/result_api_modal.dart';

class TitleContainer extends StatelessWidget {
  final ResultData resultData;
  const TitleContainer({
    required this.resultData,
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
            Text(
              resultData.testName!,
              style: const TextStyle(
                  fontSize: 16.9,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(height: 5),
            IntrinsicHeight(
              child: Row(
                children: [
                  rowItem("assets/images/question.png", resultData.language!),
                  requiredVerticalDivider(),
                  rowItem("assets/images/ranking.png",resultData.totalCandidate.toString()),

                  // requiredVerticalDivider(),
                  // rowItem("assets/images/timer.png", resultData.dur),
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
                    const Text(
                      "Date and Time: ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    Text(
                      "${DateTime.parse(resultData.startDatetime ?? "2023-12-23 00:45:00").day} ${_getMonth(DateTime.parse(resultData.startDatetime??"2023-12-23 00:45:00").month)} ${DateTime.parse(resultData.startDatetime ?? "2023-12-23 00:45:00").year}, ${_formatTime(DateTime.parse(resultData.startDatetime ?? "2023-12-23 00:45:00"))} to ${_formatTime(DateTime.parse(resultData.endDatetime ?? "2023-12-25 17:41:00"))}",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Total Participants: ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    Text(
                      resultData.totalCandidate.toString(),
                      style: const TextStyle(
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
            Text(
              resultData.testName!,
              style: const TextStyle(
                  fontSize: 16.9,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(height: 5),
            IntrinsicHeight(
              child: Row(
                children: [
                  rowItem("assets/images/question.png", resultData.language!),
                  requiredVerticalDivider(),
                  rowItem("assets/images/ranking.png",resultData.totalCandidate.toString()),
                ],
              ),
            ),
            // rowItem("assets/images/timer.png", "30 mins"),
            const SizedBox(height: 8),
            Divider(
              thickness: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  "Date:",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Text(
                    "${DateTime.parse(resultData.startDatetime ?? "2023-12-23 00:45:00").day} ${_getMonth(DateTime.parse(resultData.startDatetime??"2023-12-23 00:45:00").month)} ${DateTime.parse(resultData.startDatetime ?? "2023-12-23 00:45:00").year}",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Time:",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Text(
                  "${_formatTime(DateTime.parse(resultData.startDatetime ?? "2023-12-23 00:45:00"))} to ${_formatTime(DateTime.parse(resultData.endDatetime ?? "2023-12-25 17:41:00"))}",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  "Total Participants: ",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Text(
                  resultData.totalCandidate.toString(),
                  style: const TextStyle(
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


  String _getMonth(int? month) {
    if (month != null && month >= 1 && month <= 12) {
      List<String> months = [
        "Jan", "Feb", "Mar", "Apr", "May", "Jun",
        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
      ];
      return months[month - 1];
    } else {
      return "";
    }
  }

  String _formatTime(DateTime? dateTime) {
    if (dateTime != null) {
      String period = "am";
      int hour = dateTime.hour;
      if (hour >= 12) {
        period = "pm";
        if (hour > 12) {
          hour -= 12;
        }
      }
      return "${hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')} $period";
    } else {
      return "";
    }
  }




}
