import 'package:flutter/material.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/helpers/validators_regex.dart';
import 'auth_header.dart';
import 'custom_auth_text_form_field.dart';
import 'sign_up_button_bloc_builder.dart';

class CustomSignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController confirmPasswordController;
  const CustomSignUpForm(
      {super.key,
      required this.formKey,
      required this.emailController,
      required this.passwordController,
      required this.firstNameController,
      required this.lastNameController,
      required this.confirmPasswordController});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const AuthHeader(),
          CustomAuthTextFormField(
              hintText: "First Name",
              controller: firstNameController,
              suffixIcon: Icons.person_outline),
          vGap(16),
          CustomAuthTextFormField(
              hintText: "Last Name",
              controller: lastNameController,
              suffixIcon: Icons.person_outline),
          vGap(16),
          CustomAuthTextFormField(
              hintText: "Email",
              controller: emailController,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return "This field is required";
                } else if (!ValidatorsRegex.isEmailValid(p0)) {
                  return "Please enter a valid email";
                }
                return null;
              },
              suffixIcon: Icons.email_outlined),
          vGap(16),
          CustomAuthTextFormField(
              hintText: "Password",
              obscureText: true,
              controller: passwordController,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return "This field is required";
                } else if (!ValidatorsRegex.isPasswordValid(p0)) {
                  return "Please enter a valid password";
                }
                return null;
              },
              suffixIcon: Icons.lock_outline),
          vGap(16),
          CustomAuthTextFormField(
              hintText: "Confirm Password",
              controller: confirmPasswordController,
              obscureText: true,
              validator: (p0) {
                if (p0 == null || p0.isEmpty) {
                  return "This field is required";
                } else if (p0 != passwordController.text) {
                  return "Passwords do not match";
                }
                return null;
              },
              suffixIcon: Icons.lock_outline),
          vGap(30),
          SignUpButtonBlocConsumer(
              formKey: formKey,
              firstNameController: firstNameController,
              lastNameController: lastNameController,
              emailController: emailController,
              passwordController: passwordController),
        ],
      ),
    );
  }
}
