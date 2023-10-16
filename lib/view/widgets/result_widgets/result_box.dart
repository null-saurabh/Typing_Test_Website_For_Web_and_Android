import 'package:flutter/material.dart';

class ResultBox extends StatelessWidget {
  final String title;
  final String value;
  const ResultBox({required this.title,required this.value,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: 90,
      decoration: BoxDecoration(color: Color(0xff369CBC),borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),),
            Text(value,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
