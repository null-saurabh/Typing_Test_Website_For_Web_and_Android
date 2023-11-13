import 'package:flutter/material.dart';
import 'package:typingtest/model/live_test_api_model.dart';


class TextToWrite extends StatefulWidget {
  final LiveTestData testData;

  const TextToWrite({
    required this.testData,
    super.key,
  });

  @override
  State<TextToWrite> createState() => _TextToWriteState();
}

class _TextToWriteState extends State<TextToWrite> {

  final _scrollController1 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 18),
      decoration: BoxDecoration(color: Colors.white,border: Border.all(color:  const Color(0xff369CBC).withOpacity(0.5))),
      child: Scrollbar(
        controller: _scrollController1,
          interactive: false,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _scrollController1,
              child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(widget.testData.paragraph!,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
          ))),
    );
  }
}
