import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/view/widgets/result_widgets/error_representation_list_tile.dart';

class ResultErrorRepresentation extends StatelessWidget {
  const ResultErrorRepresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.25))),
      child: const Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ErrorHeadingRow(),
          SizedBox(
            height: 10,
          ),
          ErrorRepresentationListTile(
            title: "Original_Word",
            color: Color(0xffE92626),
            title2: false,
            subtitle: "Omission Error",
            content: "For Every omission of word",
          ),
          ErrorRepresentationListTile(
            title: "Typed_Word",
            color: Color(0xffE92626),
            title2: true,
            subtitle: "Substitution Error",
            content: "Every substitution  of a wrong word",
          ),
          ErrorRepresentationListTile(
            title: "Extra_Word",
            color: Color(0xffE92626),
            title2: false,
            subtitle: "Addition Error",
            content: "Every addition  of a  word not found in the passage",
          ),
          ErrorRepresentationListTile(
            title: "Typed_Word",
            color: Color(0xffFF9243),
            title2: true,
            subtitle: "Spelling Error",
            content:
                "For Every spelling error committed by way of repetition or addition or transposition or omission or substitution of a letter/letters, e.g. the word ‘spelling’ typed as ‘seeplings’ etc.",
          ),
          ErrorRepresentationListTile(
            title: "Typed_Word",
            color: Color(0xffFF9243),
            title2: true,
            subtitle: "Capitalisation Error",
            content:
                "Wrong use of capital letter for small letter and vice - versa",
          ),
          ErrorRepresentationListTile(
            noBorder: true,
            title: "Typed_Word",
            color: Color(0xffFF9243),
            title2: true,
            subtitle: "Spacing Error",
            content:
                "where no space is provied between two words e.g. ’Ihope’ in place of  ‘I hope’.",
          ),
        ],
      ),
    );
  }
}

class ErrorHeadingRow extends StatelessWidget {
  const ErrorHeadingRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) => buildDesktopLayout(context),
    );
  }
  Widget buildDesktopLayout(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Error Representation",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        Row(
          children: [
            Container(
              height: 18,
              width: 18,
              color: const Color(0xffE92626),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "Full Mistakes",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 18,
              width: 18,
              color: const Color(0xffFF9243),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "Half Mistakes Mistakes",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            )
          ],
        )
      ],
    );
  }

  Widget buildMobileLayout(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Error Representation",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            Container(
              height: 18,
              width: 18,
              color: const Color(0xffE92626),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "Full Mistakes",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),

          ],
        ),
        const SizedBox(height: 5,),
        Row(
          children: [
            Container(
              height: 18,
              width: 18,
              color: const Color(0xffFF9243),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "Half Mistakes Mistakes",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            )
          ],
        )
      ],
    );
  }

}
