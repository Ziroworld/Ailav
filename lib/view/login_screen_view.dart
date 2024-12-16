import 'package:ailav/common/break_common.dart';
import 'package:ailav/common/textfield_commoner.dart';
import 'package:ailav/model/auth_model.dart';
import 'package:ailav/view/admin/admin_dashboard_view.dart';
import 'package:ailav/view/client/client_homepage_view.dart';
import 'package:ailav/view/forget_password_view.dart';
import 'package:ailav/view/register_screen_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _performLogin() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    final role = AuthModel.authenticate(username, password);

    if (role == 'admin') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AdminDashboardView()),
      );
    } else if (role == 'customer') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ClientHomepageView()),
      );
    } else {
      // Show error if authentication fails
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

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
                      Textfield(
                        controller: _usernameController,
                        obscureText: false,
                        text: "Username",
                        keyboardType: TextInputType.text,
                      ),
                      Break(16),
                      Textfield(
                        controller: _passwordController,
                        obscureText: true,
                        text: "Password",
                        keyboardType: TextInputType.visiblePassword,
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
                        onPressed: _performLogin,
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
