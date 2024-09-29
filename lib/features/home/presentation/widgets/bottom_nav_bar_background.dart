import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/inner_shadow.dart';

class BottomNavBarBackground extends StatelessWidget {
  const BottomNavBarBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      shadows: [
        BoxShadow(
          offset: const Offset(0, 0),
          blurRadius: 16,
          color: AppColors.black.withOpacity(0.25),
        ),
      ],
      child: SvgPicture.asset(
        width: double.infinity,
        AppAssets.bottomNavBackground,
      ),
    );
  }
}
