import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget bottomNavBarItem(
    String image, String label, int bottomIndex, int selectedIndex) {
  return SizedBox(
    width: 48.0.w,
    height: 48.0.h,
    child: Column(
      children: [
        SvgPicture.asset(
          width: 22.0.w,
          height: 22.0.h,
          colorFilter: ColorFilter.mode(
            selectedIndex == bottomIndex ? AppColors.lightRed : AppColors.grey,
            BlendMode.srcIn,
          ),
          image,
        ),
        vGap(4.0),
        Text(label,
            style: AppTextStyles.font10WhiteNormal.copyWith(
              color: selectedIndex == bottomIndex
                  ? AppColors.lightRed
                  : AppColors.grey,
            )),
      ],
    ),
  );
}
