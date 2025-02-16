import 'package:ailav/features/terms_and_condition/presentation/view/terms_and_condition_view.dart';
import 'package:ailav/features/terms_and_condition/presentation/view_model/terms_and_condition_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<void> {
  SettingCubit(this._termCubit) : super(null);

  final TermsAndConditionCubit _termCubit;

  Future<void> navigateToTermsPage(BuildContext context) async {
    if (context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _termCubit,
            child: const TermsAndConditionView(),
          ),
        ),
      );
    }
  }
}
