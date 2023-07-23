// Import necessary packages and files
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constants/signin.dart';


// Main function, entry point of the application
void main() async {
  WidgetsFlutterBinding.ensureInitialized();     // Ensure Flutter bindings are initialized
  await Firebase.initializeApp();   // Initialize Firebase services asynchronously
  runApp(const MyApp());    // Run the main application, which is a StatefulWidget (MyApp)
}


// MyApp class, a StatelessWidget, representing the root of the application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLuttr Demo',   // Set the application title
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,   // Set the primary color swatch for the theme
      ),
      home: const SignInScreen(),   // Set the initial screen to the SignInScreen
    );
  }
}

