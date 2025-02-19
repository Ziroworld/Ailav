import 'dart:io';

import 'package:ailav/app/shared_prefs/token_shared_prefs.dart';
import 'package:ailav/core/common/break_common.dart';
import 'package:ailav/features/auth/presentation/view/login_screen_view.dart';
import 'package:ailav/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreenView extends StatefulWidget {
  const ProfileScreenView({super.key});

  @override
  State<ProfileScreenView> createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreenView> {
  File? _image;

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
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _logout(BuildContext context) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final tokenPrefs = TokenSharedPrefs(sharedPreferences);

    await tokenPrefs.saveToken(''); // Clearing the token

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreenView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildProfileImage(),
            Break(10),
            const Text(
              "Hello,",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Text(
              "Rohan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Break(20),

            // My Order Section
            _buildProfileOption(Icons.shopping_bag_outlined, "My Order", () {
              profileCubit.navigateToOrder(context);
            }),

            // Management Section
            _buildSectionTitle("MANAGEMENT"),
            _buildProfileOption(Icons.person_outline, "My Information", () {
              profileCubit.navigateToMyInformation(context);
            }),

            // Support Section
            _buildSectionTitle("SUPPORT"),
            _buildProfileOption(Icons.help_outline, "Help", () {
              profileCubit.navigateToHelp(context);
            }),
            _buildProfileOption(Icons.chat_bubble_outline, "Support", () {
              profileCubit.navigateToSupport(context);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: _image != null ? FileImage(_image!) : null,
          child: _image == null
              ? const Icon(Icons.person, size: 50, color: Colors.white)
              : null,
        ),
        GestureDetector(
          onTap: () {
            _showImagePickerOptions();
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: const Icon(Icons.camera_alt, size: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  checkCameraPermission();
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.camera),
                label: const Text('Camera'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.image),
                label: const Text('Gallery'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 5),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 18),
          onTap: onTap,
        ),
        const Divider(indent: 20, endIndent: 20),
      ],
    );
  }
}
