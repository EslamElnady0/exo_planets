import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/routes/app_router.dart';
import 'package:exo_planets/core/widgets/custom_button.dart';
import 'package:exo_planets/features/auth/presentation/views/widgets/custom_hollow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'auth_view_texts.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthViewTexts(),
          CustomHollowButton(
            text: "Log In",
            onTap: () {
              context.pushNamed(AppRouter.logIn);
            },
            style: AppTextStyles.font21WhiteW500
                .copyWith(letterSpacing: 1.5, fontWeight: FontWeight.w600),
          ),
          vGap(24),
          CustomButton(
              text: "Sign Up",
              onTap: () {
                context.pushNamed(AppRouter.signUp);
              },
              style: AppTextStyles.font21WhiteW500
                  .copyWith(letterSpacing: 1.5, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
