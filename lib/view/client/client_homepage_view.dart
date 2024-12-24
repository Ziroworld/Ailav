import 'package:ailav/view/client/bottom_navigation/cart_screen_view.dart';
import 'package:ailav/view/client/bottom_navigation/home_screen_view.dart';
import 'package:ailav/view/client/bottom_navigation/profile_screen_view.dart';
import 'package:ailav/view/client/bottom_navigation/setting_screen_view.dart';
import 'package:flutter/material.dart';

class ClientHomepageView extends StatefulWidget {
  const ClientHomepageView({super.key});

  @override
  State<ClientHomepageView> createState() => _ClientHomepageViewState();
}

class _ClientHomepageViewState extends State<ClientHomepageView> {
  int _selectedIndex = 0;

  // List of screens for bottom navigation
  final List<Widget> _lstBottomScreen = [
    const HomeScreenView(),
    const CartScreenView(),
    const ProfileScreenView(),
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
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
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
