import 'package:flutter/material.dart';

import 'Congrats.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  // Controllers for password fields
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Password visibility states
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Validation and error messages
  String? _errorMessage;

  // Function to validate passwords
  void _validatePasswords() {
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password.length < 8) {
      setState(() {
        _errorMessage = 'Password must be at least 8 characters.';
      });
    } else if (password != confirmPassword) {
      setState(() {
        _errorMessage = 'Both passwords must match.';
      });
    } else {
      setState(() {
        _errorMessage = null;
      });
      // Navigate to Congrats screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Congrats()),
      );
    }
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
            // Title
            Text(
              'Create New Password',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF001B5E),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Your new password must be different from previous used passwords.",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 30),

            // Password Field
            Text(
              'Password',
              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF001B5E)),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Enter new password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Password must be at least 8 characters.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 20),

            // Confirm Password Field
            Text(
              'Confirm Password',
              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF001B5E)),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _confirmPasswordController,
              obscureText: !_isConfirmPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Re-enter your password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Both passwords must match.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(height: 20),

            // Error Message Display
            if (_errorMessage != null)
              Center(
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),
            SizedBox(height: 40),

            // Reset Password Button
            Center(
              child: SizedBox(
                width: 180,
                height: 45,
                child: ElevatedButton(
                  onPressed: _validatePasswords,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF001B5E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Reset Password',
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