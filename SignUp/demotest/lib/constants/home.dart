// Import necessary packages and files
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin/constants/signin.dart';
import 'package:flutter/material.dart';

// Create a StatefulWidget for the HomeScreen
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// Create the corresponding State class for the HomeScreen
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Logout"),  // Display "Logout" text on the button
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {  // When the button is pressed, sign out the user using Firebase Authentication
              print("Signed Out");    // Print a message to indicate successful sign out
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignInScreen()));   // After signing out, navigate back to the SignInScreen
            }); 
          },
        )
      ),
    );
  }
}