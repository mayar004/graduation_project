import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Home_page.dart';


class LogInScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001B5E),
      body: Column(
        children: [

          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, top: 70.0 ),
              child: Text(
                "Log in",
                style: TextStyle(
                  fontSize:44,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // المستطيل الأبيض
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(  vertical: 40.0),
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(45.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome !",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF001B5E),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Please sign in to continue our app",
                    style: TextStyle(
                      fontSize: 19,
                      color: Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(height: 24),

                  TextField(
                    controller: emailController,  // ربط TextEditingController
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email, color: Color(0xFF001B5E)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController, // ربط TextEditingController
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock, color: Color(0xFF001B5E)),
                      labelText: 'Password',
                      helperText: 'Password must be at least 8 characters',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [

                      Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                      const Text(
                        "Remember me",
                        style: TextStyle(color: Color(0xFF77747C)),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          // إضافة وظيفة لزر "نسيت كلمة المرور"
                        },
                        child: const Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: Color(0xFF001B5E),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  Center(
                    child: SizedBox(
                      width: 140,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: emailController.text,  // استخدام .text للحصول على النص
                                password: passwordController.text );  // استخدام .text للحصول على النص
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>Homepage()),
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Homepage()),
                          );
                          // إضافة وظيفة لزر تسجيل الدخول
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF001B5E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          "Log in",
                          style: TextStyle(fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
