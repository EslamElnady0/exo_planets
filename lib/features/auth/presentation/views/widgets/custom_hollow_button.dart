import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/theme/app_text_styles.dart';

class CustomHollowButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final VoidCallback onTap;
  const CustomHollowButton(
      {super.key, required this.text, this.style, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 18.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppColors.white, width: 2)),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: style ??
                  AppTextStyles.font21WhiteW500.copyWith(letterSpacing: 1.5),
            ),
            hGap(10),
            SvgPicture.asset(
              AppAssets.arrowForward,
              width: 22.w,
              height: 14.h,
            )
          ],
        ),
      ),
    );
  }
}
