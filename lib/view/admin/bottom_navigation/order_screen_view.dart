import 'package:flutter/material.dart';

class OrderScreenView extends StatelessWidget {
  const OrderScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Cart Screen'),
          ],
        ),
      ),
    ));
  }
}
