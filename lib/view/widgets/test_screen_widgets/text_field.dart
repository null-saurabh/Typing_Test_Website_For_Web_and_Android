import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/view_model/provider/save_test_provider.dart';

class TextFieldContainer extends StatefulWidget {
  final Function(String) onTextChanged;

  const TextFieldContainer({
    required this.onTextChanged,
    super.key,
  });

  @override
  State<TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  final FocusNode _focusNode = FocusNode();
  String userInput = "";
  final _scrollController1 = ScrollController();
  final TextEditingController _controller = TextEditingController();
  int backspaceCount = 0;
  int previousLength = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  void _onTextChanged() {
    int currentLength = _controller.text.length;
    if (currentLength < previousLength) {
      setState(() {
        backspaceCount++;
        Provider.of<TestCalculatorProvider>(context, listen: false).updateBackspace();
      });
      // print(Provider.of<TestModelProvider>(context, listen: false).testModel.backSpaceCount);
    }
    previousLength = currentLength;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) => buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xff369CBC).withOpacity(0.5))),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10,bottom: 10),
        child: Scrollbar(
          interactive: false,
          thumbVisibility: true,
          controller: _scrollController1,
          child: SingleChildScrollView(
            controller: _scrollController1,
            child: Padding(
              padding: const EdgeInsets.only(right:10.0),
              child: TextField(
                focusNode: _focusNode,
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                    userInput = value;
                  });
                  // Notify the parent widget (TestScreen) about the changes
                  widget.onTextChanged(value);
                },
                maxLines: null,
                decoration: const InputDecoration.collapsed(
                    hintText: "Start typing here..."),
              ),
            ),
          ),
          // ),
        ),
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.40,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xff369CBC).withOpacity(0.5))),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 5,bottom: 10),
        child: Scrollbar(
          interactive: false,
          thumbVisibility: true,
          controller: _scrollController1,
          child: SingleChildScrollView(
            controller: _scrollController1,
            child: Padding(
              padding: const EdgeInsets.only(right:10.0),
              child: TextField(
                focusNode: _focusNode,
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                    userInput = value;
                  });
                  widget.onTextChanged(value);
                },
                maxLines: null,
                decoration: const InputDecoration.collapsed(
                    hintText: "Start typing here..."),
              ),
            ),
          ),
        ),
      ),
    );
  }


@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
}