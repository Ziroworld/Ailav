import 'package:ailav/features/FAQ/presentation/view/faq_screen.dart';
import 'package:ailav/features/FAQ/presentation/view_model/faq_cubit.dart';
import 'package:ailav/features/about_us/presentation/view/about_us_screen.dart';
import 'package:ailav/features/about_us/presentation/view_model/about_us_cubit.dart';
import 'package:ailav/features/delivery_charge/presentation/view/delivery_charge_screen.dart';
import 'package:ailav/features/delivery_charge/presentation/view_model/delivery_charge_cubit.dart';
import 'package:ailav/features/feedback/presentation/view/feedback_screen.dart';
import 'package:ailav/features/feedback/presentation/view_model/feedback_cubit.dart';
import 'package:ailav/features/privacy_policy/presentation/view/privacy_policy_screen.dart';
import 'package:ailav/features/privacy_policy/presentation/view_model/privacy_policy_cubit.dart';
import 'package:ailav/features/terms_and_condition/presentation/view/terms_and_condition_view.dart';
import 'package:ailav/features/terms_and_condition/presentation/view_model/terms_and_condition_cubit.dart';
import 'package:ailav/features/setting/presentation/view_model/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFeedbackCubit extends Mock implements FeedbackCubit {}
class MockFaqCubit extends Mock implements FaqCubit {}
class MockAboutUsCubit extends Mock implements AboutUsCubit {}
class MockDeliveryChargeCubit extends Mock implements DeliveryChargeCubit {}
class MockTermsAndConditionCubit extends Mock implements TermsAndConditionCubit {}
class MockPrivacyPolicyCubit extends Mock implements PrivacyPolicyCubit {}

void main() {
  late SettingCubit settingCubit;
  late MockFeedbackCubit mockFeedbackCubit;
  late MockFaqCubit mockFaqCubit;
  late MockAboutUsCubit mockAboutUsCubit;
  late MockDeliveryChargeCubit mockDeliveryChargeCubit;
  late MockTermsAndConditionCubit mockTermsAndConditionCubit;
  late MockPrivacyPolicyCubit mockPrivacyPolicyCubit;

  setUp(() {
    mockFeedbackCubit = MockFeedbackCubit();
    mockFaqCubit = MockFaqCubit();
    mockAboutUsCubit = MockAboutUsCubit();
    mockDeliveryChargeCubit = MockDeliveryChargeCubit();
    mockTermsAndConditionCubit = MockTermsAndConditionCubit();
    mockPrivacyPolicyCubit = MockPrivacyPolicyCubit();

    settingCubit = SettingCubit(
      mockFeedbackCubit,
      mockFaqCubit,
      mockAboutUsCubit,
      mockDeliveryChargeCubit,
      mockTermsAndConditionCubit,
      mockPrivacyPolicyCubit,
    );
  });

  group('SettingCubit Navigation', () {
    testWidgets('navigateToTermsPage pushes TermsAndConditionView', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: ElevatedButton(
              onPressed: () => settingCubit.navigateToTermsPage(context),
              child: const Text('Go Terms'),
            ),
          ),
        ),
      ));

      expect(find.byType(TermsAndConditionView), findsNothing);
      await tester.tap(find.text('Go Terms'));
      await tester.pumpAndSettle();
      expect(find.byType(TermsAndConditionView), findsOneWidget);
    });

    testWidgets('navigateToPrivacyPage pushes PrivacyPolicyView', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: ElevatedButton(
              onPressed: () => settingCubit.navigateToPrivacyPage(context),
              child: const Text('Go Privacy'),
            ),
          ),
        ),
      ));

      expect(find.byType(PrivacyPolicyView), findsNothing);
      await tester.tap(find.text('Go Privacy'));
      await tester.pumpAndSettle();
      expect(find.byType(PrivacyPolicyView), findsOneWidget);
    });

    testWidgets('navigateToDeliveryPage pushes DeliveryChargeView', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: ElevatedButton(
              onPressed: () => settingCubit.navigateToDeliveryPage(context),
              child: const Text('Go Delivery'),
            ),
          ),
        ),
      ));

      expect(find.byType(DeliveryChargeView), findsNothing);
      await tester.tap(find.text('Go Delivery'));
      await tester.pumpAndSettle();
      expect(find.byType(DeliveryChargeView), findsOneWidget);
    });

    testWidgets('navigateToAboutPage pushes AboutUsScreen', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: ElevatedButton(
              onPressed: () => settingCubit.navigateToAboutPage(context),
              child: const Text('Go About'),
            ),
          ),
        ),
      ));

      expect(find.byType(AboutUsScreen), findsNothing);
      await tester.tap(find.text('Go About'));
      await tester.pumpAndSettle();
      expect(find.byType(AboutUsScreen), findsOneWidget);
    });

    testWidgets('navigateToFaqPage pushes FaqScreen', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: ElevatedButton(
              onPressed: () => settingCubit.navigateToFaqPage(context),
              child: const Text('Go FAQ'),
            ),
          ),
        ),
      ));

      expect(find.byType(FaqScreen), findsNothing);
      await tester.tap(find.text('Go FAQ'));
      await tester.pumpAndSettle();
      expect(find.byType(FaqScreen), findsOneWidget);
    });

    testWidgets('navigateToFeedbackPage pushes FeedbackScreen', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: ElevatedButton(
              onPressed: () => settingCubit.navigateToFeedbackPage(context),
              child: const Text('Go Feedback'),
            ),
          ),
        ),
      ));

      expect(find.byType(FeedbackScreen), findsNothing);
      await tester.tap(find.text('Go Feedback'));
      await tester.pumpAndSettle();
      expect(find.byType(FeedbackScreen), findsOneWidget);
    });
  });
}
