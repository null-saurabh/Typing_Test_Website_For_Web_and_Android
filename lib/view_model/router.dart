import 'package:flutter/material.dart';
import 'package:typingtest/view/screens/Homepage_screen.dart';
import 'package:typingtest/view/screens/history_screen.dart';
import 'package:typingtest/view/screens/learn_typing.dart';
import 'package:typingtest/view/screens/profile_page.dart';
import 'package:typingtest/view/screens/subscription.dart';

class _AnimateRoute extends PageRouteBuilder{
  final Widget child;
  _AnimateRoute({required this.child}):super(
    pageBuilder: (BuildContext context,_,__)
        => child,
    transitionDuration: Duration.zero,
  );
}


PageRoute _getPageRoute(Widget child){
  // return MaterialPageRoute(builder: (context) => child);
  return _AnimateRoute(child: child);
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'homepage':
      return _getPageRoute(const HomePageScreen());
    case 'history':
      return _getPageRoute(const HistoryScreen(
        popup: false,
      ));
    case 'subscription':
      return _getPageRoute(const SubscriptionPage());
    case 'profile':
      return _getPageRoute(const ProfilePage());
    case 'learn':
      return _getPageRoute(const LearnTypingTestScreen());
    default:
      throw Exception('Invalid route: ${settings.name}');
  }

}