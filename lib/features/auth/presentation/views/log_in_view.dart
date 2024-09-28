import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:exo_planets/features/auth/presentation/views/widgets/log_in_view_body.dart';
import 'package:flutter/material.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: LogInViewBody(),
      backgroundImage: AppAssets.signInUpBackground,
    );
  }
}
