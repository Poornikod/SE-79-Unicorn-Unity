// Import necessary packages and files
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin/constants/reset_password.dart';
import 'package:flutter/material.dart';
import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';
import 'home.dart';
import 'signup.dart'; // Importing the Sign up Screen



class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [          //background color
              hexStringToColor("28B463"),
              hexStringToColor("239B56"),
              hexStringToColor("58D68D")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: <Widget>[
                  logoWidget("assets/images/logo_transparent.png"),    // Placeholder for logo image
                  const SizedBox(
                    height: 30,
                  ),
                  reusableTextField("Enter UserName", Icons.person_outline, false, _emailTextController),     // Text field for entering username
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),     // Text field for entering password
                  const SizedBox(
                    height: 5,
                  ),
                  forgetPassword(context),    // "Forgot Password?" link
                  firebaseButton(context, "Sign In", (){    // Sign in button
                  // Function to sign in using Firebase authentication
                    FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text)
                    .then((value) {
                  // If sign-in is successful, navigate to the HomeScreen
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=> HomeScreen()));
                    }).onError((error, stackTrace) {
                  // If there's an error during sign-in, print the error message
                      print("Error ${error.toString()}");
                    }); 
                  }),
                  // "Don't have an account? Sign Up" link
                  signUpOption()
                ],
              )
          ),
        ),
      ),
    );
  }


//create function for sign up button 
  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        const Text ("Dont't have account?",
        style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        )
      ]
    );
  }


//create function for reset password option
  Widget forgetPassword(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
