import 'package:exo_planets/core/helpers/constants.dart';
import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/features/onboarding/presentation/ui%20cubit/cubit/onboarding_cubit.dart';
import 'package:exo_planets/features/onboarding/presentation/views/widgets/indicator_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController _indicatorController;
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(
      initialPage: context.read<OnboardingCubit>().currentIndex,
    );
    _indicatorController = PageController(
      initialPage: context.read<OnboardingCubit>().currentIndex,
      viewportFraction: 0.3,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _indicatorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: context.height,
              width: context.width,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: Constants.onBoardingItems.length,
                  itemBuilder: (context, index) => Image.asset(
                        Constants.onBoardingItems[index].backgroundImage,
                        height: context.height,
                        width: context.width,
                        fit: BoxFit.cover,
                      )),
            ),
            context.read<OnboardingCubit>().currentIndex == 3
                ? const SizedBox.shrink()
                : Positioned(
                    bottom: 48.h,
                    child: IndicatorPageView(
                      indicatorController: _indicatorController,
                      pageController: _pageController,
                    ))
          ],
        );
      },
    );
  }
}
