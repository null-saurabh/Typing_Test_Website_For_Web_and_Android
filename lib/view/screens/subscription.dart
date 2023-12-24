import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
// import 'package:typingtest/view_model/provider/api_provider.dart';
import 'package:typingtest/view_model/provider/login_provider.dart';
import 'package:typingtest/view_model/provider/razorpay_provider.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => buildMobileLayout(context),
      desktop: (BuildContext context) =>  buildDesktopLayout(context),
    );
  }

  Widget buildDesktopLayout(BuildContext context){
    double width = 275;
    if(MediaQuery.of(context).size.width < 1150)
      {
        width = MediaQuery.of(context).size.width * 0.22;
      }
    final scrollController1 = ScrollController();

    return Scrollbar(
      controller: scrollController1,
      interactive: false,
      thumbVisibility: true,
      child: SingleChildScrollView(
        controller: scrollController1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Subscriptions",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 75),
              child: Row(
                children: [
                  priceWidget(false, true, context,width),
                  const SizedBox(width: 10),
                  priceWidget(true, false, context,width),
                  const SizedBox(
                    width: 10,
                  ),
                  priceWidget(false, false, context,width),
                ],
              ),
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              priceWidget(false, true, context,275),
              const SizedBox(height: 20),
              priceWidget(true, false, context,275),
              const SizedBox(
               height: 20,
              ),
              priceWidget(false, false, context,275),

            ],
          ),
        ),
      ),
    );
  }


  Widget priceWidget(bool recommended, bool freePlan, BuildContext context,double width) {
    // print(MediaQuery.of(context).size.width);
    return Container(
      // constraints: BoxConstraints(minWidth: 275),
      // width: 275,
      width: width,
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
            const SizedBox(height: 50),
            freePlan
                ? buyButton("Get Started", context,false,0)
                : recommended
                    ? buyButton("Buy Now", context,true,199)
                    : buyButton("Buy Now", context,false,299),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }


  Widget buyButton(String buyText, BuildContext context,bool isRecommended,int price) {
    final razorPayProvider = Provider.of<RazorPayProvider>(context, listen: false);
    final loginUserProvider = Provider.of<LoginUserProvider>(context);
    String email = loginUserProvider.user!.email!;
    String name = loginUserProvider.user!.displayName ?? loginUserProvider.user!.email! ;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: isRecommended ? MaterialStateProperty.all(const Color(0xff369CBC)) : MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xff369CBC)),
                borderRadius: BorderRadius.circular(5)))),
        onPressed: () async {
          if(price == 0){ GoRouter.of(context).go('/home');}
          else if(price >0){

            // final orderResponse = await Provider.of<ApiProvider>(context, listen: false)
            //     .createOrder(price);

            // final razorpayKey = orderResponse.razorpayKeyId;
            // final orderId = orderResponse.id;

            razorPayProvider.onSuccess = () {
              showTestEndedDialog(context,true);
            };

            razorPayProvider.onError = () {
              showTestEndedDialog(context,false);
            };

            razorPayProvider.openCheckout(
              amount: price * 100,
              key: "rzp_test_nGsJwTHHc6fIrn",
              name: name,
              email: email,
              // orderId: orderId,
            );

          }
        },
        child: Text(
          buyText,
          style: TextStyle(color: isRecommended ? Colors.white : const Color(0xff369CBC)),
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

  void showTestEndedDialog(BuildContext context,bool paymentStatus) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: paymentStatus ?const Text('Payment Successful'):const Text('Payment Failed'),
          content:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              paymentStatus
              ?const Text('Thank You For Buying Our Subscription')
            :const Text('Thank You For showing interest in our Subscription, Please try again'),

            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                GoRouter.of(context).go('/home');
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

}
