import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:typingtest/view_model/provider/login_provider.dart';
import 'package:typingtest/view_model/services/firebase_services.dart';

class LeftDrawer extends StatelessWidget {
  final Function(String) onItemSelected;
  final String currentPage;
  const LeftDrawer(
      {required this.onItemSelected, required this.currentPage, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginUserProvider>(builder: (context, userProvider, child) {
      final isLoggedIn = userProvider.user != null;
      return Container(
        width: 220,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const SizedBox(height: 5),
            const Text("LOGO", style: TextStyle(fontSize: 32, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600, color: Colors.black)),
            // const SizedBox(height: 20),
            if (isLoggedIn) ...[
              Text(userProvider.user!.displayName ?? 'No Name', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
              // const SizedBox(height: 5),
              Text(userProvider.user!.email ?? 'No Email', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey)),
            ],
            const SizedBox(height: 20),
            drawerListTile(Icons.category_outlined, "All Tests", 'homepage', userProvider),
            drawerListTile(Icons.account_balance_wallet_outlined, "Subscriptions", 'subscription', userProvider),
            drawerListTile(Icons.history_outlined, "Result History", 'history', userProvider),
            drawerListTile(Icons.person_2_outlined, "My Profile", 'profile', userProvider),
            isLoggedIn ? drawerListTile(Icons.logout_outlined, "Log Out", 'logout', userProvider) : drawerListTile(Icons.login_outlined, "Log In", 'login', userProvider),
          ],
        ),
      );
    });
  }

  Widget drawerListTile(IconData icon, String title, String pageId, LoginUserProvider userProvider) {
    return Builder(
      builder: (context) {
        bool isSelected = currentPage == pageId;
        return Container(
          color: isSelected ? const Color(0xff369CBC).withOpacity(0.08) : null,
          child: ListTile(
            leading: Icon(icon, color: isSelected ? const Color(0xff369CBC) : Colors.grey),
            title: Text(title, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.5, color: isSelected ? const Color(0xff369CBC) : Colors.grey)),
            onTap: () async {
              if (pageId == 'logout') {
                await FirebaseAuthService.instance.signOut();
                userProvider.setUser(null);
              } else if (pageId == 'login') {
                final user = await FirebaseAuthService.instance.signInWithGoogle();
                userProvider.setUser(user);
              } else {
                onItemSelected(pageId);
              }
            },
          ),
        );
      },
    );
  }
}















// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:typingtest/view_model/provider/login_provider.dart';
// import 'package:typingtest/view_model/services/firebase_services.dart';
//
// class LeftDrawer extends StatelessWidget {
//   final Function(String) onItemSelected;
//   final String currentPage;
//   const LeftDrawer(
//       {required this.onItemSelected, required this.currentPage, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<LoginUserProvider>(builder: (context, userProvider, child) {
//       final isLoggedIn = userProvider.user != null;
//       return Container(
//         width: 220,
//         height: double.infinity,
//         color: Colors.white,
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//
//             const SizedBox(
//               height: 5,
//             ),
//             const Text("LOGO",
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontStyle: FontStyle.italic,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 )),
//
//             const SizedBox(
//               height: 20,
//             ),
//             drawerListTile(Icons.category_outlined, "All Tests", 'homepage'),
//             drawerListTile(Icons.account_balance_wallet_outlined,
//                 "Subscriptions", 'subscription'),
//             drawerListTile(Icons.history_outlined, "Result History", 'history'),
//             drawerListTile(Icons.person_2_outlined, "My Profile", 'profile'),
//             // drawerListTile(Icons.logout_outlined, "Log out",  'logout'),
//             isLoggedIn
//                 ? drawerListTile(Icons.logout_outlined, "Log Out", 'logout')
//                 : drawerListTile(Icons.login_outlined, "Log In", 'login'),
//           ],
//         ),
//       );
//     });
//   }
//
//   Widget drawerListTile(IconData icon, String title, String pageId) {
//     return Builder(
//       builder: (context) {
//         // bool isSelected = ModalRoute.of(context)?.settings.name == pageId;
//         bool isSelected = currentPage == pageId;
//         return Container(
//           color: isSelected ? const Color(0xff369CBC).withOpacity(0.08) : null,
//           child: ListTile(
//             leading: Icon(
//               icon,
//               color: isSelected ? Color(0xff369CBC) : Colors.grey,
//             ),
//             title: Text(
//               title,
//               style: TextStyle(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 16.5,
//                   color: isSelected ? Color(0xff369CBC) : Colors.grey),
//             ),
//             onTap: () {
//               if (pageId == 'logout') {
//                 FirebaseAuthService.instance.signOut();
//                 LoginUserProvider.setUser(null);
//               } else if (pageId == 'login') {
//                 FirebaseAuthService.instance.signInWithGoogle().then((user) {
//                   userProvider.setUser(user);
//                 });
//               } else {
//                 onItemSelected(pageId);
//               }
//             },
//           ),
//         );
//       },
//     );
//   }
// }
