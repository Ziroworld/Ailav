import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Who We Are"),
            _buildSectionDescription(
                "Established in June 2024, Ailav is a modern liquor delivery service designed to bring "
                "your favorite beverages straight to your doorstep. We are committed to providing a seamless, "
                "fast, and reliable experience for our customers."),

            _buildSectionTitle("Our Mission"),
            _buildSectionDescription(
                "Our mission is to revolutionize the way people purchase and enjoy beverages. "
                "By leveraging technology, we make ordering alcohol more convenient and hassle-free "
                "while ensuring responsible consumption."),

            _buildSectionTitle("Why Choose Us?"),
            _buildBulletPoint("🚀 Fast and reliable delivery across multiple locations."),
            _buildBulletPoint("🔒 100% secure transactions and data protection."),
            _buildBulletPoint("🍾 Wide range of products, from local to premium selections."),
            _buildBulletPoint("🛡️ Committed to responsible and legal alcohol consumption."),
            _buildBulletPoint("💡 Easy-to-use mobile app with real-time tracking."),
            
            _buildSectionTitle("Contact Us"),
            _buildSectionDescription(
                "Have questions? Need support? Reach out to us anytime! "
                "We're always here to help make your experience better."),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSectionDescription(String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        description,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, size: 20, color: Colors.green),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
