import 'package:flutter/material.dart';
import 'Verification _Code.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  // Controller to capture phone number input
  final TextEditingController _phoneController = TextEditingController();

  // Function to validate the phone number
  bool isValidPhoneNumber(String number) {
    // Regex for basic phone number validation (10-15 digits)
    final RegExp regex = RegExp(r'^[0-9]{10,15}$');
    return regex.hasMatch(number);
  }

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
                color: Color(0xFF001B5E),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Please enter your phone number and we'll send a code to reset your password.",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 55),

            // Phone number input field
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone, color: Color(0xFF001B5E)),
                hintText: 'Phone number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF001B5E)),
                ),
              ),
            ),
            SizedBox(height: 110),

            // Send Code Button
            Center(
              child: SizedBox(
                width: 140,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    // Validate the phone number
                    String phoneNumber = _phoneController.text.trim();
                    if (isValidPhoneNumber(phoneNumber)) {
                      // Navigate to the Verification Code page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerificationCode(),
                        ),
                      );
                    } else {
                      // Show error message if phone number is invalid
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Please enter a valid phone number (10-15 digits).'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF001B5E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
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
