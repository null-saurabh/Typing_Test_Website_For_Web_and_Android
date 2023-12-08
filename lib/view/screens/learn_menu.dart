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

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) => buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context){
    final List<String> menuItems = Provider.of<LearnMenuProvider>(context).getMenuItems;
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
    final List<String> menuItems = Provider.of<LearnMenuProvider>(context).getMenuItems;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 15.0,left: 15,top: 0,bottom: 15),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Typing Lessons',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            const SizedBox(height: 15,),
            Expanded(
              child: ListView.builder(
                  itemCount: menuItems.length,
                  itemBuilder: (context,index){
                    return _buildMobileMenuItem(context, menuItems[index], index);
                  }

              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileMenuItem(BuildContext context, String menuText, int index) {
    return Card(
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
        title: Text(menuText,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 18)),
        trailing: startButton(context,index,menuText),
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
        trailing: startButton(context,index,menuText),
      )
    );
  }

  Widget startButton(BuildContext context,int index,menuText){
    return ElevatedButton(
      style: ButtonStyle(elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(const Color(0xff369CBC)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),borderRadius: BorderRadius.circular(5)
          ))),
      onPressed: () async {
        Provider.of<LearnMenuProvider>(context, listen: false)
                  .setTestIndex(index);
              GoRouter.of(context).go('/learn/$menuText');
      },
      child: const Text('Start', style: TextStyle(color: Colors.white),),
    );
  }

}