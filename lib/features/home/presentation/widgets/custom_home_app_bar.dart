import 'package:flutter/material.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/helpers/app_assets.dart';


class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 46,
        decoration: const BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          children: [
           const Spacer(
              flex: 3,
            ),
            Image.asset(
              AppAssets.appBarLogo,
            ),
            hGap(20),
          const  Spacer(
              flex: 1,
            ),
            ClipOval(
              child: Image.asset(
                AppAssets.appBarProfile,
                fit: BoxFit.cover,
              ),
            )
          ],
        ));
  }
}
