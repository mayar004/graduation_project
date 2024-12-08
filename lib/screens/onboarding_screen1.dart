import 'package:flutter/material.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFBFCFF),
        body:  Column(
            children: [
              SizedBox(height:40),

              Image.asset(
                'assets/images/welcome.png',
                height: 360,
                width: double.maxFinite,
              ),
              Text('Welcome To  ',

                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontSize: 37,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF023C5E),
                  ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    'CareMate!',
                    style: TextStyle(
                      fontFamily: 'Kanit',
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      color: Color(
                          0xFF023C5E), // Correct color format (no alpha needed)
                    ),
                  ),
                  Text(
                    '👋',
                    style: TextStyle(
                        fontFamily: 'Kanit',
                        fontSize: 34,
                        color: Colors.orange
                      // Correct color format (no alpha needed)
                    ),
                  ),
                ],
              ),
              SizedBox(height:40),
              Text(

                "Track blood pressure, manage medications and monitor heart .",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 27,
                  fontWeight: FontWeight.bold,

                  color: Colors.black45,
                ),
              ),

              SizedBox(height:10),


            ],
          ),
        );
  }
}