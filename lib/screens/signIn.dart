import 'package:flutter/material.dart';
import 'package:seed_snap_app/reusable_widgets/reusable_widget.dart';
import 'package:seed_snap_app/screens/home_screen.dart';
import 'package:seed_snap_app/utils/color_utils.dart';
// Importing the Sign up Screen
import 'package:firebase_auth/firebase_auth.dart';

import 'SignUp.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  bool _isLoading = false;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("c2edc9"),
              hexStringToColor("3a8a46"),
              hexStringToColor("013309"),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
              child: Column(
                children: <Widget>[
                  logoWidget("assets/logo_transparent.png"),
                  SizedBox(
                    height: 30,
                  ),
                  reusableTextField("Enter UserName", Icons.person_outline, false, _emailTextController),
                  SizedBox(
                    height: 30,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    child: Text("If you Don't have an account Sign Up"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                    },
                  ),
                  ElevatedButton(
                    child: _isLoading ? CircularProgressIndicator() : Text("Sign In"),
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });

                      try {
                        final userCredential = await _auth.signInWithEmailAndPassword(
                          email: _emailTextController.text.trim(),
                          password: _passwordTextController.text.trim(),
                        );

                        if (userCredential.user != null) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('No user found for that email')));
                        } else if (e.code == 'wrong-password') {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Wrong password provided')));
                        }
                      } catch (e) {
                        print(e);
                      } finally {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
