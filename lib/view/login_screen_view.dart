import 'package:ailav/common/break_common.dart';
import 'package:ailav/common/textfield_commoner.dart';
import 'package:ailav/view/forget_password_view.dart';
import 'package:ailav/view/register_screen_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

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
                        "Let's Sing you in !",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Break(50),
                      const Textfield(
                        obscureText: false,
                        text: "Username",
                      ),
                      Break(16),
                      const Textfield(
                        obscureText: true,
                        text: "Password",
                      ),
                      Break(10), // Space before forgot password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                      Break(10),
                      ElevatedButton(
                        onPressed: () {
                          // Handle login logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(
                              0, 122, 255, 100), // Button color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15), // Bigger button
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30), // Rounded button
                          ),
                        ),
                        child: const Text(
                          'Login',
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
                  bottom: 20.0), // Push "Not a user?" to the bottom
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Not a user? ',
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Register',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreenView(),
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
