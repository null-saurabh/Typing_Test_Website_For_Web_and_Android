import 'package:flutter/material.dart';

class TextFieldContainer extends StatefulWidget {
  const TextFieldContainer({
    super.key,
  });

  @override
  State<TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {

  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();
  String userInput = "";

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
      // padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 32),
      decoration: BoxDecoration(color: Colors.white,border: Border.all(color: Colors.white)),
      child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom:20,left: 18,right: 18),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: TextField(
                  focusNode: _focusNode,
                  onChanged: (value) => setState(() => userInput = value),
                  maxLines: null,
                  decoration: const InputDecoration.collapsed(hintText: "Start typing here..."),
                ),
              ),
            ),
            Positioned(
                right: 0,
                top: 0,
                child: InkWell(
                  onTap: (){
                    _scrollController.jumpTo(_scrollController.offset - 24);
                  },
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child:const Icon(Icons.arrow_upward,size: 17),
                  ),
                )
            ),
            Positioned(
                right: 0,
                bottom: 0,
                child: InkWell(
                  onTap: (){
                    _scrollController.jumpTo(_scrollController.offset + 24);
                  },
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child:const Icon(Icons.arrow_downward,size: 17),
                  ),
                )
            )
          ]
      ),
    );
  }
}
