
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/pageview.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // You can add a timer here if you want to navigate after a few seconds
    Future.delayed(Duration(seconds: 5), () {
      // Navigate to another screen after 3 seconds (for example, HomeScreen)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OnboardingScreen()), // Replace with your home screen widget
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF061A4E),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image Widget
            Image.asset(
              'assets/images/splash.png',
              height: 100,
              width: 100,
            ), // Replace with your image path

            Text(
              'CareMate', // Replace with your app name
              style: TextStyle(
                  fontSize: 34, // Font size for the text
                  fontWeight: FontWeight.bold, // Text weight
                  color: Colors.white // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}