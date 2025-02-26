import 'dart:math';

import 'package:flutter/material.dart';

class ViewOrder extends StatelessWidget {
  const ViewOrder({super.key});

  String _generateRandomOrderId() {
    final Random random = Random();
    return List.generate(16, (index) => random.nextInt(10)).join();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> orders = [
      {"status": "Completed", "location": "Kathmandu, Nepal"},
      {"status": "In Progress", "location": "Pokhara, Nepal"},
      {"status": "Completed", "location": "Lalitpur, Nepal"},
      {"status": "In Progress", "location": "Bhaktapur, Nepal"},
      {"status": "Completed", "location": "Chitwan, Nepal"},
      {"status": "In Progress", "location": "Biratnagar, Nepal"},
      {"status": "Completed", "location": "Dharan, Nepal"},
      {"status": "In Progress", "location": "Butwal, Nepal"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Orders',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          final orderId = _generateRandomOrderId();

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              title: Text(
                "Order ID: $orderId",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                order["location"],
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              trailing: const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 24,
              ),
            ),
          );
        },
      ),
    );
  }
}
