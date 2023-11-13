import 'package:flutter/material.dart';
import 'package:typingtest/model/live_test_api_model.dart';
// import 'package:typingtest/view/screens/result_screen.dart';
import 'package:typingtest/view/widgets/result_widgets/result_dialog.dart';

class RightRow extends StatelessWidget {
  final LiveTestData testData;
  const RightRow({
    required this.testData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: 200.0,
          ),
          width: double.infinity,
          height: 200,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/profile.png",
                height: 120,
                width: 120,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Alex Bohran",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              )
            ],
          ),
        ),
        const SizedBox(height: 20,),
        submitButton(context),
      ],
    );
  }
  Widget submitButton(BuildContext context){
    return ElevatedButton(
      style: ButtonStyle(elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(const Color(0xff369CBC)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),borderRadius: BorderRadius.circular(5)
          ))),
      onPressed: () async {

        // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ResultScreen()));
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const ResultDialog(testId: 6344);
            }
        );

      },
      child: const Text('Submit', style: TextStyle(color: Colors.white),),
    );
  }
}

// Material(
// elevation: 10,
// child: Container(
// height: MediaQuery.of(context).size.height -200,
// decoration: BoxDecoration(
// border: Border(left: BorderSide(color: Colors.black.withOpacity(0.4)),right: BorderSide(color: Colors.black.withOpacity(0.4)),bottom: BorderSide(color: Colors.black.withOpacity(0.4)))
// ),
// child: Column(
// children: [
// const SizedBox(height: 15),
// Row(
// children: [
// const SizedBox(width:10),
// Image.asset("assets/images/logo.png",width: 125,height: 125,),
// const SizedBox(width: 10,),
// const Text("John Smith",style: TextStyle(fontSize: 22),)
// ],
// ),
// const Spacer(),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: ElevatedButton(
// style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue),
// shape: MaterialStateProperty.all(RoundedRectangleBorder(
// side: const BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(2)
// ))
// ),
// onPressed: (){},
// child: const Text("Submit",style: TextStyle(color: Colors.white),)
// ),
// ),
// ],
// ),
// ),
// );
