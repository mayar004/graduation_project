import 'package:flutter/material.dart';

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFBFCFF),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 90),
              Image.asset(
                'assets/images/doctor.png',
                height: 300,
                width: double.maxFinite,
              ),

              SizedBox(height:39),

              Padding
                ( padding: EdgeInsets.only(left: 23) ,
                   child: Text('Connect with your healthcare provider anytime, anywhere.',
                style: TextStyle(
                  fontFamily: 'Kanit',
                  fontSize: 31,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF023C5E),
                ),)),








            ],
          ),
        ));
  }
}