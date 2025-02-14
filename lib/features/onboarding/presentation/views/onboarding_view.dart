import 'package:flutter/material.dart';
import 'package:fruit_hub/features/onboarding/presentation/widgets/onboarding_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: const OnboardingBody()),
    );
  }
}
