import 'package:flutter/material.dart';

class RightRow extends StatelessWidget {
  const RightRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Container(
        height: MediaQuery.of(context).size.height -50,
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.black.withOpacity(0.4)),right: BorderSide(color: Colors.black.withOpacity(0.4)),bottom: BorderSide(color: Colors.black.withOpacity(0.4)))
        ),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              children: [
                const SizedBox(width:10),
                Image.asset("assets/images/logo.png",width: 125,height: 125,),
                const SizedBox(width: 10,),
                const Text("John Smith",style: TextStyle(fontSize: 22),)
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(2)
                    ))
                ),
                  onPressed: (){},
                  child: const Text("Submit",style: TextStyle(color: Colors.white),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}