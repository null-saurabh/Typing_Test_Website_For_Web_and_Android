import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/view/widgets/homepage_widgets/gridview_for_homepage.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) =>  buildDesktopLayout(context),
    );
  }
}

Widget buildDesktopLayout(BuildContext context){
  final scrollController1 = ScrollController();
  return Scrollbar(
    controller: scrollController1,
    interactive: false,
    thumbVisibility: true,
    child: SingleChildScrollView(
      controller: scrollController1,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 50.0),
            child: Text("All Tests",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50,bottom: 50),
            child: HomepageContent(),
          ),
        ],
      ),
    ),
  );
}

Widget buildMobileLayout(BuildContext context){
  final scrollController1 = ScrollController();
  return Scrollbar(
    controller: scrollController1,
    interactive: false,
    thumbVisibility: true,
    child: SingleChildScrollView(
      controller: scrollController1,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15,bottom: 50),
            child: HomepageContent(),
          ),
        ],
      ),
    ),
  );
}


class HomepageContent extends StatelessWidget {
  const HomepageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        Image.asset("assets/images/banner.png",),
        const SizedBox(height: 15,),
        const DynamicGridView(),
      ],
    );
  }
}



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
