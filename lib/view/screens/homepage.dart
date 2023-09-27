import 'package:flutter/material.dart';
import 'package:typingtest/view/screens/test_screen.dart';
import 'package:typingtest/view/widgets/homepage_widgets/nav_bar.dart';

class HOMEPAGE extends StatelessWidget {
  const HOMEPAGE({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            const SizedBox(height: 200,),
            Center(child: SizedBox(
              height: 55,
              child: ElevatedButton(
                style: ButtonStyle(elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.purple),borderRadius: BorderRadius.circular(10)
                    ))),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TestScreen()));
                },
                child: const Text('Sample Test', style: TextStyle(color: Colors.black),),
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
