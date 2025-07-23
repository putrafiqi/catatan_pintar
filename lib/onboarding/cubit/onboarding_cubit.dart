import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final _prefKey = 'isFirstDownload';
  final SharedPreferences _pref;
  OnboardingCubit(SharedPreferences pref)
    : _pref = pref,
      super(OnboardingState()) {
    final isFirstDownload = _pref.getBool(_prefKey);
    emit(state.copyWith(isFirstDownload: isFirstDownload));
  }

  void getStartedPressed() async {
    await _pref.setBool(_prefKey, false);
    emit(state.copyWith(isFirstDownload: _pref.getBool(_prefKey)));
  }
}
