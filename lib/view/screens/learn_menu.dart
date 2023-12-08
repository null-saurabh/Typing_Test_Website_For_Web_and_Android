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
    "a, s, d, f, j, k, l and ‘;’",
    'q, w, e, r, u, i, o and p',
    "z, x, c, v, m, ‘,’ and ‘.’",
    't, y, g, h, b and n',
    "a, s, d, f, q, w, e, r, j, k, l, ‘;’, u, i, o and p",
    "a, s, d, f, J, K, L and ‘;’",
    "q, w, e, r, U, I, O and P",
    "z, x, c, v, M, ‘,’ and ‘.’",
    "t, y, g, h, B and N",
    "c, v, b, n, m, ‘,’, ‘.’, ‘/’, G, H, J and K",
    "q, w, e, r, t, y, u, i, o, p, ‘[’ and ‘]’",
    'A, S, D, F, G, H, J, K, L, ‘;’, ‘’’ and ‘\\’',
    "Z, X, C, V, B, N, M, ‘,’, ‘.’, ‘/’ and ‘?’",
    "Q, A, Z, W, S, X, E, D, C, R, F and V",


    "t, g, b, y, h, n, U, J, M, I, K and ‘,’",
    '''o, l, ‘.’, p, ‘;’, ‘/’, ‘[’, ‘]’, ‘\\’, ‘’’ and ‘"’ ''',
    "e, d, c, r, f, v, T, G, B, Y, H and N",
    "u, j, m, i, k, ‘,’, O, L, ‘.’, P, ';' and ‘/’",
    "A, z, Q, s, X, W, d, c, E, f, V and r",
    "n, M, ‘,’, ‘.’, ‘/’, B, v, c, X, z and ‘?’",
    '''H, j, k, l, ‘;’, ‘’’ and ‘"’, G, f, d, S, a and ‘\\’ ''',
    "Y, u, i, O, p, ‘[’, ‘]’, t, R, e, W and q",
    '''K, l, ‘;’, ‘’’ and ‘"’, J, h, g, F, d and S''',

  "'`', 1, 2, 3, 4, q, w, e and r",
  "5, 6, t, y, g, h, b and n",
  "7, 8, u, i, j, k, m and ','",
  "9, 0, o, p, '[', ']', 'l' and ';'",
  "'`', 1, 2, 3, 4, a, s, d and f",
  "5, 6, g, h, j, k, l and ';'",
  "7, 8, z, x, c, v, b and n",
  "9, 0, m, ',', '.', '/', '?', and '`'",

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
        trailing: startButton(context,index),
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