import 'package:ailav/core/common/break_common.dart';
import 'package:flutter/material.dart';

class ProfileScreenView extends StatelessWidget {
  const ProfileScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              'Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Break(10),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed malesuada, diam ac ultricies tempus, neque velit consectetur neque, ac tincidunt lectus nunc vel velit. Donec quis fermentum lectus, id fermentum neque. Donec non ligula id velit consectetur ullamcorper. Sed viverra, arcu non consectetur tristique, neque felis sagittis neque, at ultricies ligula felis non nisi. Sed pharetra, dui vitae tristique finibus, turpis nunc dictum enim, et vulputate lectus neque id nunc.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
