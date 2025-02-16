import 'package:ailav/features/setting/presentation/view_model/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SettingScreenView extends StatelessWidget {
  const SettingScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final settingCubit = context.read<SettingCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Setting',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildListTile(Icons.feedback_outlined, "Feedback", () {}),
            _buildListTile(Icons.question_answer_outlined, "FAQ’s", () {}),
            _buildListTile(Icons.info_outline, "About Ailav", () {}),
            _buildListTile(Icons.attach_money_outlined, "Delivery Charge", () {}),
            _buildListTile(
                Icons.description_outlined, "Terms and Conditions", () {
              settingCubit.navigateToTermsPage(context);}),

            _buildListTile(Icons.privacy_tip_outlined, "Privacy Policy", () {}),
            const Spacer(),
            _buildSocialIcons(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 18),
          onTap: onTap,
        ),
        const Divider(indent: 20, endIndent: 20),
      ],
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialIcon(Icons.facebook),
        const SizedBox(width: 20),
        _socialIcon(Icons.camera_alt), // Instagram (custom icon)
      ],
    );
  }

  Widget _socialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade200,
      ),
      child: Icon(icon, size: 24),
    );
  }
}
