import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF001B5E),              ),
            ),
            SizedBox(height: 10),
            Text(
              "Please enter your phone number and we'll send a code to reset your password.",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 55),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone, color: Color(0xFF001B5E),),
                hintText: 'Phone number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF001B5E),),
                ),
              ),
            ),
            SizedBox(height: 110),
            Center(
              child: SizedBox(
                width: 140,
                height: 45,

                child: ElevatedButton(
                  onPressed: () {
                    // Handle sending the code
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF001B5E),
                    //Color : Color(0xFF001A72), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                   // padding: EdgeInsets.symmetric( vertical: 16),
                  ),

                  child: Text(
                    'Send Code',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ),
            ),
          ],
        ),
      ),

    );

  }
}