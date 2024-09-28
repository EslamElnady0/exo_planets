import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/helpers/extensions.dart';
import 'package:exo_planets/core/helpers/shared_pref_helper.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routes/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _logoSlideAnimation;
  late Animation<Offset> _eImageSlideAnimation;
  late Animation<Offset> _oImageSlideAnimation;
  late Animation<Offset> _textSlideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController for all animations
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Total duration set to 3 seconds
    );

    // Opacity animation from 0.8 to 0.6 (duration: 3 seconds)
    _opacityAnimation =
        Tween<double>(begin: 0.8, end: 0.6).animate(_controller);

    // Slide animation for the logo from top to center (1.8 seconds)
    _logoSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -10),
      end: const Offset(0, -0.12),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
      ),
    );

    // Slide animation for eImage from left to center (0.9 seconds starting after 1.8 seconds)
    _eImageSlideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0.374, -0.047),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.9, curve: Curves.easeInOut),
      ),
    );

    // Slide animation for oImage from right to center (0.9 seconds starting after 1.8 seconds)
    _oImageSlideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(-0.376, -0.049),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.9, curve: Curves.easeInOut),
      ),
    );

    // Slide animation for the text from bottom to below center (0.3 seconds, starts after 2.7 seconds)
    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.9, 1.0, curve: Curves.easeInOut),
      ),
    );

    // Start the animation
    _controller.forward();

    Future.delayed(const Duration(milliseconds: 3500), () async {
      context.pushReplacementNamed(
        await SharedPrefHelper.getBool("isOnBoardingViewed")
            ? AppRouter.auth
            : AppRouter.onboarding,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: [
            Container(
              color: AppColors.black.withOpacity(_opacityAnimation.value),
            ),

            SlideTransition(
              position: _eImageSlideAnimation,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Transform.scale(
                  scale: 1.1,
                  child: Image.asset(
                    AppAssets.eImage,
                    height: 47.h,
                    width: 33.w,
                  ),
                ),
              ),
            ),
            // oImage sliding from the right
            SlideTransition(
              position: _oImageSlideAnimation,
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  AppAssets.oImage,
                  height: 47.h,
                  width: 32.w,
                ),
              ),
            ),

            Center(
              child: SlideTransition(
                position: _logoSlideAnimation,
                child: Image.asset(
                  AppAssets.xPlanetsSplash,
                  height: 108.h,
                  width: 216.w,
                ),
              ),
            ),
            SlideTransition(
              position: _textSlideAnimation,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 60.h,
                  ),
                  child: Text(
                    "NASA International Space Apps Challenge",
                    style: AppTextStyles.font10WhiteW600,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
