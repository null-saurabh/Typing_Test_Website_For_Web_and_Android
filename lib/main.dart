import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:typingtest/view/screens/homepage.dart';
import 'package:typingtest/view_model/provider/api_provider.dart';
import 'package:typingtest/view_model/provider/login_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb){
    await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyAxTobYpx_e8HZi3W2XTcA4wcDAimpZoEo",
          authDomain: "typingtest-e2ac0.firebaseapp.com",
          projectId: "typingtest-e2ac0",
          messagingSenderId: "662182179161",
          appId: "1:662182179161:web:074b21c8c01b78eb6b9c48",
        )
    );
  } else {
    await Firebase.initializeApp(
        name: 'mobile-app',

        options: const FirebaseOptions(
          apiKey: "AIzaSyAxTobYpx_e8HZi3W2XTcA4wcDAimpZoEo",
          authDomain: "typingtest-e2ac0.firebaseapp.com",
          projectId: "typingtest-e2ac0",
          messagingSenderId: "662182179161",
          appId: "1:662182179161:web:074b21c8c01b78eb6b9c48",
        )
    );
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginUserProvider(),
        ),
        ChangeNotifierProvider(
            create: (context) => ApiProvider(
              context.read<LoginUserProvider>(),
            )),
      ],
      child: const MyApp(),
    ),);
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
      home: const HOMEPAGE(),
    );
  }
}
