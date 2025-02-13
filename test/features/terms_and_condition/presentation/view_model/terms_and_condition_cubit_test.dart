import 'package:ailav/features/terms_and_condition/presentation/view_model/terms_and_condition_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TermsAndConditionCubit', () {
    test('initial state is TermsAndConditionInitial', () {
      // Arrange & Act
      final cubit = TermsAndConditionCubit();

      // Assert
      expect(cubit.state, TermsAndConditionInitial());
    });

  });
}
