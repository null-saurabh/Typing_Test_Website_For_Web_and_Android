import 'package:flutter/material.dart';

class UserRankListTile extends StatelessWidget {
  const UserRankListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      color: Color(0xff369CBC),),
      child:  Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:  15.0),
            child: Text("234",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),
          ),
          Row(
            children: [
              CircleAvatar(radius: 14 ,backgroundColor: Colors.white,child: Text("AB",style: TextStyle(color: Color(0xff369CBC),fontWeight: FontWeight.w500,fontSize: 12),),),
              SizedBox(width: 5,),
              Text("You",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),),
            ],
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/flash_white.png",
                height: 24,
                width: 24,
              ),
              Text("78%",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),
            ],

          ),
          Row(
            children: [
              Image.asset(
                "assets/images/timer_white.png",
                height: 24,
                width: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text("12 mins, 16 secs",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),
              ),
            ],

          ),
        ],
      ),
    );
  }
}
