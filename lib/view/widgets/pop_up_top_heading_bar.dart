import 'package:flutter/material.dart';

class PopUpScreensTopHeadingBar extends StatelessWidget {
  final String examName;
  const PopUpScreensTopHeadingBar({
    required this.examName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: const Color(0xff17414F),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width* 0.85 - 140,
            child: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(examName,maxLines:2,overflow:TextOverflow.ellipsis,style:const TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.white),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(onPressed: (){ Navigator.pop(context);}, icon: const Icon(Icons.close),color: Colors.white,),
          )
        ],
      ),
    );
  }
}
