import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:typingtest/view_model/provider/login_provider.dart';
import 'package:typingtest/view_model/services/firebase_services.dart';
import 'package:typingtest/view_model/provider/navigation_provider.dart';

class LeftDrawer extends StatelessWidget {

  final bool isMobile;
  const LeftDrawer(
      {required this.isMobile,super.key,});

  @override
  Widget build(BuildContext context) {
    return Consumer2<LoginUserProvider,NavigationProvider>(builder: (context, userProvider,navigationService, child) {
      final isLoggedIn = userProvider.user != null;
      return Container(
        width: 220,
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
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
              drawerItems(context,Icons.category_outlined, "All Tests", '/home', userProvider, navigationService),
              drawerItems(context,Icons.menu_book_rounded, "Learn Typing", '/menu', userProvider, navigationService),
              drawerItems(context,Icons.account_balance_wallet_outlined, "Subscriptions", '/subscription',userProvider, navigationService),
              drawerItems(context,Icons.history_outlined, "Result History", '/history/false', userProvider, navigationService),
              drawerItems(context,Icons.person_2_outlined, "My Profile", '/profile', userProvider, navigationService),
              if (isLoggedIn)
                drawerItems(context, Icons.logout_outlined, "Log Out", 'logout', userProvider, navigationService),
              ],
          ),
        ),
      );
    });
  }

  Widget drawerItems(BuildContext context,IconData icon, String title, String pageId, LoginUserProvider userProvider, NavigationProvider navigationProvider) {
    final currentRoute = navigationProvider.currentPage;
    bool isSelected = currentRoute.contains(pageId);
    print("$currentRoute : $pageId");


    return Container(
          color: isSelected ? const Color(0xff369CBC).withOpacity(0.08) : null,
          child: ListTile(
            leading: Icon(icon, color: isSelected ? const Color(0xff369CBC) : Colors.grey),
            title: Text(title, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.5, color: isSelected ? const Color(0xff369CBC) : Colors.grey)),
            onTap: () async {
              if (pageId == 'logout') {
                await FirebaseAuthService.instance.signOut();
                userProvider.setUser(null);
                Provider.of<NavigationProvider>(context, listen: false).addOriginalLocation('/home');
                Provider.of<NavigationProvider>(context, listen: false).addOriginalLocation('/home');
                GoRouter router = GoRouter.of(context);
                router.replace('/welcome');
              } else {
                navigationProvider.updateCurrentPage(pageId);
                GoRouter.of(context).go(pageId);
                if (isMobile) {
                  Scaffold.of(context).openEndDrawer();
                }
              }
            },
          ),
        );
  }
}











// else if (pageId == 'login') {
// final user = await FirebaseAuthService.instance.signInWithGoogle();
// userProvider.setUser(user);
// print("user set");
// await apiService.registerUser(user!.email ?? '', user.displayName ?? '');
// await apiProvider.fetchLiveTest();
// await apiProvider.fetchPracticeTest();
// }