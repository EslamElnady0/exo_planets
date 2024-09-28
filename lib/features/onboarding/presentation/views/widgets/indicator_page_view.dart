import 'package:exo_planets/core/helpers/constants.dart';
import 'package:exo_planets/features/onboarding/presentation/ui%20cubit/cubit/onboarding_cubit.dart';
import 'package:exo_planets/features/onboarding/presentation/views/widgets/selected_page_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'un_selected_page_item.dart';

class IndicatorPageView extends StatelessWidget {
  final PageController pageController;
  final PageController indicatorController;
  const IndicatorPageView(
      {super.key,
      required this.pageController,
      required this.indicatorController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: 308.w,
      child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: indicatorController,
          scrollDirection: Axis.horizontal,
          itemCount: Constants.onBoardingItems.length,
          itemBuilder: (context, index) =>
              context.read<OnboardingCubit>().currentIndex == index
                  ? SelectedPageItem(
                      index: index,
                      pageController: pageController,
                      indicatorController: indicatorController,
                    )
                  : UnSelectedPageItem(
                      index: index,
                      pageController: pageController,
                      indicatorController: indicatorController,
                    )),
    );
  }
}
