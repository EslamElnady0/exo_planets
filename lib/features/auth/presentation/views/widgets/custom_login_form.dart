import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:exo_planets/core/widgets/custom_button.dart';
import 'package:exo_planets/features/auth/presentation/views/widgets/custom_auth_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routes/app_router.dart';
import 'auth_header.dart';

class CustomLoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const CustomLoginForm(
      {super.key,
      required this.formKey,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const AuthHeader(),
          CustomAuthTextFormField(
              hintText: "Email",
              controller: emailController,
              suffixIcon: Icons.email_outlined),
          vGap(16),
          CustomAuthTextFormField(
              hintText: "Password",
              controller: passwordController,
              suffixIcon: Icons.lock_outline),
          vGap(10),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
                onPressed: () {
                  context.pushNamed(AppRouter.forgotPassword);
                },
                child: Text(
                  "Forgot your password?",
                  style: AppTextStyles.font12WhiteW600,
                )),
          ),
          vGap(10),
          CustomButton(
              text: "Log In",
              onTap: () {
                if (formKey.currentState!.validate()) {}
              })
        ],
      ),
    );
  }
}
