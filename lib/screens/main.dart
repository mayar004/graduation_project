import 'package:flutter/material.dart';
import 'package:graduation_project/screens/splash_screen.dart';

void main() {
  runApp(Health());
}

class Health extends StatelessWidget {
  const Health({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
