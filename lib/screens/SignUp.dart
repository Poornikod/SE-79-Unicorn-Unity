import 'package:flutter/material.dart';
import 'package:seed_snap_app/reusable_widgets/reusable_widget.dart';
import 'package:seed_snap_app/screens/home_screen.dart';
import 'package:seed_snap_app/utils/color_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _mobileNumberTextController = TextEditingController();
  final TextEditingController _addressTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("c2edc9"),
              hexStringToColor("3a8a46"),
              hexStringToColor("013309"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/logo_transparent.png"),
                SizedBox(height: 30),
                reusableTextField("Enter Email", Icons.email_outlined, false, _emailTextController),
                SizedBox(height: 30),
                reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
                SizedBox(height: 30),
                reusableTextField("Enter Mobile Number", Icons.phone, false, _mobileNumberTextController),
                SizedBox(height: 30),
                reusableTextField("Enter Address", Icons.location_on_outlined, false, _addressTextController),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    final email = _emailTextController.text.trim();
                    final password = _passwordTextController.text.trim();
                    final mobileNumber = _mobileNumberTextController.text.trim();
                    final address = _addressTextController.text.trim();

                    // Validate the email format
                    if (!isEmailValid(email)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please enter a valid email address.'),
                        ),
                      );
                      return;
                    }

                    try {
                      // Create a new user with the entered email and password
                      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      // Optionally, update the user's profile information
                      User? user = userCredential.user;
                      if (user != null) {
                        await user.updateProfile(displayName: 'Your Display Name');

                      }

                      // TODO: Save additional user information to Firestore or Realtime Database

                      // Navigate to the home screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );

                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('The password provided is too weak.'),
                          ),
                        );
                      } else if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('The account already exists for that email.'),
                          ),
                        );
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text("Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

bool isEmailValid(String email) {
  // Regular expression to check if the email matches a valid format
  // This is a basic regular expression and you can modify it to suit your needs
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}
