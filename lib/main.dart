import 'package:firebase_core/firebase_core.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:typingtest/model/live_test_api_model.dart';
import 'package:typingtest/view/screens/Homepage_screen.dart';
import 'package:typingtest/view/screens/exam_page.dart';
import 'package:typingtest/view/screens/history_screen.dart';
import 'package:typingtest/view/screens/homeview.dart';
import 'package:typingtest/view/screens/learn_typing.dart';
import 'package:typingtest/view/screens/profile_page.dart';
import 'package:typingtest/view/screens/ranking_page.dart';
import 'package:typingtest/view/screens/subscription.dart';
import 'package:typingtest/view/screens/test_screen.dart';
import 'package:typingtest/view/screens/welcome_login_screen.dart';
import 'package:typingtest/view_model/locator.dart';
import 'package:typingtest/view_model/provider/api_provider.dart';
import 'package:typingtest/view_model/provider/login_provider.dart';
import 'package:typingtest/view_model/provider/save_test_provider.dart';
import 'package:typingtest/view_model/route_names.dart';
import 'package:typingtest/view_model/services/navigation_service.dart';


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
        ChangeNotifierProvider(
          create: (context) => TestModelProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NavigationProvider(),
        ),
      ],
      child: const MyApp(),
    ),);
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();


final _router = GoRouter(
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
  redirect: (context, state){
    String originalLocation = state.fullPath ?? '/';
    if(Provider.of<LoginUserProvider>(context, listen: false).user == null){
      Provider.of<NavigationProvider>(context, listen: false).addOriginalLocation(originalLocation);
      print(originalLocation);
      return '/welcome';
    }
    else{
      return null;
    }
  },

  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return HOMEVIEW(child: child);
      },
      routes: [
        GoRoute(
          // parentNavigatorKey: _shellNavigatorKey,
          name: 'home',
          path: '/home',
          builder: (context, state) {
            return HomePageScreen(key: state.pageKey,);
          },
        ),
        GoRoute(
          // parentNavigatorKey: _shellNavigatorKey,
          name: 'subscription',
          path: '/subscription',
          builder: (context, state) {
            return const SubscriptionPage();
          },
        ),
        GoRoute(
            // parentNavigatorKey: _shellNavigatorKey,
          name: 'profile',
            path: '/profile',
            builder: (context, state) {
              return const ProfilePage();
            }),
        GoRoute(
            // parentNavigatorKey: _shellNavigatorKey,
          name: 'history',
            path: '/history/:popup',
            builder: (context, state) {
              return HistoryScreen(
                popup: state.pathParameters["popup"]?.toLowerCase() == 'true',
                // examName: state.queryParameter,
              );
            }),
        GoRoute(
            // parentNavigatorKey: _shellNavigatorKey,
          name: 'learn',
            path: '/learn',
            builder: (context, state) {
              return const LearnTypingTestScreen();
            }),
        GoRoute(
            // parentNavigatorKey: _shellNavigatorKey,
          name: 'exam',
            path: '/exam/:examName',
            builder: (context, state) {
              return ExamPage(
                  targetExamName: state.pathParameters["examName"] ?? "" );
            }),
        GoRoute(
            // parentNavigatorKey: _shellNavigatorKey,
          name: 'ranking',
            path: '/ranking/:testId',
            builder: (context, state) {
              return RankingScreen(
                  testId: state.pathParameters["testId"] as int);
            }),
      ],
    ),
    GoRoute(
      // parentNavigatorKey: _rootNavigatorKey,
      name: 'welcome',
      path: '/welcome',
      builder: (context, state) {
        return const WelcomeLoginScreen();
      },
    ),
    GoRoute(
      // parentNavigatorKey: _rootNavigatorKey,
      name: 'test',
      path: '/test',
      builder: (context, state) {
        return TestScreen(testData: state.pathParameters["testData"] as LiveTestData);
      },
    ),
  ],
);



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff369CBC)),
        useMaterial3: true,
          scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(const Color(0xff369CBC)),
        ),
      ),
      routerConfig: _router,
        // onGenerateRoute: generateRoute,
    );
  }
}


// return MaterialPage(child: WelcomePage(originalLocation: originalLocation));
// },