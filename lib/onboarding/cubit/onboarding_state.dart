part of 'onboarding_cubit.dart';

final class OnboardingState extends Equatable {
  const OnboardingState({this.isFirstDownload = true});

  final bool isFirstDownload;

  OnboardingState copyWith({bool? isFirstDownload}) {
    return OnboardingState(
      isFirstDownload: isFirstDownload ?? this.isFirstDownload,
    );
  }

  @override
  List<Object> get props => [isFirstDownload];
}
