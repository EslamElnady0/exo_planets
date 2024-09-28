import 'package:exo_planets/core/helpers/constants.dart';
import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import 'onboarding_page_body.dart';

class OnBoardingPagesPageView extends StatelessWidget {
  final PageController pageController;
  const OnBoardingPagesPageView({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height,
      width: context.width,
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: Constants.onBoardingItems.length,
          itemBuilder: (context, index) => Container(
              height: context.height,
              width: context.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  Constants.onBoardingItems[index].backgroundImage,
                ),
                fit: BoxFit.cover,
              )),
              child: OnBoardingPageBody(
                index: index,
              ))),
    );
  }
}
