import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:ailav/features/home/presentation/view_model/home_cubit.dart';
import 'package:ailav/features/home/presentation/view_model/home_state.dart';
import 'package:ailav/features/cart/presentation/view_model/cart_bloc.dart';
import 'package:ailav/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:ailav/features/setting/presentation/view_model/setting_cubit.dart';
import 'package:mocktail/mocktail.dart';

class MockCartBloc extends Mock implements CartBloc {}
class MockProfileCubit extends Mock implements ProfileCubit {}
class MockSettingCubit extends Mock implements SettingCubit {}

void main() {
  final getIt = GetIt.instance;

  setUp(() {
    // Register mocks to satisfy HomeState.initial()
    getIt.registerFactory<CartBloc>(() => MockCartBloc());
    getIt.registerFactory<ProfileCubit>(() => MockProfileCubit());
    getIt.registerFactory<SettingCubit>(() => MockSettingCubit());
  });

  tearDown(() {
    getIt.reset();
  });

  group('HomeCubit', () {
    test('initial state has selectedIndex 0', () {
      final cubit = HomeCubit();
      expect(cubit.state.selectedIndex, 0);
    });

    blocTest<HomeCubit, HomeState>(
      'emits a state with updated selectedIndex when onTabTapped is called',
      build: () => HomeCubit(),
      act: (cubit) => cubit.onTabTapped(2),
      expect: () => [
        isA<HomeState>().having((s) => s.selectedIndex, 'selectedIndex', 2)
      ],
    );
  });
}
