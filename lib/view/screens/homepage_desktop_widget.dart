// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:typingtest/view/screens/Homepage_screen.dart';
// import 'package:typingtest/view/screens/history_screen.dart';
// import 'package:typingtest/view/screens/profile_page.dart';
// import 'package:typingtest/view/screens/subscription.dart';
// import 'dart:html' as html;
//
// import 'package:typingtest/view/widgets/Left_drawer.dart';
//
// class BuildDesktopLayout extends StatefulWidget {
//   const BuildDesktopLayout({super.key});
//
//   @override
//   State<BuildDesktopLayout> createState() => _BuildDesktopLayoutState();
// }
//
// class _BuildDesktopLayoutState extends State<BuildDesktopLayout> {
//   @override
//   Widget build(BuildContext context) {
//     if (kIsWeb) { // Check if the app is running in a web environment
//       void clearHistory() {
//         if (html.window.history.length > 1) {
//           html.window.history.go(-html.window.history.length + 1);
//         }
//       }
//       clearHistory();
//     }
//
//
//     final navigatorKey = GlobalKey<NavigatorState>();
//     String currentPage = 'homepage';
//
//     return Scaffold(
//       backgroundColor: const Color(0xffF5FAFC),
//       body: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           LeftDrawer(
//             onItemSelected: (selectedPage) {
//               navigatorKey.currentState!.pushReplacementNamed(selectedPage);
//               setState(() {
//                 currentPage = selectedPage;
//               });
//             },
//             currentPage: currentPage,
//           ),
//           Expanded(
//             child: Navigator(
//               key: navigatorKey,
//               onGenerateInitialRoutes:
//                   (NavigatorState state, String initialRoute) {
//                 // WidgetsBinding.instance.addPostFrameCallback((_) {
//                 //   if (html.window.history.length > 1) {
//                 //     html.window.history.go(-html.window.history.length + 1);
//                 //   }
//                 // });
//                 return [
//                   MaterialPageRoute(
//                     builder: (context) => const HomePageScreen(),
//                   ),
//                 ];
//               },
//               onGenerateRoute: (RouteSettings settings) {
//                 WidgetBuilder builder;
//                 switch (settings.name) {
//                   case 'homepage':
//                     builder = (BuildContext _) => const HomePageScreen();
//                     break;
//                   case 'history':
//                     builder = (BuildContext _) => const HistoryScreen(
//                       popup: false,
//                     ); // Make similar changes to HistoryScreen
//                     break;
//                   case 'subscription':
//                     builder = (BuildContext _) =>
//                     const SubscriptionPage(); // Make similar changes to HistoryScreen
//                     break;
//                   case 'profile':
//                     builder = (BuildContext _) => const ProfilePage();
//                     break;
//                 // ... other routes
//                   default:
//                     throw Exception('Invalid route: ${settings.name}');
//                 }
//                 // return MaterialPageRoute(builder: builder, settings: settings);
//                 return PageRouteBuilder(
//                   pageBuilder: (context, _, __) => builder(context),
//                   transitionDuration: Duration.zero,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
