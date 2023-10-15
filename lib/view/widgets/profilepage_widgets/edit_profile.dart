import 'package:flutter/material.dart';

class EditProfileDialog extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  EditProfileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(dialogBackgroundColor: Colors.white),
      child: AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),  // Adjust this value to decrease/increase rounded corners
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Edit Profile',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
            IconButton(splashRadius: 22,onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.close,size: 24,color: Colors.grey,))
          ],
        ),
        // contentPadding: EdgeInsets.all(0),
        content: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 325),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Upload your image",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 16),),
                SizedBox(height: 10),
                Image.asset(
                  "assets/images/image_upload.png",
                  width: 72,
                  height: 72,
                ),
                SizedBox(height: 16),
                Text("Name",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 16),),
                SizedBox(height: 5),

                Container(
                  height: 40,
                  child: Center(
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                        hintText: 'Enter your name',
                        border: OutlineInputBorder(),  // Add this line
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text("Email id",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 16),),
                SizedBox(height: 5),
                Container(
                  height: 40,
                  child: Center(
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(),  // Add this line
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                saveButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget saveButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(const Color(0xff369CBC)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff369CBC)),
              borderRadius: BorderRadius.circular(5)))),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text(
        'Save',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
