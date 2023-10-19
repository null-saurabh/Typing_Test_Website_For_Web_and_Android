import 'package:flutter/material.dart';

class ErrorRepresentationListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String content;
  final Color color;
  final bool title2;
  final bool? noBorder;
  const ErrorRepresentationListTile(
      {this.noBorder,
      required this.title2,
      required this.color,
      required this.title,
      required this.subtitle,
      required this.content,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: noBorder == true
              ? null
              : const Border(
                  bottom: BorderSide(width: 1, color: Color(0xffEBEBEB)))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: color),
                    ),
                    if (title2)
                      const Text(
                        "[original_word]",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.grey),
                      ),
                  ],
                )),
            Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Text(
                      subtitle,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ],
                )),
            Flexible(
                flex: 2,
                child: Text(
                  content,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.grey),
                ))
          ],
        ),
      ),
    );
  }
}
