import 'package:ailav/features/home/presentation/view_model/home_cubit.dart';
import 'package:ailav/features/home/presentation/view_model/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientHomepageView extends StatelessWidget {
  const ClientHomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: state.views[state.selectedIndex],
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
              currentIndex: state.selectedIndex,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
              backgroundColor: Colors.blueAccent,
              onTap: (index) {
                context.read<HomeCubit>().onTabTapped(index);
              },
            ),
          );
        },
      ),
    );
  }
}
