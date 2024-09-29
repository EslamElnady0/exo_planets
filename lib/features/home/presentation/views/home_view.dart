import 'package:flutter/material.dart';
import '../widgets/home_view_body.dart';
import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      extendBody: true,
      backgroundImage: AppAssets.homeBackGround,
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
