import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:typingtest/model/live_test_api_model.dart';
import 'package:typingtest/view/screens/Homepage_screen.dart';
import 'package:typingtest/view/screens/error_page.dart';
import 'package:typingtest/view/screens/exam_information_page.dart';
import 'package:typingtest/view/screens/exam_page.dart';
import 'package:typingtest/view/screens/history_screen.dart';
import 'package:typingtest/view/screens/homeview.dart';
import 'package:typingtest/view/screens/learn_menu.dart';
import 'package:typingtest/view/screens/learn_typing.dart';
import 'package:typingtest/view/screens/profile_page.dart';
import 'package:typingtest/view/screens/ranking_page.dart';
import 'package:typingtest/view/screens/subscription.dart';
import 'package:typingtest/view/screens/test_screen.dart';
import 'package:typingtest/view/screens/welcome_login_screen.dart';
import 'package:typingtest/view_model/provider/api_provider.dart';
import 'package:typingtest/view_model/provider/learn_menu_provider.dart';
import 'package:typingtest/view_model/provider/login_provider.dart';
import 'package:typingtest/view_model/provider/razorpay_provider.dart';
import 'package:typingtest/view_model/provider/save_test_provider.dart';
import 'package:typingtest/view_model/provider/navigation_provider.dart';


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
          create: (context) => TestCalculatorProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RazorPayProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LearnMenuProvider(),
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
  // observers: [
  //   GoRouteObserver()
  // ],
  redirect: (context, state){
    String originalLocation = state.matchedLocation;
    // print(originalLocation);
    if(Provider.of<LoginUserProvider>(context, listen: false).user == null){
      Provider.of<NavigationProvider>(context, listen: false).addOriginalLocation(originalLocation);

      final List<String> allowedRoutes = [
        '/welcome',
        '/examinformation',
      ];

      if (!allowedRoutes.any((route) => originalLocation.startsWith(route))) {
        return '/welcome';
      }
    }
    return null;
  },
  errorPageBuilder: (context,state){
    return const MaterialPage(child: ErrorPage());
  },
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return HOMEVIEW(child: child);
      },
      observers: [
        GoRouteShellObserver()
      ],
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
              );
            }),
        GoRoute(
          // parentNavigatorKey: _shellNavigatorKey,
            name: 'menu',
            path: '/menu',
            builder: (context, state) {
              return const LearnMenuScreen();
            }),
        GoRoute(
          // parentNavigatorKey: _shellNavigatorKey,
            name: 'learn',
            path: '/learn/:testName',
            builder: (context, state) {
              return LearnTypingTestScreen(
                testName: state.pathParameters["testName"] ?? "a, s, d, f, j, k, l and ‘;’",

              );
            }),
        GoRoute(
          // parentNavigatorKey: _shellNavigatorKey,
            name: 'exam',
            path: '/exam/:examName',
            builder: (context, state) {
              return ExamPage(
                  targetExamName: state.pathParameters["examName"] ?? "" );
            }),
        // GoRoute(
        //     parentNavigatorKey: _shellNavigatorKey,
        //     name: 'examInformation',
        //     path: '/examinformation/:examName',
        //     builder: (context, state) {
        //       return ExamInformation(
        //           targetExamName: state.pathParameters["examName"] ?? "" );
        //     }),
        GoRoute(
          // parentNavigatorKey: _shellNavigatorKey,
            name: 'ranking',
            path: '/ranking/:testId',
            builder: (context, state) {
              return RankingScreen(
                  testId: int.tryParse(state.pathParameters["testId"]!) as int);
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
      parentNavigatorKey: _rootNavigatorKey,
      name: 'test',
      path: '/test/:testData',
      builder: (context, state) {
        // print('in router');
        String testDataString = state.pathParameters["testData"] as String;
        LiveTestData testData = LiveTestData.fromJson(jsonDecode(testDataString));
        return TestScreen(testData: testData);
      },
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
        name: 'examInformationLoginFalse',
        path: '/examinformationloginfalse/:examName',
        builder: (context, state) {
          return ExamInformation(
              targetExamName: state.pathParameters["examName"] ?? "" );
        }),

  ],

);

class GoRouteShellObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // Called when a new route has been pushed onto the navigator.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final BuildContext context = _shellNavigatorKey.currentContext!;
      final NavigationProvider navigationProvider = Provider.of<NavigationProvider>(context, listen: false);
      final String routeName = route.settings.name ?? '';
      var routeTitle  = route.settings.arguments as Map<String, dynamic>? ?? {};
      // var examName = routeTitle?['examName'];
      print('a: $routeName');
      // print('b: $routeTitle');

      if (routeName == 'exam') {
        navigationProvider.updateCurrentPageFromUrl('/home');
        navigationProvider.updateTitle(routeTitle['examName']);
      } else if (routeName == 'examInformation') {
        navigationProvider.updateCurrentPageFromUrl('/home');
        navigationProvider.updateTitle('Exam Info');
      }else if (routeName == 'ranking') {
        navigationProvider.updateCurrentPageFromUrl('/history/false');
        navigationProvider.updateTitle('Leader Board');
      }else if (routeName == 'history') {
        navigationProvider.updateCurrentPageFromUrl('/history/false');
        navigationProvider.updateTitle("Result History");
      } else if (routeName == 'learn') {
        navigationProvider.updateCurrentPageFromUrl('/menu');
        navigationProvider.updateTitle('Learn Keys: [ ${routeTitle['testName']} ]');
      } else {
        navigationProvider.updateCurrentPageFromUrl('/$routeName');
        if(routeName == 'home'){
          navigationProvider.updateTitle('All Tests');
        }
        else if(routeName == 'menu'){
          navigationProvider.updateTitle('Typing Lessons');
        }
        else if(routeName == 'subscription'){
          navigationProvider.updateTitle('Subscriptions');
        }
        else if(routeName == 'profile'){
          navigationProvider.updateTitle('My Profile');
        }
      }
    });
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final BuildContext context = _shellNavigatorKey.currentContext!;
      final NavigationProvider navigationProvider = Provider.of<NavigationProvider>(context, listen: false);
      final String routeName = route.settings.name ?? '';
      // print('a' +routeName);

      if (routeName == 'exam') {
        navigationProvider.updateCurrentPageFromUrl('/home');
      } else if (routeName == 'ranking') {
        navigationProvider.updateCurrentPageFromUrl('/history/false');
      } else {
        navigationProvider.updateCurrentPageFromUrl('/$routeName');
      }
    });
  }
}


// class GoRouteObserver extends NavigatorObserver {
//   @override
//   void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     // Called when a new route has been pushed onto the navigator.
//     print('Route pushed: ${route.settings.name}');
//     final BuildContext context = _rootNavigatorKey.currentContext!;
//     Provider.of<NavigationProvider>(context, listen: false).updateCurrentPageFromUrl('/${route.settings.name}');
//   }
//
//   @override
//   void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     // Called when the current route has been popped off the navigator.
//     print('Route popped: ${route.settings.name}');
//     final BuildContext context = _rootNavigatorKey.currentContext!;
//     Provider.of<NavigationProvider>(context, listen: false).updateCurrentPageFromUrl('/${route.settings.name}');
//   }
//
// }


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'A1 Typing',
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