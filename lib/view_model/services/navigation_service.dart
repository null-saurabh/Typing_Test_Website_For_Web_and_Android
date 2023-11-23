import 'package:flutter/cupertino.dart';

class NavigationService extends ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String _currentPage = 'homepage';

  String get currentPage => _currentPage;

  Future<dynamic> navigateTo(String routeName) {
    _currentPage = routeName;
    notifyListeners();
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void goBack(){
    return navigatorKey.currentState!.pop();
  }
}