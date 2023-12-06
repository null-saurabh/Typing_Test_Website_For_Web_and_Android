import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/view_model/provider/learn_menu_provider.dart';

class LearnMenuScreen extends StatelessWidget {
  const LearnMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) => buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typing Test Menu'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 250 / 100,
        ),
        children: [
          _buildDesktopMenuItem(context, 'Letters ASDFJKL;',0),
          _buildDesktopMenuItem(context, 'Letters QWERUIOP',1),
          _buildDesktopMenuItem(context, 'Letters ZXCVM,.',2),
          _buildDesktopMenuItem(context, 'Letters TYGHBN',3),
          _buildDesktopMenuItem(context, 'Letters ASDFQWERJKL;UIOP',4),
          // Add more menu items as needed
        ],
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typing Test Menu'),
      ),
      body: ListView(
        children: [
          _buildMobileMenuItem(context, 'Letters ASDFJKL;',0),
          _buildMobileMenuItem(context, 'Letters QWERUIOP',1),
          _buildMobileMenuItem(context, 'Letters ZXCVM,.',2),
          _buildMobileMenuItem(context, 'Letters TYGHBN',3),
          _buildMobileMenuItem(context, 'Letters ASDFQWERJKL;UIOP',4),
          // Add more menu items as needed
        ],
      ),
    );
  }

  Widget _buildMobileMenuItem(BuildContext context, String menuText, int index) {
    return Card(
      color: const Color(0xff369CBC),
      child: Center(
        child: ListTile(
          title: Center(child: Text(menuText,style: const TextStyle(color: Colors.white))),
          onTap: () {
            Provider.of<LearnMenuProvider>(context, listen: false)
                .setTestIndex(index);
            GoRouter.of(context).go('/learn');
          },
        ),
      ),

    );
  }
  
  Widget _buildDesktopMenuItem(BuildContext context, String menuText, int index) {
    return Card(
      color: const Color(0xff369CBC),
      child:TextButton(
          onPressed: () {
            Provider.of<LearnMenuProvider>(context, listen: false)
                .setTestIndex(index);
            GoRouter.of(context).go('/learn');
          },
          child: Text(menuText,style: const TextStyle(color: Colors.white)))
    );
  }

}