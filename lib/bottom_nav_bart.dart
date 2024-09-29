import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:exo_planets/core/widgets/inner_shadow.dart';
import 'package:exo_planets/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBarController extends StatefulWidget {
  const BottomNavBarController({super.key});
  @override
  State<BottomNavBarController> createState() => _BottomNavBarControllerState();
}

int selectedIndex = 0;

class _BottomNavBarControllerState extends State<BottomNavBarController> {
  int index = 0;
  bool showAdmin = false;
  List images = [
    AppAssets.home,
    AppAssets.planets,
    AppAssets.quiz,
    AppAssets.settings,
  ];
  List labels = [
    'Home',
    'Planets',
    'Quiz',
    'Settings',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      extendBody: true,
      bottomNavigationBar: InnerShadow(
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.all(16.0.r),
            child: SizedBox(
              height: 72.0.h,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // bottom nav background
                  InnerShadow(
                    shadows: [
                      BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 16,
                        color: AppColors.black.withOpacity(0.25),
                      ),
                    ],
                    child: SvgPicture.asset(
                      width: double.infinity,
                      AppAssets.bottomNavBackground,
                    ),
                  ),

                  // bottom nav items
                  Positioned.directional(
                    textDirection: TextDirection.ltr,
                    top: 16.0.h,
                    start: 0,
                    end: 0,
                    bottom: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(4, (rowIndex) {
                          return Padding(
                            padding: EdgeInsets.only(
                                right: rowIndex == 1 ? 54.w : 0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = rowIndex;
                                  index = rowIndex;
                                });
                              },
                              child: bottomNavBarItem(
                                images[rowIndex],
                                labels[rowIndex],
                                rowIndex,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Positioned.directional(
                    textDirection: TextDirection.ltr,
                    start: 0,
                    end: 0,
                    bottom: 32.0.h,
                    child: Align(
                      child: InkWell(
                        onTap: () {
                          // routing to main here...
                        },
                        child: InnerShadow(
                          shadows: [
                            BoxShadow(
                              offset: const Offset(0, 0),
                              blurRadius: 5.3,
                              color: AppColors.black.withOpacity(0.25),
                            ),
                          ],
                          child: SvgPicture.asset(
                            width: 50.0.w,
                            height: 50.0.w,
                            fit: BoxFit.fill,
                            AppAssets.main,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: index,
        children: const [
          HomeView(),
          Scaffold(
            body: Center(
              child: Text('Planets View'),
            ),
          ),
          Scaffold(
            body: Center(
              child: Text('Quiz View'),
            ),
          ),
          Scaffold(
            body: Center(
              child: Text('Settings View'),
            ),
          ),
        ],
      ),
    );
  }
}

Widget bottomNavBarItem(String image, String label, int bottomIndex) {
  return SizedBox(
    width: 48.0.w,
    height: 48.0.h,
    child: Column(
      children: [
        SvgPicture.asset(
          width: 22.0.w,
          height: 22.0.h,
          colorFilter: ColorFilter.mode(
            selectedIndex == bottomIndex ? AppColors.lightRed : AppColors.grey,
            BlendMode.srcIn,
          ),
          image,
        ),
        vGap(4.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 10.0.sp,
            color: selectedIndex == bottomIndex
                ? AppColors.lightRed
                : AppColors.grey,
          ),
        ),
      ],
    ),
  );
}
