import 'package:ailav/core/common/break_common.dart';
import 'package:ailav/core/common/logo_common.dart'; // Assuming this is where Logo is imported
import 'package:ailav/core/common/textfield_commoner.dart';
import 'package:ailav/features/auth/presentation/view/login_screen_view.dart';
import 'package:ailav/features/terms_and_condition/presentation/view/terms_and_condition_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
                      // Logo Image with custom alignment
                      Transform.translate(
                        offset: const Offset(0, -00), // Adjust image position
                        child: const Logo(height: 150),
                      ),
                      Break(20), // Space below the logo

                      const Text(
                        'Setup your Account Details',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Break(10), // Space below the title

                      const Text(
                        'Please enter the correct details below.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Break(40), // Space below the small text

                      const Textfield(
                        obscureText: false,
                        text: 'Username',
                      ),
                      Break(20), // Space between fields
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
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const TermsAndConditionView(),
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
                      Break(20), // Space before "or sign in with"

                      // "or sign in with" text
                      const Text(
                        'or sign in with',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      Break(20), // Space below the text

                      // Google Sign-In Button
                      ElevatedButton(
                        onPressed: () {
                          // Handle Google sign-in logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // White button
                          padding: EdgeInsets.zero, // Remove padding
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30), // Rounded button
                          ),
                          minimumSize: const Size(
                              40, 40), // Adjust size to match the logo
                        ),
                        child: Image.asset(
                          'assets/images/Google_logo.png', // Google logo
                          height: 30,
                          width: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom:
                                20.0), // Push "Already a user?" to the bottom
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Already have an account? ',
                            style: const TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'Sign In',
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreenView(),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
