import 'dart:io';

import 'package:ailav/core/common/break_common.dart';
import 'package:ailav/features/auth/presentation/view/login_screen_view.dart';
import 'package:ailav/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class RegisterScreenView extends StatefulWidget {
  const RegisterScreenView({super.key});

  @override
  State<RegisterScreenView> createState() => _RegisterScreenViewState();
}

class _RegisterScreenViewState extends State<RegisterScreenView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _key = GlobalKey<FormState>();

  File? _image;

  // Check for camera permission
  Future<void> checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
          // Send image to server
          // context.read<RegisterBloc>().add(
          // UploadImage(file: _image!),
          // );
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Camera'),
              onTap: () {
                _pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Gallery'),
              onTap: () {
                _pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
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
                      Break(60),
                      // Profile Picture Picker
                      GestureDetector(
                        onTap: () => _showImagePickerOptions(context),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: _image != null
                              ? FileImage(_image!)
                              : const AssetImage(
                                      'assets/images/profile_placeholder.png')
                                  as ImageProvider,
                          child: _image == null
                              ? const Icon(Icons.camera_alt,
                                  size: 40, color: Colors.white)
                              : null,
                        ),
                      ),
                      Break(20),
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
                        controller: _nameController,
                        decoration: const InputDecoration(labelText: 'Name'),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText: 'Age'),
                      ),
                      const SizedBox(height: 20),
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
                                child:
                                    Text('I agree to the terms and conditions'),
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
                                            name: _nameController.text.trim(),
                                            age: _ageController.text.trim(),
                                            username:
                                                _usernameController.text.trim(),
                                            email: _emailController.text.trim(),
                                            phoneNumber:
                                                _phoneController.text.trim(),
                                            password:
                                                _passwordController.text.trim(),
                                            confirmPassword:
                                                _confirmPasswordController.text
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
                                            context: context,
                                          ),
                                        );
                                  },
                            child: state.isLoading
                                ? const CircularProgressIndicator()
                                : const Text('Register'),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'or sign in with',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Handle Google sign-in logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: const Size(40, 40),
                        ),
                        child: Image.asset(
                          'assets/images/Google_logo.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
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
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreenView(),
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
