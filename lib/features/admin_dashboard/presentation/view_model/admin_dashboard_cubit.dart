import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ailav/features/admin_dashboard/presentation/view_model/admin_dashboard_state.dart';

class AdminDashboardCubit extends Cubit<AdminDashboardState> {
  AdminDashboardCubit() : super(AdminDashboardState.initial());

  /// Update the selected tab index
  void onTabTapped(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
