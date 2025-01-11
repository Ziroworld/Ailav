import 'package:ailav/app/di/di.dart';
import 'package:ailav/core/common/break_common.dart';
import 'package:ailav/core/common/logo_common.dart';
import 'package:ailav/core/common/textfield_commoner.dart';
import 'package:ailav/features/auth/presentation/view/register_screen_view.dart';
import 'package:ailav/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:ailav/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:ailav/features/change_password/presentation/view/verify_email_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenView extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
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
                          offset: const Offset(0, -50),
                          child: const Logo(height: 150),
                        ),
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
                        Break(10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              context.read<LoginBloc>().add(
                                NavigateForgotPasswordEvent(
                                  onNavigate: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const VerifyEmailView(),
                                      ),
                                    );
                                  },
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
                        BlocConsumer<LoginBloc, LoginState>(
                          listener: (context, state) {
                            if (!state.isSuccess && !state.isLoading) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Invalid username or password')),
                              );
                            }
                          },
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: state.isLoading
                                  ? null
                                  : () {
                                      context.read<LoginBloc>().add(
                                            LoginSubmittedEvent(
                                              username: _usernameController.text
                                                  .trim(),
                                              password: _passwordController.text
                                                  .trim(),
                                              onSuccess: (destination) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          destination),
                                                );
                                              },
                                              onFailure: (errorMessage) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                      content:
                                                          Text(errorMessage)),
                                                );
                                              },
                                            ),
                                          );
                                    },
                              child: state.isLoading
                                  ? const CircularProgressIndicator()
                                  : const Text('Login'),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
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
                                builder: (context) => BlocProvider(
                                  create: (_) => getIt<RegisterBloc>(),
                                  child: RegisterScreenView(),
                                ),
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
    );
  }
}
