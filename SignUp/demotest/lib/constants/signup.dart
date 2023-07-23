// import 'package:SignUp/constants/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin/constants/home.dart';
import 'package:flutter/material.dart';
import '../reusable_widgets/reusable_widget.dart';
import '../utils/color_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
   TextEditingController _emailTextController = TextEditingController();
   TextEditingController _passwordTextController = TextEditingController();
   TextEditingController _mobileNumberTextController = TextEditingController();
   TextEditingController _addressTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation:0,
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
                // logoWidget("assets/images/logo_transparent.png"),
                const SizedBox(height: 20,
                ),
                reusableTextField("Enter Email", Icons.email_outlined, false, _emailTextController),
                const SizedBox(height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
                const SizedBox(height: 20,
                ),
                reusableTextField("Enter Mobile Number", Icons.phone, false, _mobileNumberTextController),
                const SizedBox(height: 20,
                ),
                reusableTextField("Enter Address", Icons.location_on_outlined, false, _addressTextController),
                const SizedBox(height: 20,
                ),
                firebaseButton(context, "Sign Up", (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text, 
                  password: _passwordTextController.text)
                  .then((value){
                    print("Created New Account");
                    Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));

                  }).onError((error, stackTrace){
                    print("Error ${error.toString()}");
                  });
                })
                // ElevatedButton(
                //   onPressed: () {
                //     // TODO: Implement sign-up logic here
                //   },
                //   child: Text("Sign Up"),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class FirebaseAuth {
//   static var instance;
// }
