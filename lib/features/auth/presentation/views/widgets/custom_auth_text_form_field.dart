import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';

class CustomAuthTextFormField extends StatelessWidget {
  final String hintText;
  final IconData suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomAuthTextFormField(
      {super.key,
      required this.hintText,
      required this.suffixIcon,
      required this.controller,
      this.validator,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText,
        controller: controller,
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 18.w, vertical: 17.h),
          hintText: hintText,
          hintStyle:
              AppTextStyles.font15WhiteW500.copyWith(color: AppColors.grey),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Icon(
              suffixIcon,
              size: 22.r,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.white, width: 2),
            borderRadius: BorderRadius.circular(
              12.r,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.white, width: 2),
            borderRadius: BorderRadius.circular(
              12.r,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.white, width: 2),
            borderRadius: BorderRadius.circular(
              12.r,
            ),
          ),
        ));
  }
}
