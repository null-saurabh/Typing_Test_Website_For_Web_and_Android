import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  Future<void> navigateToRankingPage(BuildContext context, int testId) async {
    _currentPage = 'ranking';
    notifyListeners();
    final router = locator<FluroRouter>();
    router.navigateTo(context, '/ranking/$testId', transition:null);
  }

  Future<void> navigateToExamPage(BuildContext context, String examName) async {
    _currentPage = 'exam';
    notifyListeners();
    final router = locator<FluroRouter>();
    router.navigateTo(context, '/exam/$examName', transition: null);
  }



  void goBack(){
    return navigatorKey.currentState!.pop();
  }

}

