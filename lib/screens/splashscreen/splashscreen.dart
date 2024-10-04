import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodgo/screens/homescreen/home.dart';
import 'package:foodgo/screens/signinscreen/signinscreen.dart';

class Splashscreen extends StatefulWidget{
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    // Initialize the timer in initState
    Timer(Duration(seconds: 3), () {
      // Navigate to another screen after 3 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Signinscreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
      backgroundColor: Color(0xFFEF2A39),
          body: Stack(
            children: [
              // text
              Positioned(
                top: 250,  // Set distance from the top
                left: 0,
                right: 0,  // Center horizontally
                child: Center(
                  child: Text('Foodge',style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),

              // image 1
              Positioned(
                bottom: -20,
                left: -25,
                child: Container(
                  width: 246,
                  height: 288,
                  child: Center(
                    child: Image.asset('assets/images/img.png',scale: 2,),
                  ),
                ),
              ),

              // image 2
              Positioned(
                bottom: -20,
                left: 90,
                child: Container(
                  width: 202,
                  height: 202,
                  child: Center(
                    child: Image.asset('assets/images/img_1.png',scale: 2,),
                  ),
                ),
              ),
            ],
          ),
    ),
    );
  }
}