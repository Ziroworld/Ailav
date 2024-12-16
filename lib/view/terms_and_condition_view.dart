import 'package:ailav/common/break_common.dart';
import 'package:flutter/material.dart';

class TermsAndConditionView extends StatelessWidget {
  const TermsAndConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Terms and Conditions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Break(20),
            const Text(
              'demo',
              style: TextStyle(fontSize: 16),
            ),
            Break(20),
            TextButton(
              onPressed: () {
                // Navigate to another screen
              },
              child: const Text('Accept'),
            ),
          ],
        ),
      ),
    );
  }
}
