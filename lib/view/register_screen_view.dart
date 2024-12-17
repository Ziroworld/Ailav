import 'package:ailav/view/login_screen_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ailav/core/common/break_common.dart';
import 'package:ailav/core/common/textfield_commoner.dart';

class RegisterScreenView extends StatelessWidget {
  const RegisterScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Lets Register Account',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Break(40), // Space below the title
                      const Textfield(
                        obscureText: false,
                        text: 'Username',
                      ),
                      Break(20), // Space between fields
                      const Textfield(
                        obscureText: false,
                        text: 'First Name',
                      ),
                      Break(20),
                      const Textfield(
                        obscureText: false,
                        text: 'Last Name',
                      ),
                      Break(20),
                      const Textfield(
                        obscureText: false,
                        text: 'Email',
                      ),
                      Break(20),
                      const Textfield(
                        obscureText: false,
                        text: 'Phone Number',
                      ),
                      Break(20),
                      const Textfield(
                        obscureText: true,
                        text: 'Password',
                      ),
                      Break(20),
                      const Textfield(
                        obscureText: true,
                        text: 'Confirm Password',
                      ),
                      Break(20),
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {
                              // Handle checkbox logic
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                text: 'I agree to the ',
                                style: const TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: 'terms and conditions',
                                    style: const TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Handle terms and conditions tap
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Break(30),
                      ElevatedButton(
                        onPressed: () {
                          // Handle register logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(
                              0, 122, 255, 100), // Button color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30), // Rounded button
                          ),
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 20.0), // Push "Already a user?" to the bottom
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Already have a account? ',
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Sign In',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreenView(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
