import 'package:exo_planets/core/helpers/constants.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'onboarding_skip_button.dart';

class OnBoardingPageBody extends StatelessWidget {
  final int index;
  const OnBoardingPageBody({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          vGap(36),
          const Align(
              alignment: Alignment.centerRight, child: OnBoardingSkipButton()),
          vGap(138),
          Constants.onBoardingItems[index].richText,
          vGap(32),
          Text(
            Constants.onBoardingItems[index].description,
            style: AppTextStyles.font26WhiteW600,
          ),
          vGap(113.h),
        ],
      ),
    );
  }
}
