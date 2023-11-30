import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
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
  int backspaceCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(color: Colors.white,border: Border.all(color: const Color(0xff369CBC).withOpacity(0.5))),
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 18,right: 18),
        child: Scrollbar(
          interactive: false,
          thumbVisibility: true,
          controller: _scrollController1,
          child: RawKeyboardListener(
            focusNode: _focusNode,
            onKey: (RawKeyEvent event) {
              if (event is RawKeyDownEvent &&
                  event.logicalKey == LogicalKeyboardKey.backspace) {
                setState(() {
                  backspaceCount++;
                });
                Provider.of<TestModelProvider>(context, listen: false).updateBackspace();
              }
            },
            child: SingleChildScrollView(
              controller: _scrollController1,
              child: TextField(
                focusNode: _focusNode,
                onChanged: (value) {
                  setState(() {
                    userInput = value;
                  });
                  // Notify the parent widget (TestScreen) about the changes
                  widget.onTextChanged(value);
                },
                maxLines: null,
                decoration: const InputDecoration.collapsed(hintText: "Start typing here..."),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
