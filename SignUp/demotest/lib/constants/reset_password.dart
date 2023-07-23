// import 'package:SignUp/constants/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin/constants/home.dart';
import 'package:flutter/material.dart';
import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
   TextEditingController _emailTextController = TextEditingController();
   
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation:0,
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
              hexStringToColor("28B463"),
              hexStringToColor("239B56"),
              hexStringToColor("58D68D"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20,120,20,0),
            child: Column(
              children: <Widget>[
                // logoWidget("assets/images/logo_transparent.png"),
                const SizedBox(height: 10,
                ),
                reusableTextField("Enter Email", Icons.email_outlined, false, _emailTextController),
                const SizedBox(height: 20,
                ),
               firebaseButton(context, "Reset Password", (){
                FirebaseAuth.instance
                .sendPasswordResetEmail(email: _emailTextController.text)
                .then((value) => Navigator.of(context).pop());

               })
      
              ],
            ),
          ),
        ),
      ),
    );
  }
}

