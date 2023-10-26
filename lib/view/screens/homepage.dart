// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:typingtest/view/widgets/Left_drawer.dart';
import 'package:typingtest/view/widgets/homepage_widgets/gridview_for_homepage.dart';


class HOMEPAGE extends StatefulWidget {
  const HOMEPAGE({super.key});

  @override
  State<HOMEPAGE> createState() => _HOMEPAGEState();
}

class _HOMEPAGEState extends State<HOMEPAGE> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5FAFC),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeftDrawer(
            // isProfilePage: false,
            onItemSelected: (selectedPage) {
              _navigatorKey.currentState!.pushReplacementNamed(selectedPage);
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TopNavigationBar(),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: Text("All Tests",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50.0, right: 50,bottom: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Image.asset("assets/images/banner.png",),
                        SizedBox(height: 15,),
                       DynamicGridView(),
                      ],
                    ),
                  ),
                  // if (FirebaseAuth.instance.currentUser?.displayName != null) ...[
                  //   CircleAvatar(
                  //     radius: 40,
                  //     backgroundImage: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!),
                  //   ),
                  //   Text(FirebaseAuth.instance.currentUser!.displayName!,style: const TextStyle(fontSize: 16),),
                  //   Center(child: SizedBox(
                  //     height: 25,
                  //     child: ElevatedButton(
                  //       style: ButtonStyle(elevation: MaterialStateProperty.all(0),
                  //           backgroundColor: MaterialStateProperty.all(Colors.white),
                  //           shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  //               side: const BorderSide(color: Colors.purple),borderRadius: BorderRadius.circular(10)
                  //           ))),
                  //       onPressed: () async {
                  //         await FirebaseServices().signOut();
                  //         setState(() {
                  //
                  //         });
                  //       },
                  //       child: const Text('Log Out', style: TextStyle(color: Colors.black)),
                  //     ),
                  //   ),),
                  // ]

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
