import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart' hide WidgetBuilder;
import 'package:typingtest/view/widgets/Left_drawer.dart';




class HOMEVIEW extends StatefulWidget {
  final Widget child;
  const HOMEVIEW({required this.child,Key? key}) : super(key: key);

  @override
  State<HOMEVIEW> createState() => _HOMEVIEWState();
}

class _HOMEVIEWState extends State<HOMEVIEW> {
  final _navigatorKey = GlobalKey<NavigatorState>();

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
          const LeftDrawer(),
          Expanded(
            child: widget.child
          )
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
      drawer: const LeftDrawer(),
      backgroundColor: const Color(0xffF5FAFC),
      body: widget.child
      // Navigator(
      //   key: _navigatorKey,
      //   onGenerateInitialRoutes: (NavigatorState state, String initialRoute) {
      //     return [
      //       MaterialPageRoute(
      //         builder: (context) => const HomePageScreen(),
      //       ),
      //     ];
      //   },
      //   onGenerateRoute: (RouteSettings settings) {
      //     WidgetBuilder builder; // From package:flutter/src/widgets/framework.dart
      //     switch (settings.name) {
      //       case 'homepage':
      //         builder = (BuildContext _) => const HomePageScreen();
      //         break;
      //       case 'history':
      //         builder = (BuildContext _) => const HistoryScreen(
      //               popup: false,
      //             ); // Make similar changes to HistoryScreen
      //         break;
      //       case 'subscription':
      //         builder = (BuildContext _) =>
      //             const SubscriptionPage(); // Make similar changes to HistoryScreen
      //         break;
      //       case 'profile':
      //         builder = (BuildContext _) => const ProfilePage();
      //         break;
      //       // ... other routes
      //       default:
      //         throw Exception('Invalid route: ${settings.name}');
      //     }
      //     return PageRouteBuilder(
      //       pageBuilder: (context, _, __) => builder(context),
      //       transitionDuration: Duration.zero,
      //     );
      //   },
      // ),
    );
  }

}