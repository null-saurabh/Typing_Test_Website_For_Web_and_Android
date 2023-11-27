import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:typingtest/view/screens/Homepage_screen.dart';
import 'package:typingtest/view/screens/exam_page.dart';
import 'package:typingtest/view/screens/history_screen.dart';
import 'package:typingtest/view/screens/learn_typing.dart';
import 'package:typingtest/view/screens/profile_page.dart';
import 'package:typingtest/view/screens/subscription.dart';
import 'package:typingtest/view_model/locator.dart';

class NavigationService extends ChangeNotifier {
  final FluroRouter router;
  NavigationService(this.router);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String _currentPage = 'homepage';

  String get currentPage => _currentPage;

  Future<dynamic> navigateTo(String routeName) {
    _currentPage = routeName;
    notifyListeners();
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<void> navigateToExamPage(BuildContext context, String examName) async {
    _currentPage = 'exam'; // You can set a common identifier for exam pages
    notifyListeners();
    final router = locator<FluroRouter>();
    router.navigateTo(context, '/exam/$examName', transition: TransitionType.fadeIn);
  }



  void goBack(){
    return navigatorKey.currentState!.pop();
  }

}

