import 'package:flutter/material.dart';

class OnboardingScreenThree extends StatelessWidget {
  const OnboardingScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFBFCFF),
        body: Center(
          child: Column(children: [
            SizedBox(height: 75),
            Image.asset(
              'assets/images/bell.png',
              height: 300,
              width: double.maxFinite,
            ),

            SizedBox(height: 50),
            Padding
              ( padding: EdgeInsets.only(left: 10) ,
                child: Text('Get Notified Instantly for reminders, appointments, and updates.',
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 31,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF023C5E),
                  ),),



              ),


          ]),
        ));
  }
}