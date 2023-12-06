import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/view_model/provider/learn_menu_provider.dart';

// void main() async {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
// // This widget is the root
// // of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: "ListView.builder",
//         theme: ThemeData(primarySwatch: Colors.green),
//         debugShowCheckedModeBanner: false,
//         // home : new ListViewBuilder(),  NO Need To Use Unnecessary New Keyword
//         home: const LearnMenuScreen());
//   }
// }

class LearnMenuScreen extends StatelessWidget {
  const LearnMenuScreen({super.key});

  final List<String> menuItems = const [
    "A, S, D, F, J, K, L and ';'",
    'Q, W, E, R, U, I, O and P',
    "Z, X, C, V, M, ',' and '.'",
    'T, Y, G, H, B and N',
    "A, S, D, F, Q, W, E, R, J, K, L, ';', U, I, O and P"
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) => buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Typing Lessons',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context,index){
                  return _buildDesktopMenuItem(context, menuItems[index], index);
                }

              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Typing Menu'),
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
      // color: const Color(0xff369CBC),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.withOpacity(0.4)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text((index +1).toString(),style: const TextStyle(fontSize: 14),),
          ),
        ),
        title: Text(menuText,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
        trailing: startButton(context,index),
      )


      // TextButton(
      //     onPressed: () {
      //       Provider.of<LearnMenuProvider>(context, listen: false)
      //           .setTestIndex(index);
      //       GoRouter.of(context).go('/learn');
      //     },
    //       child: Text(menuText,style: const TextStyle(color: Colors.white)))
    );
  }

  Widget startButton(BuildContext context,int index){
    return ElevatedButton(
      style: ButtonStyle(elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(const Color(0xff369CBC)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),borderRadius: BorderRadius.circular(5)
          ))),
      onPressed: () async {
        Provider.of<LearnMenuProvider>(context, listen: false)
                  .setTestIndex(index);
              GoRouter.of(context).go('/learn');
      },
      child: const Text('Start', style: TextStyle(color: Colors.white),),
    );
  }

}