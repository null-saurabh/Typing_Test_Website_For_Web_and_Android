import 'package:fluro/fluro.dart';
import 'package:get_it/get_it.dart';
import 'package:typingtest/view/screens/exam_page.dart';
import 'package:typingtest/view/screens/history_screen.dart';
import 'package:typingtest/view/screens/learn_typing.dart';
import 'package:typingtest/view/screens/profile_page.dart';
import 'package:typingtest/view/screens/subscription.dart';
import 'package:typingtest/view_model/services/navigation_service.dart';

import '../view/screens/Homepage_screen.dart';

GetIt locator = GetIt.instance;

void setupLocator(){

  final router = FluroRouter();
  locator.registerLazySingleton(() => router);
  // locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => NavigationService(router));

  router.define('/homepage', handler: Handler(handlerFunc: (_, __) => const HomePageScreen()));
  router.define('/history', handler: Handler(handlerFunc: (_, __) => const HistoryScreen(popup: false)));
  router.define('/subscription', handler: Handler(handlerFunc: (_, __) => const SubscriptionPage()));
  router.define('/profile', handler: Handler(handlerFunc: (_, __) => const ProfilePage()));
  router.define('/learn', handler: Handler(handlerFunc: (_, __) => const LearnTypingTestScreen()));
  router.define('/exam/:examName', handler: Handler(handlerFunc: (_, params) {
    final examName = params['examName']![0];
    return ExamPage(targetExamName: examName);
  }));

}