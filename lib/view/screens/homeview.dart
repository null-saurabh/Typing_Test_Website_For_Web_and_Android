import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart' hide WidgetBuilder;
import 'package:typingtest/view/widgets/Left_drawer.dart';
import 'package:typingtest/view_model/provider/navigation_provider.dart';




class HOMEVIEW extends StatefulWidget {
  final Widget child;
  const HOMEVIEW({required this.child,Key? key}) : super(key: key);

  @override
  State<HOMEVIEW> createState() => _HOMEVIEWState();
}

class _HOMEVIEWState extends State<HOMEVIEW> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  // final _scaffoldKey = GlobalKey<ScaffoldState>();

  // @override
  // void initState() {
  //   final userProvider = Provider.of<LoginUserProvider>(context, listen: false);
  //   if (userProvider.user == null){
  //     GoRouter.of(context).go('/welcome');
  //   }
  //   super.initState();
  // }

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


  Widget buildDesktopLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LeftDrawer(isMobile: false,),
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
        title: Text(Provider.of<NavigationProvider>(context).pageTitle),
      ),
      drawer: const LeftDrawer(isMobile: true,),

      backgroundColor: const Color(0xffF5FAFC),
      body: widget.child

    );
  }

}