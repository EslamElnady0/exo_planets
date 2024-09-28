import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        vGap(20),
        Image.asset(
          AppAssets.exoPlanets,
          height: 108.h,
          width: 216.w,
        ),
        vGap(13),
        Divider(
          height: 1.h,
          color: AppColors.white,
          thickness: 0.5,
        ),
        vGap(34),
      ],
    );
  }
}
