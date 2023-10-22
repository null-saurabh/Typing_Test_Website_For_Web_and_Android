import 'package:flutter/material.dart';
import 'package:typingtest/view/screens/history_screen.dart';
import 'package:typingtest/view/screens/instruction_page.dart';
import 'package:typingtest/view/screens/ranking_page.dart';
import 'package:typingtest/view/widgets/Left_drawer.dart';
import 'package:typingtest/view/widgets/exam_page_widgets/live_test_list_tile.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LeftDrawer(isProfilePage: false),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // const TopNavigationBar(),
                  // const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap:(){Navigator.pop(context);},
                                  child: Container(
                                    height: 36,
                                    width: 36,
                                    color: Colors.white,
                                    child: const Icon(Icons.arrow_back),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "SSC Typing Tests",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            opaqueButton(context, "History", () async {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HistoryScreen(),
                                ),
                              );
                            },)

                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Live tests",
                          style: TextStyle(fontSize: 16.9, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              if (index ==0 ) {
                                return LiveTestListTile(status:"Completed",index: index + 1);
                              } else if (index == 1 || index == 2){
                                return LiveTestListTile(status: "Started", index: index + 1);
                              }
                              else{
                                return LiveTestListTile(status: "Starts In", index: index + 1);
                              }

                            }),

                      ],
                    ),
                  ),
                  // Divider(
                  //   thickness: 1,
                  //   color: const Color(0xff369CBC).withOpacity(0.75),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Practice Tests",
                          style: TextStyle(fontSize: 16.9, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        Row(
                          children: [
                            dailyTest("1",context),
                            const SizedBox(width: 15),
                            dailyTest("2",context),
                            const SizedBox(width: 15),
                            dailyTest("3",context),
                          ],
                        ),
                        // ListView.builder(
                        //     shrinkWrap: true,
                        //     itemCount: 5,
                        //     itemBuilder: (context, index) {
                        //       if (index <= 2) {
                        //         return mockTestListTile(true, index + 1,context);
                        //       } else {
                        //         return mockTestListTile(false, index + 1,context);
                        //       }
                        //     }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget mockTestListTile(String status, int index,BuildContext context) {
  //   return Card(
  //     color: Colors.white,
  //     elevation: 0,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(6.0),
  //     ),
  //     child: IntrinsicHeight(
  //       child:
  //       // Container(
  //       //   width: 5,
  //       //   color: const Color(0xff369CBC),
  //       //   height: double.infinity,
  //       // ),
  //       ClipRRect(
  //         borderRadius: BorderRadius.circular(6.0),
  //         child: Container(
  //           decoration: BoxDecoration(
  //             // borderRadius: BorderRadius.circular(4.0), // Add this line
  //             border: Border(
  //               left: BorderSide(color: Color(0xff369CBC), width: 2.5), // Left border
  //               // bottom: BorderSide(color: Colors.black, width: 1.0), // Bottom border
  //             ),
  //           ),
  //           child: ListTile(
  //             title: Text(
  //               "SSC Typing Test - Grade A - $index",
  //               style:
  //                   const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
  //             ),
  //             subtitle: IntrinsicHeight(
  //               child: Row(
  //                 children: [
  //                   rowItem("assets/images/ranking.png", "90 Key Strokes"),
  //                   requiredVerticalDivider(),
  //                   rowItem("assets/images/question.png", "English"),
  //                   requiredVerticalDivider(),
  //                   rowItem("assets/images/timer.png", "30 mins"),
  //                 ],
  //               ),
  //             ),
  //             trailing:
  //                 status == "Completed"
  //             ?Row(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     leaderBoardButton(context),
  //                     const SizedBox(width: 10,),
  //                     opaqueButton(context,"View Result",  () async {
  //                       Navigator.of(context).push(
  //                         MaterialPageRoute(
  //                           builder: (context) => const InstructionPage(),
  //                         ),
  //                       );
  //                     },),
  //                   ],
  //                 )
  //                 : status == "Started" ? const Row(
  //                   mainAxisSize: MainAxisSize.min,
  //
  //                   children: [
  //                     Text("Ends In :",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey),),
  //                     Text("12h : 34m : 45s",style: TextStyle(fontSize: 16.5,fontWeight: FontWeight.w500,color: Color(0xffE72A2A)),),
  //                   ],
  //                 )
  //                 : const Row(
  //                   mainAxisSize: MainAxisSize.min,
  //
  //                   children: [
  //                     Icon(Icons.lock_open_outlined,color: Colors.grey,),
  //                     SizedBox(width: 10,),
  //                     Text("Start In :",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey),),
  //                     Text("12h : 34m : 45s",style: TextStyle(fontSize: 16.5,fontWeight: FontWeight.w500,color: Colors.grey),),
  //                   ],
  //                 ),
  //
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }



  Widget opaqueButton(BuildContext context,String name, VoidCallback onTap,) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),
              borderRadius: BorderRadius.circular(5)))),
      onPressed: onTap,

      //     () async {
      //   Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: (context) => const InstructionPage(),
      //     ),
      //   );
      // },
      child:Text(
        name,
        style: const TextStyle(color: Color(0xff369CBC)),
      ),
    );
  }

  Widget dailyTest(String testNumber,BuildContext context) {
    return Container(
      height: 100,
      width: 275,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Daily Practice test - $testNumber",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            opaqueButton(context, "Start Now",  () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const InstructionPage(),
                ),
              );
            },),
          ],
        ),
      ),
    );
  }
}
