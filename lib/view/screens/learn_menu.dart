import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:typingtest/view_model/provider/learn_menu_provider.dart';

class LearnMenuScreen extends StatelessWidget {
  const LearnMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typing Test Menu'),
      ),
      body: ListView(
        children: [
          _buildMenuItem(context, 'Letters ASDFJKL;',0),
          _buildMenuItem(context, 'Letters QWERUIOP',1),
          _buildMenuItem(context, 'Letters ZXCVM,.',2),
          _buildMenuItem(context, 'Letters TYGHBN',3),
          _buildMenuItem(context, 'Letters ASDFQWERJKL;UIOP',4),
          // Add more menu items as needed
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String menuText, int index) {
    return ListTile(
      title: Text(menuText),
      onTap: () {
        Provider.of<LearnMenuProvider>(context, listen: false)
            .setTestIndex(index);
        GoRouter.of(context).go('/learn');
      },
    );
  }

}