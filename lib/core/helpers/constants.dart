import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../features/onboarding/presentation/ui model/on_boarding_item.dart';

class Constants {
  const Constants._();

  static const List<String> onBoardingBachground = [
    AppAssets.onboardingFirst,
    AppAssets.onboardingSecond,
    AppAssets.onboardingThird,
    AppAssets.onboardingFourth
  ];
  static const LinearGradient customRedGradient = LinearGradient(
      colors: [
        AppColors.lightRed,
        AppColors.darkerRed,
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0, 1]);
  static List<OnBoardingItem> onBoardingItems = [
    OnBoardingItem(
        description:
            "Engage with interactive tools to visualize and understand the uniqueness of each exoplanet.",
        backgroundImage: AppAssets.onboardingFirst),
    OnBoardingItem(
        description:
            "Engage with interactive tools to visualize and understand the uniqueness of each exoplanet.",
        backgroundImage: AppAssets.onboardingSecond),
    OnBoardingItem(
        description:
            "Test your knowledge with quizzes and games designed to expand your understanding of the universe.",
        backgroundImage: AppAssets.onboardingThird),
    OnBoardingItem(
        description:
            "Begin your journey into the mysteries of the cosmos and start exploring the wonders of exoplanets today!",
        backgroundImage: AppAssets.onboardingFourth),
  ];
}
