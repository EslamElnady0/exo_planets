import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/theme/app_colors.dart';
import 'package:exo_planets/features/home/presentation/views/home_view.dart';
import 'package:exo_planets/features/home/presentation/widgets/bottom_nav_bar_background.dart';
import 'package:exo_planets/features/home/presentation/widgets/leaders_board_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bottom_nav_bar_item.dart';

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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: SizedBox(
          height: 72.0.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const BottomNavBarBackground(),

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
                        padding:
                            EdgeInsets.only(right: rowIndex == 1 ? 54.w : 0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = rowIndex;
                              index = rowIndex;
                            });
                          },
                          child: bottomNavBarItem(images[rowIndex],
                              labels[rowIndex], rowIndex, selectedIndex),
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
                child: const LeadersBoardWidget(),
              )
            ],
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
