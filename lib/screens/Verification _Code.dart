import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Create_New_Password.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    // Create controllers and focus nodes for input boxes
    final List<TextEditingController> controllers =
    List.generate(4, (index) => TextEditingController());
    final List<FocusNode> focusNodes =
    List.generate(4, (index) => FocusNode());

    // Function to shift focus between input boxes
    void handleInput(String value, int index) {
      if (value.isNotEmpty && index < 3) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else if (value.isEmpty && index > 0) {
        FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 100),
            Text(
              'Verification  Code!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF001B5E),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "We sent you a verification code to your phone number.",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 40),

            // Input boxes for the verification code
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: focusNodes[index].hasFocus
                              ? Colors.blue
                              : Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                      ),
                      onChanged: (value) => handleInput(value, index),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 50),

            // Resend Code Option
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn’t receive any code? "),
                GestureDetector(
                  onTap: () {
                    // Show a message when resending code
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Code resent successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  child: Text(
                    'Resend another code',
                    style: TextStyle(
                      color: Color(0xFF113E8C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 110),

            // Verify Button
            Center(
              child: SizedBox(
                width: 140,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    // Collect the entered code
                    String enteredCode = controllers
                        .map((controller) => controller.text)
                        .join();

                    // Check if all fields are filled
                    if (enteredCode.length < 4) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Please enter the full verification code!'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } else {
                      // Navigate to the next page if the code is complete
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateNewPassword()),
                      );
                      print('Entered Code: $enteredCode');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF001B5E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Verify',
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
