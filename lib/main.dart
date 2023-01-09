import 'dart:async';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'info.dart';

void main() {
  runApp(
      MaterialApp(
    debugShowCheckedModeBanner: false,
   routes:
    {
      '/' : (context) => const SplashScreen(),
      '1' : (context) => Home(),
    },
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState()
  {
    super.initState();
    Splash();
  }
  Splash(){
    Timer(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context,'1');
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Image(
              image: AssetImage('assets/myimages/splashlogo.png'),
              height: 400,
              width: 400,
            ),
          ),
          Text("MY CONTACT DIARY", style: TextStyle(
              fontSize: 30, color: Colors.pink, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
