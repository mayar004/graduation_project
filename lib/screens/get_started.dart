import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'log_in_screen.dart';
import 'sign_up_screen.dart';
import 'Home_page.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});
  //google authentication
  Future<User?> signInWithGoogle() async {
    // Start the Google Sign-In process
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      // User canceled the sign-in process
      return null;
    }

    // Get Google authentication details
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential for Firebase
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in with the credential
    UserCredential userCredential =
    await FirebaseAuth.instance.signInWithCredential(credential);

    return userCredential.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFBFCFF),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 60),
              Image.asset(
                'assets/images/img_1.png',
                width: 300,
                height: 200,
              ),
              Text('Let’s you in!',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),

              // Continue with Facebook button
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.facebook, color: Colors.blue),
                label: Text(
                  'Continue with Facebook',
                  style: TextStyle(color: Colors.black),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(20, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Continue with Google button
              OutlinedButton.icon(
                onPressed: () async {
                  User? user = await signInWithGoogle();
                  if (user != null) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        'Homepage', (Route<dynamic> route) => false);
                  }
                },
                icon: Image.asset(
                  'assets/images/gmail.png', // Replace with your Google icon path
                  height: 24,
                ),
                label: Text(
                  'Continue with Google',
                  style: TextStyle(color: Colors.black),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(100, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Continue with Apple button
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.apple, color: Colors.black),
                label: Text(
                  'Continue with Apple',
                  style: TextStyle(color: Colors.black),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(220, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                  indent: 35,


                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("or"),
              ),
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                  endIndent: 35,

                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogInScreen()),
                  );
                },
                child: const Text(
                  'Log in with Password',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                  style:  ElevatedButton.styleFrom(
                      minimumSize: Size(50, 50),
                      backgroundColor: Color(0xFF113E8C),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))

              ),

          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don’t have an account? "),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              );

            },

            child: Text(
              'Sign up',
              style: TextStyle(
                  color: Color(0xFF113E8C),
                  fontWeight: FontWeight.bold,
              ),


          ),
          )
        ],

          )] ),
        )
    );
  }
}