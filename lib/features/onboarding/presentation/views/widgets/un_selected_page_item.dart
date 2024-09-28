import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/constants.dart';
import '../../ui cubit/cubit/onboarding_cubit.dart';

class UnSelectedPageItem extends StatelessWidget {
  final int index;
  final PageController pageController;
  final PageController indicatorController;
  const UnSelectedPageItem(
      {super.key,
      required this.index,
      required this.pageController,
      required this.indicatorController});

  @override
  Widget build(BuildContext context) {
    return index == 3
        ? const SizedBox.shrink()
        : GestureDetector(
            onTap: () {
              context.read<OnboardingCubit>().changeIndex(index);
              indicatorController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            },
            child: Padding(
              padding: EdgeInsets.all(33.r),
              child: Container(
                decoration: BoxDecoration(
                    gradient:
                        index < context.read<OnboardingCubit>().currentIndex
                            ? Constants.customRedGradient
                            : null,
                    border: Border.all(
                        color:
                            index < context.read<OnboardingCubit>().currentIndex
                                ? Colors.transparent
                                : Colors.white,
                        width: 2),
                    shape: BoxShape.circle),
              ),
            ),
          );
  }
}
