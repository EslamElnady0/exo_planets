import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_styles.dart';

class AuthViewTexts extends StatelessWidget {
  const AuthViewTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        vGap(38),
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "Let’s float in ",
              style: AppTextStyles.font40RedW600,
            ),
            TextSpan(
                text: "Universe",
                style: AppTextStyles.font63WhiteW600.copyWith(height: 1.1))
          ]),
        ),
        vGap(106),
        Padding(
          padding: EdgeInsets.only(right: 24.w),
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "Welcome\n",
              style: AppTextStyles.font40RedW600,
            ),
            TextSpan(
                text:
                    "Unlock a universe of knowledge and adventure with your Unlock the mysteries of the universe — ",
                style: AppTextStyles.font26WhiteW600.copyWith(height: 1.36)),
            TextSpan(
                text: "log in ",
                style: AppTextStyles.font26WhiteW600
                    .copyWith(height: 1.36, color: AppColors.lightRed)),
            TextSpan(
                text: "now and start ",
                style: AppTextStyles.font26WhiteW600.copyWith(
                  height: 1.36,
                )),
            TextSpan(
                text: "exploring ",
                style: AppTextStyles.font26WhiteW600
                    .copyWith(height: 1.36, color: AppColors.lightRed)),
            TextSpan(
                text: "distant worlds!",
                style: AppTextStyles.font26WhiteW600.copyWith(
                  height: 1.36,
                )),
          ])),
        ),
        vGap(36),
      ],
    );
  }
}
