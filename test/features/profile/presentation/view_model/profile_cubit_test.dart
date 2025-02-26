import 'package:ailav/features/auth/presentation/view_model/update_user/my_information_bloc.dart';
import 'package:ailav/features/help/presentation/view/help_view.dart';
import 'package:ailav/features/help/presentation/view_model/help_cubit.dart';
import 'package:ailav/features/order_view/presentation/view/view_order.dart';
import 'package:ailav/features/order_view/presentation/view_model/order_view_cubit.dart';
import 'package:ailav/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:ailav/features/support/presentation/view/support_view.dart';
import 'package:ailav/features/support/presentation/view_model/support_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

/// Fake Route for fallback registration.
class FakeRoute extends Fake implements Route<dynamic> {}

/// Dummy implementation for MyInformationBloc to avoid GetIt errors.
class FakeMyInformationBloc extends Fake implements MyInformationBloc {}

/// Mocks for cubit dependencies.
class MockOrderViewCubit extends Mock implements OrderViewCubit {}

class MockMyInformationBloc extends Mock implements MyInformationBloc {}

class MockHelpCubit extends Mock implements HelpCubit {}

class MockSupportCubit extends Mock implements SupportCubit {}

void main() {
  // Register fallback and dummy instance before any tests run.
  setUpAll(() {
    registerFallbackValue(FakeRoute());
    GetIt.I.registerSingleton<MyInformationBloc>(FakeMyInformationBloc());
  });

  // Clean up after all tests.
  tearDownAll(() {
    GetIt.I.reset();
  });

  late ProfileCubit profileCubit;
  late MockOrderViewCubit mockOrderViewCubit;
  late MockMyInformationBloc mockMyInformationBloc;
  late MockHelpCubit mockHelpCubit;
  late MockSupportCubit mockSupportCubit;

  setUp(() {
    mockOrderViewCubit = MockOrderViewCubit();
    mockMyInformationBloc = MockMyInformationBloc();
    mockHelpCubit = MockHelpCubit();
    mockSupportCubit = MockSupportCubit();
    profileCubit = ProfileCubit(
      orderViewCubit: mockOrderViewCubit,
      myInformationBloc: mockMyInformationBloc,
      help: mockHelpCubit,
      support: mockSupportCubit,
    );
  });

  testWidgets('navigateToOrder pushes ViewOrder route', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: ElevatedButton(
            onPressed: () => profileCubit.navigateToOrder(context),
            child: const Text('Go Order'),
          ),
        ),
      ),
    ));

    expect(find.byType(ViewOrder), findsNothing);
    await tester.tap(find.text('Go Order'));
    await tester.pumpAndSettle();
    expect(find.byType(ViewOrder), findsOneWidget);
  });

  testWidgets('navigateToHelp pushes HelpView route', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: ElevatedButton(
            onPressed: () => profileCubit.navigateToHelp(context),
            child: const Text('Go Help'),
          ),
        ),
      ),
    ));

    expect(find.byType(HelpView), findsNothing);
    await tester.tap(find.text('Go Help'));
    await tester.pumpAndSettle();
    expect(find.byType(HelpView), findsOneWidget);
  });

  testWidgets('navigateToSupport pushes SupportView route', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: ElevatedButton(
            onPressed: () => profileCubit.navigateToSupport(context),
            child: const Text('Go Support'),
          ),
        ),
      ),
    ));

    expect(find.byType(SupportView), findsNothing);
    await tester.tap(find.text('Go Support'));
    await tester.pumpAndSettle();
    expect(find.byType(SupportView), findsOneWidget);
  });
}
