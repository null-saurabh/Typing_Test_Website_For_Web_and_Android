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
        mobile: (BuildContext context) => buildMobileLayout(context),
        desktop: (BuildContext context) =>  buildDesktopLayout(context),
      )

    );
  }

  bool showLeftDrawer(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    return currentRoute != '/welcome';
  }

  Widget buildDesktopLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showLeftDrawer(context)) const LeftDrawer(),
          Expanded(
            child: widget.child
          )
        ],
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context) {
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
      drawer: showLeftDrawer(context) ? const LeftDrawer() : null,
      backgroundColor: const Color(0xffF5FAFC),
      body: widget.child

    );
  }

}