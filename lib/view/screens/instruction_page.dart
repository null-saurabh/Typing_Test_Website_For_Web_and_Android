
import 'package:flutter/material.dart';
import 'package:typingtest/model/api_model.dart';
import 'package:typingtest/view/screens/test_screen.dart';
import 'package:typingtest/view/widgets/pop_up_top_heading_bar.dart';

class InstructionPage extends StatelessWidget {
  final Test testData;
  const InstructionPage({required this.testData,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PopUpScreensTopHeadingBar(examName: testData.targetExam),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text("Instructions",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24),),
          ),
          // const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
            child: Container(
              width: double.infinity ,
              color: Colors.white,
              // margin: const EdgeInsets.all(59),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("SSC Typing Test - Grade A - 1",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20)),
                    const SizedBox(height: 10,),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          rowItem("assets/images/ranking.png","90 Marks"),
                          requiredVerticalDivider(),
                          rowItem("assets/images/question.png","30 questions"),
                          requiredVerticalDivider(),
                          rowItem("assets/images/timer.png","30 mins"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.withOpacity(0.75),
                    ),
                    const SizedBox(height: 20,),
                    const Text("1. Lorem ipsum dolor sit amet consectetur. Iaculis diam iaculis nisl mauris.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                    const Text("2. Lorem ipsum dolor sit amet consectetur. Iaculis diam iaculis nisl mauris. At nunc ullamcorper viverra id ",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                    const Text("3. Lorem ipsum dolor sit amet consectetur. Iaculis diam iaculis nisl mauris.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("4. ",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                        Expanded(child: Text("Lorem ipsum dolor sit amet consectetur. Iaculis diam iaculis nisl mauris. At nunc ullamcorper viverra id sagittis sit. Risus nibh nisl scelerisque in phasellus lectus. Vitae ullamcorper odio lacus egestas mus donec eu.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),)),
                      ],
                    ),
                    const Text("5. Lorem ipsum dolor sit amet consectetur. Iaculis diam iaculis nisl mauris.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                    const Text("6. Lorem ipsum dolor sit amet consectetur",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                    const SizedBox(height: 20,),
                    startButton(context,testData),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget startButton(BuildContext context, Test testData){
    return ElevatedButton(
      style: ButtonStyle(elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(const Color(0xff369CBC)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),borderRadius: BorderRadius.circular(5)
          ))),
      onPressed: () async {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>TestScreen(testData: testData,)));
      },
      child: const Text('Start Now', style: TextStyle(color: Colors.white),),
    );
  }
  Widget requiredVerticalDivider(){
    return SizedBox(
      height: 20,
      child: VerticalDivider(
        color: Colors.grey.withOpacity(0.5),
        thickness: 1.2,
      ),
    );
  }
  Widget rowItem(String image, String text){
    return Row(
      children: [
        Image.asset(image,height: 20,width: 20,),
        const SizedBox(width: 5,),
        Text(text,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xff929292)),)
      ],
    );
  }
}
