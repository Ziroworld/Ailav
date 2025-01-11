import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ailav/features/admin_dashboard/presentation/view/bottom_navigation/order_screen_view.dart';
import 'package:ailav/features/admin_dashboard/presentation/view/bottom_navigation/user_screen_view.dart';
import 'package:ailav/features/home/presentation/view/bottom_navigation/home_screen_view.dart';
import 'package:ailav/features/home/presentation/view/bottom_navigation/setting_screen_view.dart';

class AdminDashboardState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const AdminDashboardState({
    required this.selectedIndex,
    required this.views,
  });

  /// Initial state with predefined views
  static AdminDashboardState initial() {
    return const AdminDashboardState(
      selectedIndex: 0,
      views: [
        HomeScreenView(),
        OrderScreenView(),
        UserScreenView(),
        SettingScreenView(),
      ],
    );
  }

  /// Create a new state with updated properties
  AdminDashboardState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return AdminDashboardState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}
