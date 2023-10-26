// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:typingtest/view/screens/Homepage_screen.dart';
import 'package:typingtest/view/screens/history_screen.dart';
import 'package:typingtest/view/screens/profile_page.dart';
import 'package:typingtest/view/screens/subscription.dart';
import 'package:typingtest/view/widgets/Left_drawer.dart';

import 'dart:html' as html;


class HOMEPAGE extends StatefulWidget {
  const HOMEPAGE({super.key});

  @override
  State<HOMEPAGE> createState() => _HOMEPAGEState();
}

class _HOMEPAGEState extends State<HOMEPAGE> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  String _currentPage = 'homepage';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_navigatorKey.currentState!.canPop()) {
          _navigatorKey.currentState!.pop();
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xffF5FAFC),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LeftDrawer(
              // isProfilePage: false,
              onItemSelected: (selectedPage) {
                _navigatorKey.currentState!.pushReplacementNamed(selectedPage);
                setState(() {
                  _currentPage = selectedPage;
                });
              },
              currentPage: _currentPage,

            ),
            Expanded(
              child: Navigator(
                key: _navigatorKey,
                // initialRoute: 'homepage',
                onGenerateInitialRoutes: (NavigatorState state, String initialRoute) {
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    if (html.window.history.length > 1) {
                      html.window.history.go(-html.window.history.length + 1);
                    }
                  });return [
                    MaterialPageRoute(
                      builder: (context) => HomePageScreen(),
                    ),
                  ];
                },
                onGenerateRoute: (RouteSettings settings) {
                  WidgetBuilder builder;
                  switch (settings.name) {
                    case 'homepage':
                      builder = (BuildContext _) => HomePageScreen();
                      break;
                    case 'history':
                      builder = (BuildContext _) => HistoryScreen(); // Make similar changes to HistoryScreen
                      break;
                      case 'subscription':
                      builder = (BuildContext _) => SubscriptionPage(); // Make similar changes to HistoryScreen
                      break;
                    case 'profile':
                      builder = (BuildContext _) => ProfilePage();
                      break;
                  // ... other routes
                    default:
                      throw Exception('Invalid route: ${settings.name}');
                  }
                  // return MaterialPageRoute(builder: builder, settings: settings);
                  return PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => builder(context),
                    transitionsBuilder: (context, animation1, animation2, child) {
                      return FadeTransition(opacity: animation1, child: child);
                    },
                    transitionDuration: Duration(milliseconds: 500),
                  );
                },
              ),

            ),
          ],
        ),
      ),
    );
  }
}
