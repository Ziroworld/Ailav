import 'package:ailav/view/admin/bottom_navigation/setting_screen_view.dart';
import 'package:ailav/view/admin/bottom_navigation/order_screen_view.dart';
import 'package:ailav/view/admin/bottom_navigation/home_screen_view.dart';
import 'package:ailav/view/admin/bottom_navigation/user_screen_view.dart';
import 'package:flutter/material.dart';

class AdminDashboardView extends StatefulWidget {
  const AdminDashboardView({super.key});

  @override
  State<AdminDashboardView> createState() => _AdminDashboardViewState();
}

class _AdminDashboardViewState extends State<AdminDashboardView> {
  int _selectedIndex = 0;

  // List of screens for bottom navigation
  final List<Widget> _lstBottomScreen = [
    const HomeScreenView(),
    const OrderScreenView(),
    const UserScreenView(),
    const SettingScreenView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _lstBottomScreen[_selectedIndex], // Display selected screen
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopify_rounded),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'About Us',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.blueAccent,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Update selected index
          });
        },
      ),
    );
  }
}
