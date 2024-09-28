import 'package:exo_planets/core/widgets/custom_scaffold.dart';
import 'package:exo_planets/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_assets.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: SignUpViewBody(),
      backgroundImage: AppAssets.signInUpBackground,
    );
  }
}
