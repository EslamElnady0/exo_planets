import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/widgets/custom_button.dart';
import 'package:exo_planets/features/auth/presentation/views/widgets/auth_header.dart';
import 'package:exo_planets/features/auth/presentation/views/widgets/custom_auth_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_text_styles.dart';
import 'bottom_screen_actions.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const AuthHeader(),
            Text("Enter your email address to reset your password",
                style: AppTextStyles.font12WhiteW600),
            vGap(170),
            CustomAuthTextFormField(
                hintText: "Email",
                suffixIcon: Icons.email_outlined,
                controller: emailController),
            vGap(20),
            CustomButton(
                text: "Send",
                onTap: () {
                  if (formKey.currentState!.validate()) {}
                }),
            const Spacer(),
            vGap(40),
            const BottomScreenActions(
              backExists: true,
              skipExists: false,
            ),
            vGap(20)
          ],
        ),
      ),
    );
  }
}
