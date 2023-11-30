import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:typingtest/view_model/locator.dart';
import 'package:typingtest/view_model/provider/api_provider.dart';
import 'package:typingtest/view_model/provider/login_provider.dart';
import 'package:typingtest/view_model/services/api_services.dart';
import 'package:typingtest/view_model/services/firebase_services.dart';
import 'package:typingtest/view_model/services/navigation_service.dart';

class WelcomeLoginScreen extends StatelessWidget {
  const WelcomeLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) =>  buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context){
    final scrollController1 = ScrollController();
    final ApiService apiService = ApiService();
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    final userProvider = Provider.of<LoginUserProvider>(context, listen: false);

    return Scaffold(
      body:Scrollbar(
        controller: scrollController1,
        interactive: false,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: scrollController1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/banner.png",),
              const SizedBox(height: 45,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Welcome To\nA1 typing",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Color(0xff369CBC)),),
          ElevatedButton(
            style: ButtonStyle(elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(const Color(0xff369CBC)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xff369CBC)),borderRadius: BorderRadius.circular(20)
                ))),
            onPressed: () async {
              final user = await FirebaseAuthService.instance.signInWithGoogle();
              userProvider.setUser(user);
              print("user set");
              await apiService.registerUser(user!.email ?? '', user.displayName ?? '');
              await apiProvider.fetchLiveTest();
              await apiProvider.fetchPracticeTest();
              locator<NavigationService>().navigateTo('homepage');

            },
            child: const Text('Login', style: TextStyle(color: Colors.white),),
          )
                ],
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget buildMobileLayout(BuildContext context){
    final scrollController1 = ScrollController();
    final ApiService apiService = ApiService();
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    final userProvider = Provider.of<LoginUserProvider>(context, listen: false);

    return Scaffold(
        body:Scrollbar(
          controller: scrollController1,
          interactive: false,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: scrollController1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/banner.png",),
                const SizedBox(height: 50,),
                const Text("Welcome To\nA1 typing",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Color(0xff369CBC)),),
                const SizedBox(height: 25,),
                ElevatedButton(
                  style: ButtonStyle(elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(const Color(0xff369CBC)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xff369CBC)),borderRadius: BorderRadius.circular(20)
                      ))),
                  onPressed: () async {
                    final user = await FirebaseAuthService.instance.signInWithGoogle();
                    userProvider.setUser(user);
                    print("user set");
                    await apiService.registerUser(user!.email ?? '', user.displayName ?? '');
                    await apiProvider.fetchLiveTest();
                    await apiProvider.fetchPracticeTest();
                    locator<NavigationService>().navigateTo('homepage');

                  },
                  child: const Text('Login', style: TextStyle(color: Colors.white),),
                )

              ],
            ),
          ),
        )
    );
  }


}
