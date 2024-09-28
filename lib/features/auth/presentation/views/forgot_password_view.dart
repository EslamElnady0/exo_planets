import 'package:exo_planets/core/helpers/app_assets.dart';
import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'widgets/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      backgroundImage: AppAssets.signInUpBackground,
      body: ForgotPasswordViewBody(),
    );
  }
}
