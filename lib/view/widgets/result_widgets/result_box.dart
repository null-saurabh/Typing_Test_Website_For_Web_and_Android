import 'package:flutter/material.dart';

class ResultBox extends StatelessWidget {
  final String title;
  final String value;
  const ResultBox({required this.title,required this.value,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width >950 ? MediaQuery.of(context).size.width *0.20 >300 ?300: MediaQuery.of(context).size.width *0.20: double.infinity,
      height: 90,
      decoration: BoxDecoration(color: const Color(0xff369CBC),borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),),
            Text(value,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
