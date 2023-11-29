import 'package:flutter/material.dart';

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

  // final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  String userInput = "";
  final _scrollController1 = ScrollController();

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
      // padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 32),
      decoration: BoxDecoration(color: Colors.white,border: Border.all(color: const Color(0xff369CBC).withOpacity(0.5))),
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 18,right: 18),
        child: Scrollbar(
          interactive: false,
          thumbVisibility: true,
          controller: _scrollController1,

          child: SingleChildScrollView(
            // controller: _scrollController,
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
    );
  }
}






// Positioned(
//     right: 0,
//     top: 0,
//     child: InkWell(
//       onTap: (){
//         _scrollController.jumpTo(_scrollController.offset - 24);
//       },
//       child: Container(
//         decoration: BoxDecoration(border: Border.all()),
//         child:const Icon(Icons.arrow_upward,size: 17),
//       ),
//     )
// ),
// Positioned(
//     right: 0,
//     bottom: 0,
//     child: InkWell(
//       onTap: (){
//         _scrollController.jumpTo(_scrollController.offset + 24);
//       },
//       child: Container(
//         decoration: BoxDecoration(border: Border.all()),
//         child:const Icon(Icons.arrow_downward,size: 17),
//       ),
//     )
// )