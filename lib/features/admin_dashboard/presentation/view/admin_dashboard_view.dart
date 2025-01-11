import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ailav/features/admin_dashboard/presentation/view_model/admin_dashboard_cubit.dart';
import 'package:ailav/features/admin_dashboard/presentation/view_model/admin_dashboard_state.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminDashboardCubit(),
      child: BlocBuilder<AdminDashboardCubit, AdminDashboardState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Admin Dashboard'),
              centerTitle: true,
            ),
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
                  label: 'Order',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined),
                  label: 'User',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: 'Settings',
                ),
              ],
              currentIndex: state.selectedIndex,
              backgroundColor: Colors.blueAccent,
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.black,
              onTap: (index) {
                context.read<AdminDashboardCubit>().onTabTapped(index);
              },
            ),
          );
        },
      ),
    );
  }
}
