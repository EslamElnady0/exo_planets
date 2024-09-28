import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(AppAssets.onboardingFirst), context);
    precacheImage(const AssetImage(AppAssets.onboardingSecond), context);
    precacheImage(const AssetImage(AppAssets.onboardingThird), context);
    precacheImage(const AssetImage(AppAssets.onboardingThird), context);
    precacheImage(const AssetImage(AppAssets.authBackground), context);
    return const CustomScaffold(
      body: SplashViewBody(),
      backgroundImage: AppAssets.splashBg,
    );
  }
}
