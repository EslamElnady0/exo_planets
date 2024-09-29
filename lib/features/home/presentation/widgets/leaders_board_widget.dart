import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/inner_shadow.dart';

class LeadersBoardWidget extends StatelessWidget {
  const LeadersBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: InkWell(
        onTap: () {
          // routing to main here...
        },
        child: InnerShadow(
          shadows: [
            BoxShadow(
              offset: const Offset(0, 2.1),
              blurRadius: 5.3,
              color: AppColors.black.withOpacity(0.25),
            ),
          ],
          child: SvgPicture.asset(
            width: 50.0.w,
            height: 50.0.w,
            fit: BoxFit.fill,
            AppAssets.main,
          ),
        ),
      ),
    );
  }
}
