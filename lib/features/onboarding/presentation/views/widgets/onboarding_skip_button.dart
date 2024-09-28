import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/helpers/shared_pref_helper.dart';
import 'package:exo_planets/core/routes/app_router.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamedAndRemoveUntil(AppRouter.auth,
            predicate: (_) => false);
        SharedPrefHelper.setData("isOnBoardingViewed", true);
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 7.h),
      ),
      child: Text(
        "Skip",
        style: AppTextStyles.font19WhiteW600,
      ),
    );
  }
}
