import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  final Function(String) onItemSelected;
  final String currentPage;
  const LeftDrawer({required this.onItemSelected,  required this.currentPage,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 20),

          const SizedBox(
            height: 5,
          ),
          const Text("LOGO",
              style: TextStyle(
                  fontSize: 32,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,)),

          const SizedBox(
            height: 20,
          ),
          drawerListTile(Icons.category_outlined, "All Tests", 'homepage'),
          drawerListTile(Icons.account_balance_wallet_outlined, "Subscriptions", 'subscription'),
          drawerListTile(Icons.history_outlined, "Result History", 'history'),
          drawerListTile(Icons.person_2_outlined, "My Profile", 'profile'),
          drawerListTile(Icons.logout_outlined, "Log out",  'logout'),
        ],
      ),
    );
  }

  Widget drawerListTile(IconData icon, String title, String pageId) {
    return Builder(
      builder: (context) {
        // bool isSelected = ModalRoute.of(context)?.settings.name == pageId;
        bool isSelected = currentPage == pageId;
        return Container(
          color: isSelected ? const Color(0xff369CBC).withOpacity(0.08) : null,
          child: ListTile(
            leading: Icon(
              icon,
              color: isSelected ? Color(0xff369CBC) : Colors.grey,
            ),
            title: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.5,
                  color: isSelected ? Color(0xff369CBC) : Colors.grey),
            ),
            onTap: pageId == 'logout'
                ? null
                : () => onItemSelected(pageId),
          ),
        );
      },
    );
  }

}
