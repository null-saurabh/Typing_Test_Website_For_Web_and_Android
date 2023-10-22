import 'package:flutter/material.dart';
import 'package:typingtest/view/screens/exam_page.dart';
import 'package:typingtest/view/screens/history_screen.dart';
import 'package:typingtest/view/screens/homepage.dart';
import 'package:typingtest/view/screens/profile_page.dart';
import 'package:typingtest/view/screens/ranking_page.dart';
import 'package:typingtest/view/screens/subscription.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //       apiKey: "AIzaSyAxTobYpx_e8HZi3W2XTcA4wcDAimpZoEo",
  //       authDomain: "typingtest-e2ac0.firebaseapp.com",
  //       projectId: "typingtest-e2ac0",
  //       messagingSenderId: "662182179161",
  //       appId: "1:662182179161:web:074b21c8c01b78eb6b9c48",
  //   )
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff369CBC)),
        useMaterial3: true,
          scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(const Color(0xff369CBC)),
        ),
      ),
      home: const RankingScreen(),
    );
  }
}
