// Import necessary packages and files
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin/constants/home.dart';
import 'package:flutter/material.dart';
import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';

// Create a StatefulWidget for the SignUpScreen
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

// Create the corresponding State class for the SignUpScreen
class _SignUpScreenState extends State<SignUpScreen> {
   TextEditingController _emailTextController = TextEditingController();    // Controller for the email text field
   TextEditingController _passwordTextController = TextEditingController();   // Controller for the password text field
   TextEditingController _mobileNumberTextController = TextEditingController();   // Controller for the mobile number text field
   TextEditingController _addressTextController = TextEditingController();    // Controller for the address text field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,   // Extend body behind the app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,    // Set the app bar's background color as transparent
        elevation:0,    // Remove app bar's shadow
        title: const Text(
          "Sign Up",
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
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),    // Set padding for the content
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20,
                ),
                reusableTextField("Enter Email", Icons.email_outlined, false, _emailTextController),    // Reusable text field for entering email
                const SizedBox(height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),   // Reusable text field for entering password
                const SizedBox(height: 20,
                ),
                reusableTextField("Enter Mobile Number", Icons.phone, false, _mobileNumberTextController),    // Reusable text field for entering mobile number
                const SizedBox(height: 20,
                ),
                reusableTextField("Enter Address", Icons.location_on_outlined, false, _addressTextController),    // Reusable text field for entering address
                const SizedBox(height: 20,
                ),
                firebaseButton(context, "Sign Up", (){
                // Firebase button to sign up the user
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text, 
                  password: _passwordTextController.text)
                  .then((value){
                    print("Created New Account");   // Print a message to indicate successful account creation
                    Navigator.push(context,   // After signing up, navigate to the HomeScreen
                  MaterialPageRoute(builder: (context) => HomeScreen()));
                  }).onError((error, stackTrace){   // If there's an error during sign-up, print the error message
                    print("Error ${error.toString()}");
                  });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}