import 'package:ailav/features/home/presentation/view/bottom_navigation/cart_screen_view.dart';
import 'package:ailav/features/home/presentation/view/bottom_navigation/home_screen_view.dart';
import 'package:ailav/features/home/presentation/view/bottom_navigation/profile_screen_view.dart';
import 'package:ailav/features/home/presentation/view/bottom_navigation/setting_screen_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({
    required this.selectedIndex,
    required this.views,
  });

  /// Initial state with predefined views
  static HomeState initial() {
    return const HomeState(
      selectedIndex: 0,
      views: [
        HomeScreenView(),
        CartScreenView(),
        ProfileScreenView(),
        SettingScreenView(),
      ],
    );
  }

  /// Create a new state with updated properties
  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}
