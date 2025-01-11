import 'package:ailav/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenView extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  RegisterScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterBloc(),
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
                        const Text(
                          'Setup your Account Details',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _usernameController,
                          decoration:
                              const InputDecoration(labelText: 'Username'),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(labelText: 'Email'),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _phoneController,
                          decoration:
                              const InputDecoration(labelText: 'Phone Number'),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: 'Confirm Password'),
                        ),
                        const SizedBox(height: 20),
                        BlocBuilder<RegisterBloc, RegisterState>(
                          builder: (context, state) {
                            return Row(
                              children: [
                                Checkbox(
                                  value: state.isTermsAccepted,
                                  onChanged: (value) {
                                    context.read<RegisterBloc>().add(
                                          TermsAcceptedEvent(
                                              isAccepted: value ?? false),
                                        );
                                  },
                                ),
                                const Expanded(
                                  child: Text(
                                      'I agree to the terms and conditions'),
                                ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 30),
                        BlocConsumer<RegisterBloc, RegisterState>(
                          listener: (context, state) {
                            if (state.isSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Registration successful!')),
                              );
                              Navigator.pop(context);
                            }
                          },
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: state.isLoading
                                  ? null
                                  : () {
                                      context.read<RegisterBloc>().add(
                                            RegisterSubmittedEvent(
                                              username: _usernameController.text
                                                  .trim(),
                                              email:
                                                  _emailController.text.trim(),
                                              phoneNumber:
                                                  _phoneController.text.trim(),
                                              password: _passwordController.text
                                                  .trim(),
                                              confirmPassword:
                                                  _confirmPasswordController
                                                      .text
                                                      .trim(),
                                              onSuccess: () {},
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
                                  : const Text('Register'),
                            );
                          },
                        ),
                      ],
                    ),
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
