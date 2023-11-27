import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:typingtest/view_model/locator.dart';
import 'package:typingtest/view_model/provider/api_provider.dart';
import 'package:typingtest/view_model/provider/login_provider.dart';
import 'package:typingtest/view_model/services/api_services.dart';
import 'package:typingtest/view_model/services/firebase_services.dart';
import 'package:typingtest/view_model/services/navigation_service.dart';

class LeftDrawer extends StatelessWidget {

  const LeftDrawer(
      {super.key,});

  @override
  Widget build(BuildContext context) {
    return Consumer2<LoginUserProvider,NavigationService>(builder: (context, userProvider,navigationService, child) {
      final isLoggedIn = userProvider.user != null;
      final currentRoute = navigationService.currentPage;

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
            drawerListTile(context,Icons.category_outlined, "All Tests", 'homepage', userProvider, navigationService),
            drawerListTile(context,Icons.menu_book_rounded, "Learn Typing", 'learn', userProvider, navigationService),
            drawerListTile(context,Icons.account_balance_wallet_outlined, "Subscriptions", 'subscription',userProvider, navigationService),
            drawerListTile(context,Icons.history_outlined, "Result History", 'history', userProvider, navigationService),
            drawerListTile(context,Icons.person_2_outlined, "My Profile", 'profile', userProvider, navigationService),
            isLoggedIn ? drawerListTile(context,Icons.logout_outlined, "Log Out", 'logout', userProvider, navigationService) : drawerListTile(context,Icons.login_outlined, "Log In", 'login', userProvider, navigationService),
          ],
        ),
      );
    });
  }

  Widget drawerListTile(BuildContext context,IconData icon, String title, String pageId, LoginUserProvider userProvider, NavigationService navigationService) {
    final ApiService apiService = ApiService();
    final apiProvider = Provider.of<ApiProvider>(context);
    final currentRoute = navigationService.currentPage;
    bool isSelected = currentRoute == pageId;
    print("currentRoute: $currentRoute, pageId: $pageId");

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
                print("user set");
                await apiService.registerUser(user!.email ?? '', user.displayName ?? '');
                await apiProvider.fetchLiveTest();
                await apiProvider.fetchPracticeTest();
              } else {
                print("in drawer");
                // onItemSelected(pageId);
                locator<NavigationService>().navigateTo(pageId);
              }
            },
          ),
        );
  }
}
