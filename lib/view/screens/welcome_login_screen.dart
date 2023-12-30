import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
// import 'package:typingtest/view_model/provider/api_provider.dart';
import 'package:typingtest/view_model/provider/login_provider.dart';
import 'package:typingtest/view_model/services/api_services.dart';
import 'package:typingtest/view_model/services/firebase_services.dart';
import 'package:typingtest/view_model/provider/navigation_provider.dart';

class WelcomeLoginScreen extends StatefulWidget {
  const WelcomeLoginScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeLoginScreen> createState() => _WelcomeLoginScreenState();
}

class _WelcomeLoginScreenState extends State<WelcomeLoginScreen> {
  bool isLoading = false;

  @override
  void initState() {
    final userProvider = Provider.of<LoginUserProvider>(context, listen: false);
    if (userProvider.user != null) {
      GoRouter.of(context).go('/home');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) => buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context) {
    final scrollController1 = ScrollController();
    final ApiService apiService = ApiService();
    // final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    final userProvider = Provider.of<LoginUserProvider>(context, listen: false);


    return Scaffold(
      body: Scrollbar(
        controller: scrollController1,
        interactive: false,
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: scrollController1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/banner.png",
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Welcome To\nA1 typing",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff369CBC),
                    ),
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff369CBC)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          side: const BorderSide(color: Color(0xff369CBC)),
                          borderRadius: BorderRadius.circular(20),
                        )),
                      ),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          // print('zz');

                          final user = await FirebaseAuthService.instance
                              .signInWithGoogle();
                          // print('a');
                          userProvider.setUser(user);
                          // print('b');

                          final registrationFuture = apiService.registerUser(
                              user!.email ?? '', user.displayName ?? '');
                          // final liveTestFuture = apiProvider.fetchLiveTest();
                          // final practiceTestFuture =
                          //     apiProvider.fetchPracticeTest();
                          await Future.wait([
                            registrationFuture,
                            // liveTestFuture,
                            // practiceTestFuture
                          ]);

                          if (userProvider.user != null) {
                            String path = Provider.of<NavigationProvider>(
                                        context,
                                        listen: false)
                                    .originalLocations[
                                Provider.of<NavigationProvider>(context,
                                            listen: false)
                                        .originalLocations
                                        .length -
                                    2];
                            GoRouter.of(context).go(path);
                          }
                        } catch (e) {
                          // rethrow;
                        } finally {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      child: isLoading
                          ? const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20, // Set the width as needed
                                  height: 20, // Set the height as needed
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Text('Logging in...',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            )
                          : const Text(
                              'Login With Google',
                              style: TextStyle(color: Colors.white),
                            )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMobileLayout(BuildContext context) {
    final scrollController1 = ScrollController();
    final ApiService apiService = ApiService();
    // final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    final userProvider = Provider.of<LoginUserProvider>(context, listen: false);

    return Scaffold(
        body: Scrollbar(
      controller: scrollController1,
      interactive: false,
      thumbVisibility: true,
        child: SingleChildScrollView(
        controller: scrollController1,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/banner.png",
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Welcome To\nA1 typing",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff369CBC)),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff369CBC)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xff369CBC)),
                      borderRadius: BorderRadius.circular(20)))),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                try {
                  final user =
                      await FirebaseAuthService.instance.signInWithGoogle();
                  userProvider.setUser(user);

                  final registrationFuture = apiService.registerUser(
                      user!.email ?? '', user.displayName ?? '');
                  // final liveTestFuture = apiProvider.fetchLiveTest();
                  // final practiceTestFuture = apiProvider.fetchPracticeTest();

                  await Future.wait(
                      [registrationFuture]);

                  if (userProvider.user != null) {
                    String path = Provider.of<NavigationProvider>(context,
                                listen: false)
                            .originalLocations[
                        Provider.of<NavigationProvider>(context, listen: false)
                                .originalLocations
                                .length -
                            2];
                    // print(path);
                    GoRouter.of(context).go(path);
                  }
                } catch (e) {
                  // rethrow;
                } finally {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              child: isLoading
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 20, // Set the width as needed
                          height: 20, // Set the height as needed
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text('Logging in...',
                            style: TextStyle(color: Colors.white)),
                      ],
                    )
                  : const Text(
                      'Login With Google',
                      style: TextStyle(color: Colors.white),
                    ),
            )
          ],
        ),
      ),
    ));
  }
}
