import 'package:catatan_pintar/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnBoardingView();
  }
}

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final introductionKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final pageDecoration = PageDecoration(
      imageFlex: 4,
      imagePadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.only(bottom: 12),
      bodyTextStyle: textTheme.bodyLarge!.copyWith(color: Colors.grey.shade700),
    );
    return IntroductionScreen(
      key: introductionKey,
      done: const Text('Get Started'),
      onDone: () {
        context.read<OnboardingCubit>().getStartedPressed();
      },
      next: const Text('Next'),
      showSkipButton: true,
      skip: const Text('Skip'),
      onSkip: () {
        introductionKey.currentState?.skipToEnd();
      },

      pages: [
        PageViewModel(
          image: SvgPicture.asset('assets/images/onboarding-01.svg'),
          title: 'Selamat Datang di Catatan Pintar',
          body: 'Catat ide Anda dan biarkan AI kami merangkumnya untuk Anda.',
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: SvgPicture.asset('assets/images/onboarding-02.svg'),
          title: 'Ringkasan Instan dengan AI',
          body:
              'Dapatkan intisari catatan panjang secara otomatis. AI membuat Anda tetap fokus pada yang penting.',
          decoration: pageDecoration,
        ),
        PageViewModel(
          image: SvgPicture.asset('assets/images/onboarding-03.svg'),
          title: 'Ringkas, Cerdas, Siap!',
          body:
              'Dengan ringkasan cerdas dari AI, Anda akan selalu siap dan terinformasi. Tingkatkan produktivitas Anda.',
          decoration: pageDecoration,
        ),
      ],
    );
  }
}
