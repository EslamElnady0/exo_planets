import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class LatoTextStyle extends TextStyle {
  const LatoTextStyle({
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.color,
    super.letterSpacing,
    super.height,
    super.decoration,
  }) : super(
          fontFamily: 'Lato',
        );
}

class AppTextStyles {
  const AppTextStyles._();

  //naming ==> fontSizeColorWeight
  static TextStyle font20DarkW600 = LatoTextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  static TextStyle font15WhiteW500 = LatoTextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static TextStyle font12WhiteW600 = LatoTextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle font10WhiteW600 = LatoTextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle font19WhiteW600 = LatoTextStyle(
    fontSize: 19.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle font21WhiteW500 = LatoTextStyle(
    fontSize: 21.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static TextStyle font50WhiteW600 = LatoTextStyle(
    fontSize: 50.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle font40RedW600 = LatoTextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.lightRed,
  );
  static TextStyle font63WhiteW600 = LatoTextStyle(
    fontSize: 63.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle font26WhiteW600 = LatoTextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
}
