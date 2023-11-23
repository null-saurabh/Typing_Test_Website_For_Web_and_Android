// import 'package:flutter/material.dart';
// import 'package:responsive_builder/responsive_builder.dart';
// import 'package:typingtest/view/screens/homeview.dart';
// import 'package:typingtest/view/screens/test_screen.dart';
// // import 'package:typingtest/view_model/services/firebase_services.dart';
//
// class NavBar extends StatelessWidget {
//   const NavBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenTypeLayout.builder(
//       mobile: (BuildContext context) => desktopNavBar(context),
//       desktop: (BuildContext context) => desktopNavBar(context),
//     );
//   }
//
//   Widget desktopNavBar(BuildContext context){
//     return Material(
//       elevation: 2,
//       child: Container(
//         // decoration: BoxDecoration(color: Colors.white,border: Border(bottom: BorderSide(color: Color(0xff369CBC),width: 02))),
//         color: Colors.white,
//         // margin: const EdgeInsets.symmetric(horizontal: 20),
//         height: 60,
//         child: Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   navLogo(),
//                   Row(
//                     children: [
//                       navButton("Typing Test",context),
//                       navButton("Typing Lessons",context),
//                       navButton("Plans",context),
//                     ],
//                   ),
//
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 20.0),
//                 child: SizedBox(
//                   height: 35,
//                   child: ElevatedButton(
//                     style: ButtonStyle(elevation: MaterialStateProperty.all(0),
//                     backgroundColor: MaterialStateProperty.all(Colors.white),
//                     shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                         side: const BorderSide(color: Color(0xff369CBC)),borderRadius: BorderRadius.circular(10)
//                     ))),
//                     onPressed: () async {
//                     //   try {
//                     //   await FirebaseServices().signInWithGoogle();
//                     //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HOMEPAGE()));
//                     // } catch (e) {
//                     //   rethrow;
//                     // }
//                     },
//                     child: const Text('Login/SignUp', style: TextStyle(color: Color(0xff369CBC)),),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget navButton(String text, BuildContext context){
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 4 ),
//       child: TextButton(
//         onPressed: (){
//           Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TestScreen()));
//         },
//         child: Text(text, style: const TextStyle(color: Color(0xff369CBC),fontSize: 18),),
//       ),
//     );
//   }
//
//   Widget navLogo(){
//     return Padding(
//       padding: const EdgeInsets.only(left: 35.0),
//       child: Container(width: 75,
//         decoration: const BoxDecoration(
//             image: DecorationImage(image: AssetImage("assets/images/logo.png"))
//         )),
//     );
//   }
// }
