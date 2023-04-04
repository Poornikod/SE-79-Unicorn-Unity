import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seed_snap_app/screens/SignUp.dart';
import 'package:seed_snap_app/screens/signIn.dart';

import 'loginScreen.dart';


class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}): super(key:key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds:5), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)
      => SignInScreen()));
    });
  }

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      backgroundColor: Colors.black,
      body:SafeArea(
        child:Center(
          child:Image(
            height:400,
            image:AssetImage('assets/logo_dark.png'),
          ),
        ),
      ),
    );
  }
}