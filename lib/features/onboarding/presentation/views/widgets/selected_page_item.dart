import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../ui cubit/cubit/onboarding_cubit.dart';

class SelectedPageItem extends StatelessWidget {
  final int index;
  final PageController pageController;
  final PageController indicatorController;
  const SelectedPageItem(
      {super.key,
      required this.index,
      required this.pageController,
      required this.indicatorController});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<OnboardingCubit>().changeIndex(index + 1);

        indicatorController.animateToPage(index + 1,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
        pageController.animateToPage(index + 1,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
      child: Container(
        height: 90.h,
        width: 90.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: Constants.customRedGradient,
        ),
        child: Center(
            child: SvgPicture.asset(
          AppAssets.arrowForward,
          height: 18.h,
          width: 28.w,
        )),
      ),
    );
  }
}
