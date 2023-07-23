// Import necessary packages and files
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin/constants/home.dart';
import 'package:flutter/material.dart';
import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';

// Create a StatefulWidget for the ResetPassword screen
class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

// Create the corresponding State class for the ResetPassword screen
class _ResetPasswordState extends State<ResetPassword> {
   TextEditingController _emailTextController = TextEditingController();   // Controller for the email text field
   
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,  // Set the app bar's background color as transparent
        elevation:0,    // Remove app bar's shadow
        title: const Text(
          "Reset Password",
          style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("28B463"),   // Define gradient colors
              hexStringToColor("239B56"),
              hexStringToColor("58D68D"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20,120,20,0),  // Set padding for the content
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10,
                ),
                reusableTextField("Enter Email", Icons.email_outlined, false, _emailTextController),  // Reusable text field for entering email
                const SizedBox(height: 20,
                ),
               firebaseButton(context, "Reset Password", (){
                // Firebase button to reset the user's password
                FirebaseAuth.instance
                .sendPasswordResetEmail(email: _emailTextController.text)
                .then((value) => Navigator.of(context).pop()); // Send password reset email and pop the current screen
               })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

