import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'onboarding_skip_button.dart';

class OnBoardingPageBody extends StatelessWidget {
  const OnBoardingPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          vGap(36),
          const Align(
              alignment: Alignment.centerRight, child: OnBoardingSkipButton()),
        ],
      ),
    );
  }
}
