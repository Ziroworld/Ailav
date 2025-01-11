import 'package:ailav/features/home/presentation/view_model/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  /// Update the selected tab index
  void onTabTapped(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
