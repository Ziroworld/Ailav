import 'package:ailav/core/common/break_common.dart';
import 'package:ailav/core/common/logo_common.dart';
import 'package:ailav/core/common/textfield_commoner.dart';
import 'package:ailav/model/auth_model.dart';
import 'package:ailav/view/admin/admin_dashboard_view.dart';
import 'package:ailav/view/client/client_homepage_view.dart';
import 'package:ailav/features/auth/presentation/view/register_screen_view.dart';
import 'package:ailav/view/verify_email_view.dart';
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
                    children: [
                      Transform.translate(
                        offset:
                            const Offset(0, -50), // Move it 50 pixels higher
                        child: const Logo(height: 150),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Let's Sign you in !",
                            style: TextStyle(
                              fontSize: 35,
                              fontFamily: 'Poppins bold',
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
                                        const VerifyEmailView(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Break(10),
                          ElevatedButton(
                            onPressed: _performLogin,
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white, // Ensure text is white
                              ),
                            ),
                          ),
                        ],
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
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
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
