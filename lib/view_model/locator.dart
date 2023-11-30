// import 'package:fluro/fluro.dart';
// import 'package:get_it/get_it.dart';
// import 'package:typingtest/view/screens/Homepage_screen.dart';
// import 'package:typingtest/view/screens/exam_page.dart';
// import 'package:typingtest/view/screens/history_screen.dart';
// import 'package:typingtest/view/screens/learn_typing.dart';
// import 'package:typingtest/view/screens/profile_page.dart';
// import 'package:typingtest/view/screens/ranking_page.dart';
// import 'package:typingtest/view/screens/subscription.dart';
// import 'package:typingtest/view/screens/welcome_login_screen.dart';
// import 'package:typingtest/view_model/services/navigation_service.dart';
//
// GetIt locator = GetIt.instance;
//
// void setupLocator(){
//
//   final router = FluroRouter();
//   locator.registerLazySingleton(() => router);
//   // locator.registerLazySingleton(() => NavigationService());
//   locator.registerLazySingleton(() => NavigationService(router));
//   router.define('/welcome', handler: Handler(handlerFunc: (_, __) => const WelcomeLoginScreen()));
//   router.define('/homepage', handler: Handler(handlerFunc: (_, __) => const HomePageScreen()));
//   router.define('/history', handler: Handler(handlerFunc: (_, __) => const HistoryScreen(popup: false)));
//   router.define('/subscription', handler: Handler(handlerFunc: (_, __) => const SubscriptionPage()));
//   router.define('/profile', handler: Handler(handlerFunc: (_, __) => const ProfilePage()));
//   router.define('/learn', handler: Handler(handlerFunc: (_, __) => const LearnTypingTestScreen()));
//   router.define('/exam/:examName', handler: Handler(handlerFunc: (_, params) {
//     final examName = params['examName']![0];
//     return ExamPage(targetExamName: examName);
//   }));
//   router.define('/ranking/:testId', handler: Handler(handlerFunc: (_, params) {
//     final testId = int.parse(params['testId']![0]);
//     return RankingScreen(testId: testId);
//   }));
//
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // class MyAppRouter{
// //
// //   GoRouter router = GoRouter(
// //       routes: [
// //         GoRoute(
// //             path: '/welcome',
// //             builder: (context, state) => const WelcomeLoginScreen()
// //         ),
// //         GoRoute(
// //             path: '/homepage',
// //             builder: (context, state) => const HomePageScreen()
// //         ),GoRoute(
// //             path: '/history',
// //             builder: (context, state) => HistoryScreen(
// //               popup: state.query,
// //             )
// //         ),GoRoute(
// //             path: '/subscription',
// //             builder: (context, state) => const LearnTypingTestScreen()
// //         ),GoRoute(
// //             path: '/profile',
// //             builder: (context, state) => const SubscriptionPage()
// //         ),GoRoute(
// //             path: '/learn',
// //             builder: (context, state) => const ProfilePage()
// //         ),GoRoute(
// //             path: '/exam/:examname',
// //             pageBuilder: (context,state){
// //               return MaterialPage(child: ExamPage(targetExamName: state.pa))
// //             }
// //         ),GoRoute(
// //             path: '/ranking/:testId',
// //             builder: (context, state) => const WelcomeLoginScreen()
// //         ),
// //       ]
// //   );
// //
// // }