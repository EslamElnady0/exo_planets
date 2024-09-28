import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/helpers/show_toast.dart';
import 'package:exo_planets/core/routes/app_router.dart';
import 'package:exo_planets/core/widgets/custom_button.dart';
import 'package:exo_planets/features/auth/presentation/view%20models/signup%20cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';

class SignUpButtonBlocConsumer extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const SignUpButtonBlocConsumer(
      {super.key,
      required this.formKey,
      required this.firstNameController,
      required this.lastNameController,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          showToast(toastMsg: "Sign Up Successful", state: ToastStates.success);
          context.pushNamedAndRemoveUntil(AppRouter.home,
              predicate: (_) => false);
        } else if (state is SignupFailure) {
          showToast(toastMsg: state.error, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        if (state is SignupLoading) {
          return CustomButton(
            onTap: () {},
            text: "Sign Up",
            child: Center(
              child: SizedBox(
                width: 29.w,
                height: 29.h,
                child: const CircularProgressIndicator(
                  color: AppColors.white,
                ),
              ),
            ),
          );
        }
        return CustomButton(
          onTap: () {
            if (formKey.currentState!.validate()) {
              context.read<SignupCubit>().signup(
                  email: emailController.text,
                  password: passwordController.text,
                  name:
                      "${firstNameController.text} ${lastNameController.text}");
            }
          },
          text: "Sign Up",
        );
      },
    );
  }
}
