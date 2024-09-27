import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: OnboardingViewBody(),
      backgroundImage: AppAssets.onboardingSecond,
    );
  }
}
