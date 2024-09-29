import 'package:flutter/material.dart';
import '../../manager/home_cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exo_planets/core/helpers/spacing.dart';
import 'package:exo_planets/core/theme/app_text_styles.dart';
import 'package:exo_planets/features/home/data/static/static_planet_data.dart';
import 'package:exo_planets/features/home/presentation/widgets/custom_plenet_view.dart';
import 'package:exo_planets/features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:exo_planets/features/home/presentation/widgets/custom_navigation_row.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocBuilder<HomeCubit, int>(
          builder: (context, currentPage) {
            final pageController = PageController(initialPage: currentPage);

            void nextPage() {
              context.read<HomeCubit>().nextPage(planetData.length);
              pageController.animateToPage(
                currentPage + 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }

            void previousPage() {
              context.read<HomeCubit>().previousPage();
              pageController.animateToPage(
                currentPage - 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vGap(16),
                const CustomHomeAppBar(),
                vGap(40),
                Text(
                  "HiAdel,",
                  style: AppTextStyles.font14GrayW400,
                ),
                Text(
                  "Which planet",
                  style: AppTextStyles.font20WhiteW600,
                ),
                Row(
                  children: [
                    Text(
                      "would you",
                      style: AppTextStyles.font20WhiteW600,
                    ),
                    Text(
                      " like to explore?",
                      style: AppTextStyles.font20RedW600,
                    ),
                  ],
                ),
                CustomPlanetView(pageController: pageController),
                CustomNavigationRow(
                  title: planetData[currentPage].title,
                  subtitle: planetData[currentPage].subtitle,
                  onPreviousPage: previousPage,
                  onNextPage: nextPage,
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}
