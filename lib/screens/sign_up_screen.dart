import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'log_in_screen.dart';



class SignUpScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001B5E), // خلفية زرقاء داكنة
      body: Column(
        children: [

          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, top: 60.0 ),
              child: Text(
                "Sign up",
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
                color: Colors.white, // خلفية بيضاء
                borderRadius: BorderRadius.all(Radius.circular(45.0)), // حواف مستديرة
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hi !",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF001B5E),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Create a new account to continue",
                    style: TextStyle(
                      fontSize: 19,
                      color: Color(0xFF000000),
                    ),
                  ),
                  const SizedBox(height: 24),

                  TextFormField(
                    decoration: InputDecoration(labelText: 'First Name',
                        prefixIcon: const Icon(Icons.person , color: Color(0xFF001B5E)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                    ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Last Name',
                      prefixIcon: const Icon(Icons.person , color: Color(0xFF001B5E) ),
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                  ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email, color: Color(0xFF001B5E)),
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock, color: Color(0xFF001B5E)),
                      labelText: 'Password',
                      helperText: 'Password must be at least 8 characters',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),

                  const SizedBox(height: 80),
                  Center(
                    child: SizedBox(
                      width: 140,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () async{
                          try {
                            final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: emailController.text ,
                              password: passwordController.text,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LogInScreen()),
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              print('The account already exists for that email.');
                            }
                          } catch (e) {
                            print(e);
                          }
                          // إضافة وظيفة لزر تسجيل الدخول
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF001B5E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          "Sign up",
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
