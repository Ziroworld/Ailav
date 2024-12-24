import 'package:flutter/material.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DELIVER TO',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Text(
              'Home - 15/4 Roadway',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for drink',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              child: PageView(
                children: [
                  Image.asset('assets/images/offer1.png', fit: BoxFit.cover),
                  Image.asset('assets/images/offer2.png', fit: BoxFit.cover),
                  Image.asset('assets/images/offer3.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Explore Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryItem('Whisky', Icons.local_drink),
                _buildCategoryItem('Beer', Icons.sports_bar),
                _buildCategoryItem('Rum', Icons.liquor),
                _buildCategoryItem('Sparkler', Icons.wine_bar),
                _buildCategoryItem('Vodka', Icons.emoji_food_beverage),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Popular Liquor',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildPopularItem(
              'Smirnoff Lemon Vodka',
              '375ml Can | 5%',
              'assets/images/smirnoff.png',
              '\$2.98',
            ),
            _buildPopularItem(
              'Jack Daniel’s Cola Whiskey',
              '330ml Can | 6%',
              'assets/images/jackdaniel.png',
              '\$3.98',
              stockMessage: '10 left in Stock',
            ),
            _buildPopularItem(
              'Johnnie Walker Red Label',
              '375ml Can | 5%',
              'assets/images/johnniewalker.png',
              '\$1.98',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[200],
          child: Icon(icon, size: 30, color: Colors.black),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildPopularItem(
      String title, String subtitle, String imagePath, String price,
      {String? stockMessage}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.contain),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                if (stockMessage != null)
                  Text(
                    stockMessage,
                    style: const TextStyle(fontSize: 12, color: Colors.red),
                  ),
              ],
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
