import 'package:flutter/material.dart';
import 'package:typingtest/view/screens/homepage.dart';
import 'package:typingtest/view/widgets/Left_drawer.dart';
import 'package:typingtest/view/widgets/top_navigation_bar.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5FAFC),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LeftDrawer(isProfilePage: false),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // const TopNavigationBar(),
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.1,
                // ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Subscriptions",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 75),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      priceWidget(false, true, context),
                      const SizedBox(width: 10),
                      priceWidget(true, false, context),
                      const SizedBox(
                        width: 10,
                      ),
                      priceWidget(false, false, context),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget priceWidget(bool recommended, bool freePlan, BuildContext context) {
    return Container(
      // constraints: BoxConstraints(minWidth: 275),
      width: 275,
      // height: MediaQuery.of(context).size.height * 0.625,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (recommended)
              Stack(alignment: Alignment.center, children: [
                Image.asset(
                  "assets/images/subscription_design_dark.png",
                  height: 185,
                ),
                const Center(
                    child: Text(
                  "₹199/Year",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ))
              ])
            else
              Stack(alignment: Alignment.center, children: [
                Image.asset(
                  "assets/images/subscription_design_light.png",
                  height: 185,
                ),
                freePlan
                    ? const Center(
                        child: Text("FREE",
                            style: TextStyle(
                                fontSize: 29,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff369CBC))))
                    : const Center(
                        child: Text("₹299/Year",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff369CBC)))),
              ]),
            const SizedBox(
              height: 25,
            ),
            subscriptionText(true),
            const SizedBox(
              height: 7.5,
            ),
            subscriptionText(true),
            const SizedBox(
              height: 7.5,
            ),
            subscriptionText(true),
            const SizedBox(
              height: 7.5,
            ),
            subscriptionText(false),
            const SizedBox(
              height: 7.5,
            ),
            subscriptionText(false),
            const SizedBox(
              height: 7.5,
            ),
            subscriptionText(false),
            // const Spacer(),
            SizedBox(height: 50),
            freePlan
                ? buyButton("Get Started", context)
                : recommended
                    ? buyRecommendedButton(context)
                    : buyButton("Buy Now", context),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget buyRecommendedButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(const Color(0xff369CBC)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xff369CBC)),
                borderRadius: BorderRadius.circular(5)))),
        onPressed: () async {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HOMEPAGE()));
        },
        child: const Text(
          'Buy Now',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget buyButton(String buyText, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xff369CBC)),
                borderRadius: BorderRadius.circular(5)))),
        onPressed: () async {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HOMEPAGE()));
        },
        child: Text(
          buyText,
          style: const TextStyle(color: Color(0xff369CBC)),
        ),
      ),
    );
  }

  Widget subscriptionText(bool included) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        included
            ? Image.asset(
                "assets/images/tick-circle.png",
                width: 21,
                height: 21,
              )
            : Image.asset(
                "assets/images/close-circle.png",
                width: 21,
                height: 21,
              ),
        const SizedBox(width: 5),
        const Expanded(
          child: Text(
            "Lorem ipsum dolor sit amet",
            style: TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}
