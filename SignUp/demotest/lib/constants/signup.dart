import 'package:flutter/material.dart';
// import 'package:signup/reusable_widgets/reusable_widget.dart';
// import 'package:signup/utils/color_utils.dart';

import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';

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
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/logo_transparent.png"),
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
                  onPressed: () {
                    // TODO: Implement sign-up logic here
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
