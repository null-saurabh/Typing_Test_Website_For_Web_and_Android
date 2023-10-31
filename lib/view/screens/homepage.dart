import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart' hide WidgetBuilder;
import 'package:typingtest/view/screens/Homepage_screen.dart';
import 'package:typingtest/view/screens/history_screen.dart';
import 'package:typingtest/view/screens/profile_page.dart';
import 'package:typingtest/view/screens/subscription.dart';
import 'package:typingtest/view/widgets/Left_drawer.dart';
import 'dart:html' as html;




class HOMEPAGE extends StatefulWidget {
  const HOMEPAGE({Key? key}) : super(key: key);

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
      child: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => buildMobileLayout(),
        desktop: (BuildContext context) =>  buildDesktopLayout(),
      )

    );
  }

  Widget buildDesktopLayout() {
    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeftDrawer(
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
              onGenerateInitialRoutes:
                  (NavigatorState state, String initialRoute) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (html.window.history.length > 1) {
                    html.window.history.go(-html.window.history.length + 1);
                  }
                });
                return [
                  MaterialPageRoute(
                    builder: (context) => const HomePageScreen(),
                  ),
                ];
              },
              onGenerateRoute: (RouteSettings settings) {
                WidgetBuilder builder;
                switch (settings.name) {
                  case 'homepage':
                    builder = (BuildContext _) => const HomePageScreen();
                    break;
                  case 'history':
                    builder = (BuildContext _) => const HistoryScreen(
                          popup: false,
                        ); // Make similar changes to HistoryScreen
                    break;
                  case 'subscription':
                    builder = (BuildContext _) =>
                        const SubscriptionPage(); // Make similar changes to HistoryScreen
                    break;
                  case 'profile':
                    builder = (BuildContext _) => const ProfilePage();
                    break;
                  // ... other routes
                  default:
                    throw Exception('Invalid route: ${settings.name}');
                }
                // return MaterialPageRoute(builder: builder, settings: settings);
                return PageRouteBuilder(
                  pageBuilder: (context, _, __) => builder(context),
                  transitionDuration: Duration.zero,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
            );
          },
        ),
      ),
      drawer: LeftDrawer(
        onItemSelected: (selectedPage) {
          _navigatorKey.currentState!.pushReplacementNamed(selectedPage);
          setState(() {
            _currentPage = selectedPage;
          });
          Navigator.pop(context); // Close the drawer
        },
        currentPage: _currentPage,
      ),
      backgroundColor: const Color(0xffF5FAFC),
      body: Navigator(
        key: _navigatorKey,
        onGenerateInitialRoutes: (NavigatorState state, String initialRoute) {
          return [
            MaterialPageRoute(
              builder: (context) => const HomePageScreen(),
            ),
          ];
        },
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder; // From package:flutter/src/widgets/framework.dart
          switch (settings.name) {
            case 'homepage':
              builder = (BuildContext _) => const HomePageScreen();
              break;
            case 'history':
              builder = (BuildContext _) => const HistoryScreen(
                    popup: false,
                  ); // Make similar changes to HistoryScreen
              break;
            case 'subscription':
              builder = (BuildContext _) =>
                  const SubscriptionPage(); // Make similar changes to HistoryScreen
              break;
            case 'profile':
              builder = (BuildContext _) => const ProfilePage();
              break;
            // ... other routes
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return PageRouteBuilder(
            pageBuilder: (context, _, __) => builder(context),
            transitionDuration: Duration.zero,
          );
        },
      ),
    );
  }

}










































// LayoutBuilder(
//   builder: (context, constraints) {
//     if (constraints.maxWidth >= 768) {
//       return buildMobileLayout();
//     } else {
//       return buildMobileLayout();
//     }
//   },
// ),
// class HOMEPAGE extends StatefulWidget {
//   const HOMEPAGE({super.key});
//
//   @override
//   State<HOMEPAGE> createState() => _HOMEPAGEState();
// }
//
// class _HOMEPAGEState extends State<HOMEPAGE> {
//   final _navigatorKey = GlobalKey<NavigatorState>();
//   String _currentPage = 'homepage';
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         if (_navigatorKey.currentState!.canPop()) {
//           _navigatorKey.currentState!.pop();
//           return false;
//         }
//         return true;
//       },
//       child: Scaffold(
//         backgroundColor: Color(0xffF5FAFC),
//         body: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             LeftDrawer(
//               // isProfilePa  ge: false,
//               onItemSelected: (selectedPage) {
//                 _navigatorKey.currentState!.pushReplacementNamed(selectedPage);
//                 setState(() {
//                   _currentPage = selectedPage;
//                 });
//               },
//               currentPage: _currentPage,
//
//             ),
//             Expanded(
//               child: Navigator(
//                 key: _navigatorKey,
//                 // initialRoute: 'homepage',
//                 onGenerateInitialRoutes: (NavigatorState state, String initialRoute) {
//                   WidgetsBinding.instance!.addPostFrameCallback((_) {
//                     if (html.window.history.length > 1) {
//                       html.window.history.go(-html.window.history.length + 1);
//                     }
//                   });return [
//                     MaterialPageRoute(
//                       builder: (context) => HomePageScreen(),
//                     ),
//                   ];
//                 },
//                 onGenerateRoute: (RouteSettings settings) {
//                   WidgetBuilder builder;
//                   switch (settings.name) {
//                     case 'homepage':
//                       builder = (BuildContext _) => HomePageScreen();
//                       break;
//                     case 'history':
//                       builder = (BuildContext _) => HistoryScreen(popup: false,); // Make similar changes to HistoryScreen
//                       break;
//                       case 'subscription':
//                       builder = (BuildContext _) => SubscriptionPage(); // Make similar changes to HistoryScreen
//                       break;
//                     case 'profile':
//                       builder = (BuildContext _) => ProfilePage();
//                       break;
//                   // ... other routes
//                     default:
//                       throw Exception('Invalid route: ${settings.name}');
//                   }
//                   // return MaterialPageRoute(builder: builder, settings: settings);
//                   return PageRouteBuilder(
//                     pageBuilder: (context, _, __) => builder(context),
//                     transitionDuration: Duration.zero,
//                   );
//                 },
//               ),
//
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// }
